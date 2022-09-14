final class CurrentEvaluationDaoImpl: CurrentEvaluationDao {
    private let db: SQLite

    init(db: SQLite) {
        self.db = db
    }

    func upsertEvaluation(evaluation: Evaluation) throws {
        let entity = try CurrentEvaluationEntity(
            model: evaluation
        )
        try db.insert([entity])
    }

    func getEvaluations(userId: String) throws -> [Evaluation] {
        try db.select(
            CurrentEvaluationEntity(),
            conditions: [.equal(column: "userId", value: userId)]
        )
    }

    func deleteNotIn(userId: String, featureIds: [String]) throws {
        try db.delete(
            CurrentEvaluationEntity(),
            condition: .notin(column: "featureId", values: featureIds)
        )
    }
}
