import Foundation
import SQLite3

class LatestEvaluationStore {
    private enum Query {
        static let fetchAll = "SELECT data FROM LatestEvaluations WHERE userID = :userID;"
        static let insert = "INSERT INTO LatestEvaluations (id, userID, featureID, data) VALUES (:id, :userID, :featureID, :data);"
        static let insertOrReplace = "INSERT OR REPLACE INTO LatestEvaluations (id, userID, featureID, data) VALUES (:id, :userID, :featureID, :data);"
        static let delete = "DELETE FROM LatestEvaluations WHERE userID = :userID;"
        static let deleteAll = "DELETE FROM LatestEvaluations;"
    }

    private let db: SQLiteDatabase
    private(set) var evaluationEntities: Set<EvaluationEntity> = []  // in-memory data

    init(db: SQLiteDatabase) {
        self.db = db
    }

    func fetch(userID: String, featureID: String) -> EvaluationEntity? {
        if (evaluationEntities.count == 0) {
            // update in-memory data
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
                        return nil
                    }
                }
                try db.finalize(stmt: stmt)
                evaluationEntities = Set(items)
            } catch {
                let message = "(\(Version.number)) Failed to fetchAll LatestEvaluations: \(error.localizedDescription)"
                Logger.shared.errorLog(message)
                return nil
            }
        }
        return evaluationEntities.first(where: { $0.featureID == featureID })
    }

    func replaceAll(userID: String, entities: Set<EvaluationEntity>, completion: @escaping (Result<Void, BucketeerError>) -> Void) {
        evaluationEntities = entities // update in-memory data
            // 1. delete target user's data
        do {
            let deleteStmt = try db.prepareStatement(sql: Query.delete)
            try db.bindText(stmt: deleteStmt, name: ":userID", value: userID)
            try db.execute(stmt: deleteStmt)
            try db.finalize(stmt: deleteStmt)
        } catch {
            let message = "Failed to replaceAll LatestEvaluations: \(error.localizedDescription)"
            Logger.shared.errorLog(message)
            completion(.failure(.unknown(message)))
            return
        }
        // 2. insert data
        for item in entities {
            do {
                let stmt = try db.prepareStatement(sql: Query.insert)
                try db.bindText(stmt: stmt, name: ":id", value: item.id)
                try db.bindText(stmt: stmt, name: ":userID", value: item.userID)
                try db.bindText(stmt: stmt, name: ":featureID", value: item.featureID)
                let bytes = [UInt8](item.data)
                if sqlite3_bind_blob(stmt, sqlite3_bind_parameter_index(stmt, ":data"), bytes, Int32(bytes.count), nil) != SQLITE_OK {
                    continue
                }
                try db.execute(stmt: stmt)
                try db.finalize(stmt: stmt)
            } catch {
                let message = "Failed to replaceAll LatestEvaluations: \(error.localizedDescription)"
                Logger.shared.errorLog(message)
                completion(.failure(.unknown(message)))
                break
            }
        }
        completion(.success(()))
    }

    func replacePartial(entities: Set<EvaluationEntity>, completion: (() -> Void)? = nil) {
        entities.forEach { evaluationEntities.update(with: $0) } // update in-memory data
        for item in entities {
            do {
                let stmt = try db.prepareStatement(sql: Query.insertOrReplace)
                try db.bindText(stmt: stmt, name: ":id", value: item.id)
                try db.bindText(stmt: stmt, name: ":userID", value: item.userID)
                try db.bindText(stmt: stmt, name: ":featureID", value: item.featureID)
                let bytes = [UInt8](item.data)
                if sqlite3_bind_blob(stmt, sqlite3_bind_parameter_index(stmt, ":data"), bytes, Int32(bytes.count), nil) != SQLITE_OK {
                    continue
                }
                try db.execute(stmt: stmt)
                try db.finalize(stmt: stmt)
            } catch {
                Logger.shared.errorLog("Failed to replacePartial LatestEvaluations: \(error.localizedDescription)")
            }
        }
        completion?()
    }
}

extension LatestEvaluationStore {
    // for test
    func deleteAll(completion: (() -> Void)? = nil) {
    evaluationEntities.removeAll() // update in-memory data
        do {
            let stmt = try db.prepareStatement(sql: Query.deleteAll)
            try db.execute(stmt: stmt)
            try db.finalize(stmt: stmt)
        } catch {
            Logger.shared.errorLog("Failed to delete LatestEvaluations: \(error.localizedDescription)")
        }
        completion?()
    }
}
