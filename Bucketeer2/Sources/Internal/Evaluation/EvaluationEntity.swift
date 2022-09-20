import Foundation

struct EvaluationEntity: SQLiteEntity {
    static var tableName: String {
        return "Evaluations"
    }
    typealias Model = Evaluation

    var id = SQLiteColumn<String>(value: "", isPrimaryKey: true)
    var userId = SQLiteColumn<String>(value: "")
    var featureId = SQLiteColumn<String>(value: "")
    var data = SQLiteColumn<Data>(value: .init())

    static func model(from statement: SQLite.Statement) throws -> Evaluation {
        let data = statement.data(at: 3)
        return try JSONDecoder().decode(Evaluation.self, from: data)
    }

}

extension EvaluationEntity {
    init(model: Model) throws {
        self.id.value = model.id
        self.userId.value = model.user_id
        self.featureId.value = model.feature_id
        let data = try JSONEncoder().encode(model)
        self.data.value = data
    }
}
