protocol Migration {
    func migration() throws
}

final class Migration1to2: Migration {
    private struct Query {
        static let createTableLatestEvaluations = "CREATE TABLE IF NOT EXISTS LatestEvaluations (id TEXT PRIMARY KEY, userId TEXT, featureId TEXT, data BLOB);"
        static let createTableEvents = "CREATE TABLE IF NOT EXISTS Events (id TEXT PRIMARY KEY, type TEXT, data BLOB);"
    }
    private let db: SQLite

    init(db: SQLite) {
        self.db = db
    }

    func migration() throws {
        let evaluationTable = SQLite.Table(entity: EvaluationEntity())
        let evaluationSql = evaluationTable.sqlToCreate()
        try db.exec(query: evaluationSql)
        try db.exec(query: Query.createTableLatestEvaluations)
        try db.exec(query: Query.createTableEvents)
    }
}
