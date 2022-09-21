protocol Migration {
    func migration() throws
}

final class Migration1to2: Migration {
    private let db: SQLite

    init(db: SQLite) {
        self.db = db
    }

    func migration() throws {
        // Drop
        db.exec(query: "DROP TABLE current_evaluation")
        db.exec(query: "DROP TABLE latest_evaluation")
        db.exec(query: "DROP TABLE event")

        // Create
        let evaluationTable = SQLite.Table(entity: EvaluationEntity())
        let evaluationSql = evaluationTable.sqlToCreate()
        try db.exec(query: evaluationSql)
        let eventTable = SQLite.Table(entity: EventEntity())
        let eventSql = eventTable.sqlToCreate()
        try db.exec(query: eventSql)
    }
}
