import Foundation
import SQLite3

enum SQLiteError: Error {
    case failedToOpenDatabase(message: String)
    case failedToPrepare(message: String)
    case failedToStep(message: String)
    case failedToBind(message: String)
    case failedToFinalize(message: String)
}

class SQLiteDatabase {
    private let dbPointer: OpaquePointer?

    private init(dbPointer: OpaquePointer) {
        self.dbPointer = dbPointer
    }

    static func open(path: String) throws -> SQLiteDatabase {
        var _db: OpaquePointer? = nil
        let flags = SQLITE_OPEN_CREATE | SQLITE_OPEN_READWRITE | SQLITE_OPEN_FULLMUTEX
        if sqlite3_open_v2(path, &_db, flags, nil) != SQLITE_OK {
            throw SQLiteError.failedToOpenDatabase(message: String(cString: sqlite3_errmsg(_db)))
        }
        guard let db = _db else {
            throw SQLiteError.failedToOpenDatabase(message: "Failed to open database. db instance is nil.")
        }
        return SQLiteDatabase(dbPointer: db)
    }

    var errorMessage: String {
        guard let dbPointer = dbPointer else { return "db pointer is nil" }
        return String(cString: sqlite3_errmsg(dbPointer))
    }

    deinit {
        sqlite3_close(dbPointer)
    }
}

// TODO: Make execute/query func with sql and parameters to do prepare, bind, executre, and finalize.
extension SQLiteDatabase {
    func prepareStatement(sql: String) throws -> OpaquePointer {
        var _stmt: OpaquePointer? = nil
        guard sqlite3_prepare_v2(dbPointer, sql, -1, &_stmt, nil) == SQLITE_OK,
            let stmt = _stmt else {
                throw SQLiteError.failedToPrepare(message: errorMessage)
        }
        return stmt
    }

    @discardableResult
    func execute(stmt: OpaquePointer) throws -> Int32 {
        let result = sqlite3_step(stmt)
        if result != SQLITE_DONE {
            throw SQLiteError.failedToStep(message: errorMessage)
        }
        return result
    }

    @discardableResult
    func query(stmt: OpaquePointer) throws -> Int32 {
        let result = sqlite3_step(stmt)
        if result != SQLITE_ROW && result != SQLITE_DONE {
            throw SQLiteError.failedToStep(message: errorMessage)
        }
        return result
    }

    @discardableResult
    func bindInt(stmt: OpaquePointer, name: String, value: Int) throws -> Int32 {
        let result = stmt.bindInt(name: name, value: value)
        if result != SQLITE_OK {
            throw SQLiteError.failedToBind(message: errorMessage)
        }
        return result
    }

    @discardableResult
    func bindText(stmt: OpaquePointer, name: String, value: String) throws -> Int32 {
        let result = stmt.bindText(name: name, value: value)
        if result != SQLITE_OK {
            throw SQLiteError.failedToBind(message: errorMessage)
        }
        return result
    }

    @discardableResult
    func finalize(stmt: OpaquePointer) throws -> Int32 {
        let result = sqlite3_finalize(stmt)
        if result != SQLITE_OK {
            throw SQLiteError.failedToFinalize(message: errorMessage)
        }
        return result
    }
}

extension SQLiteDatabase {
    private enum Query {
        static let createTableLatestEvaluations = "CREATE TABLE IF NOT EXISTS LatestEvaluations (id TEXT PRIMARY KEY, userID TEXT, featureID TEXT, data BLOB);"
        static let createTableCurrentEvaluations = "CREATE TABLE IF NOT EXISTS CurrentEvaluations (id TEXT PRIMARY KEY, userID TEXT, data BLOB);"
        static let createTableEvents = "CREATE TABLE IF NOT EXISTS Events (id TEXT PRIMARY KEY, type TEXT, data BLOB);"
    }

    @discardableResult
    func migration() -> Bool {
        do {
            if sqlite3_exec(dbPointer, Query.createTableLatestEvaluations, nil, nil, nil) != SQLITE_OK {
                Logger.shared.errorLog(errorMessage)
                return false
            }

            if sqlite3_exec(dbPointer, Query.createTableCurrentEvaluations, nil, nil, nil) != SQLITE_OK {
                Logger.shared.errorLog(errorMessage)
                return false
            }

            if sqlite3_exec(dbPointer, Query.createTableEvents, nil, nil, nil) != SQLITE_OK {
                Logger.shared.errorLog(errorMessage)
                return false
            }
        }
        return true
    }
}

extension OpaquePointer {
    func bindInt(name: String, value: Int) -> Int32 {
        return sqlite3_bind_int(self, sqlite3_bind_parameter_index(self, name), Int32(value))
    }

    func bindText(name: String, value: String) -> Int32 {
        return sqlite3_bind_text(self, sqlite3_bind_parameter_index(self, name), (value as NSString).utf8String, -1, nil)
    }
}
