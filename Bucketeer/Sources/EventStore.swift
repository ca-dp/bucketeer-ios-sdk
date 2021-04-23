import Foundation
import SQLite3

class EventStore {
    private enum Query {
        static let fetch = "SELECT id, type, data FROM Events LIMIT :limit;"
        static let fetchCount = "SELECT count(id) FROM Events;"
        static let save = "INSERT INTO Events (id, type, data) VALUES (:id, :type, :data);"
        static let delete = "DELETE FROM Events WHERE id = :id;"
        static let deleteAll = "DELETE FROM Events;"
    }

    private let db: SQLiteDatabase

    init(db: SQLiteDatabase) {
        self.db = db
    }

    func fetch(limit: Int = 100, completion: @escaping ([EventEntity]) -> Void) {
        do {
            let stmt = try db.prepareStatement(sql: Query.fetch)
            try db.bindInt(stmt: stmt, name: ":limit", value: limit)
            var items: [EventEntity] = []
            while (try db.query(stmt: stmt) == SQLITE_ROW) {
                guard let id = sqlite3_column_text(stmt, 0),
                    let type = sqlite3_column_text(stmt, 1) else {
                        continue
                }
                let idStr = String(cString: id)
                let typeStr = String(cString: type)
                guard let eventType = EventEntity.EventType(rawValue: typeStr) else {
                    continue
                }
                let blob = sqlite3_column_blob(stmt, 2)
                let size = sqlite3_column_bytes(stmt, 2)
                let data = NSData(bytes: blob, length: Int(size)) as Data
                items.append(EventEntity(id: idStr, type: eventType, data: data))
            }
            try db.finalize(stmt: stmt)
            completion(items)
        } catch {
            Logger.shared.errorLog("Failed to fetch Events: \(error.localizedDescription)")
            completion([])
        }
    }

    func save(_ items: [EventEntity], completion: ((Int) -> Void)? = nil) {
        for item in items {
            do {
                let stmt = try db.prepareStatement(sql: Query.save)
                try db.bindText(stmt: stmt, name: ":id", value: item.id)
                try db.bindText(stmt: stmt, name: ":type", value: item.type.rawValue)
                let bytes = [UInt8](item.data)
                if sqlite3_bind_blob(stmt, sqlite3_bind_parameter_index(stmt, ":data"), bytes, Int32(bytes.count), nil) != SQLITE_OK {
                    continue
                }
                try db.execute(stmt: stmt)
                try db.finalize(stmt: stmt)
            } catch {
                Logger.shared.errorLog("Failed to save Events: \(error.localizedDescription)")
                break
            }
        }
        guard let countStmt = try? db.prepareStatement(sql: Query.fetchCount) else {
            completion?(0)
            return
        }
        var count = 0
        do {
            if try db.query(stmt: countStmt) == SQLITE_ROW {
                count = Int(sqlite3_column_int(countStmt, 0))
            }
            try db.finalize(stmt: countStmt)
        } catch {
            Logger.shared.errorLog("Failed to get count of Events: \(error.localizedDescription)")
        }
        completion?(count)
    }

    func delete(_ items: [EventEntity], completion: (() -> Void)? = nil) {
        for item in items {
            do {
                let stmt = try db.prepareStatement(sql: Query.delete)
                try db.bindText(stmt: stmt, name: ":id", value: item.id)
                try db.execute(stmt: stmt)
                try db.finalize(stmt: stmt)
            } catch {
                Logger.shared.errorLog("Failed to delete Events: \(error.localizedDescription)")
                break
            }
        }
        completion?()
    }
}

extension EventStore {
    // for test
    func deleteAll(completion: (() -> Void)? = nil) {
        do {
            let stmt = try db.prepareStatement(sql: Query.deleteAll)
            try db.execute(stmt: stmt)
            try db.finalize(stmt: stmt)
        } catch {
            Logger.shared.errorLog("Failed to delete Events: \(error.localizedDescription)")
        }
        completion?()
    }
}
