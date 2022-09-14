import Foundation

typealias Evaluation = JSON.Evaluation

protocol CurrentEvaluationDao {
  func upsertEvaluation(evaluation: Evaluation) throws
  func deleteNotIn(userId: String, featureIds: [String]) throws
  func getEvaluations(userId: String) throws -> [Evaluation]
}
