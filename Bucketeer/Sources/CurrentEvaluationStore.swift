import Foundation
import SQLite3

class CurrentEvaluationStore {
    private enum Query {
        static let fetchAll = "SELECT data, id FROM CurrentEvaluations WHERE userID = :userID;"
        static let save = "INSERT OR REPLACE INTO CurrentEvaluations (id, userID, data) VALUES (:id, :userID, :data);"
        static let delete = "DELETE FROM CurrentEvaluations WHERE id IN (:idList);" // memo: used without bindings
        static let deleteAll = "DELETE FROM CurrentEvaluations;"
    }

    private let db: SQLiteDatabase

    init(db: SQLiteDatabase) {
        self.db = db
    }

    func fetchAll(userID: String, completion: @escaping ([EvaluationEntity]) -> Void) {
        do {
            let stmt = try db.prepareStatement(sql: Query.fetchAll)
            try db.bindText(stmt: stmt, name: ":userID", value: userID)
            var items: [EvaluationEntity] = []
            while (try db.query(stmt: stmt) == SQLITE_ROW) {
                let blob = sqlite3_column_blob(stmt, 0)
                let size = sqlite3_column_bytes(stmt, 0)
                let data = NSData(bytes: blob, length: Int(size)) as Data
                do {
                    let evaluation = try Bucketeer_Feature_Evaluation(serializedData: data)
                    if let entity = EvaluationEntity(evaluation: evaluation) {
                        items.append(entity)
                    }
                } catch {
                    Logger.shared.errorLog(error.localizedDescription)
                }
            }
            try db.finalize(stmt: stmt)
            completion(items)
        } catch {
            Logger.shared.errorLog("Failed to fetchAll CurrentEvaluations: \(error.localizedDescription)")
            completion([])
        }
    }

    func deleteUnused(userID: String, validIDs: [String], completion: (() -> Void)? = nil) {
        do {
            // 1. fetch all
            let stmt = try db.prepareStatement(sql: Query.fetchAll)
            try db.bindText(stmt: stmt, name: ":userID", value: userID)
            var ids: [String] = []
            while (try db.query(stmt: stmt) == SQLITE_ROW) {
                guard let id = sqlite3_column_text(stmt, 1) else {
                    continue
                }
                ids.append(String(cString: id))
            }
            try db.finalize(stmt: stmt)

            // 2. find delete target
            let targetIDs = ids.filter { !validIDs.contains($0) }

            // 3. execute deletion: execute 100 rows per query
            let targetIDsList = targetIDs.chunked(by: 100)
            for targetIDs in targetIDsList {
                let idListStr = targetIDs.map { "'\($0)'" }.joined(separator: ",")
                let sql = Query.delete.replacingOccurrences(of: ":idList", with: idListStr)
                do {
                    let stmt = try db.prepareStatement(sql: sql)
                    try db.execute(stmt: stmt)
                    try db.finalize(stmt: stmt)
                } catch {
                    Logger.shared.errorLog("Failed to delete CurrentEvaluations: \(error.localizedDescription)")
                }
            }
        } catch {
            Logger.shared.errorLog("Failed to delete unused rows of CurrentEvaluations: \(error.localizedDescription)")
        }
        completion?()
    }

    func save(_ entities: [EvaluationEntity], completion: (() -> Void)? = nil) {
        for entity in entities {
            do {
                let stmt = try db.prepareStatement(sql: Query.save)
                try db.bindText(stmt: stmt, name: ":id", value: entity.id)
                try db.bindText(stmt: stmt, name: ":userID", value: entity.userID)
                let bytes = [UInt8](entity.data)
                if sqlite3_bind_blob(stmt, sqlite3_bind_parameter_index(stmt, ":data"), bytes, Int32(bytes.count), nil) != SQLITE_OK {
                    continue
                }
                try db.execute(stmt: stmt)
                try db.finalize(stmt: stmt)
            } catch {
                Logger.shared.errorLog("Failed to save CurrentEvaluations: \(error.localizedDescription)")
                break
            }
        }
        completion?()
    }
}

extension CurrentEvaluationStore {
    // for test
    func deleteAll(completion: (() -> Void)? = nil) {
        do {
            let stmt = try db.prepareStatement(sql: Query.deleteAll)
            try db.execute(stmt: stmt)
            try db.finalize(stmt: stmt)
        } catch {
            Logger.shared.errorLog("Failed to delete CurrentEvaluations: \(error.localizedDescription)")
        }
        completion?()
    }
}

extension Array {
    func chunked(by distance: Int) -> [[Element]] {
        let indicesSequence = stride(from: startIndex, to: endIndex, by: distance)
        let array: [[Element]] = indicesSequence.map {
            let newIndex = $0.advanced(by: distance) > endIndex ? endIndex : $0.advanced(by: distance)
            return Array(self[$0 ..< newIndex])
        }
        return array
    }
}
