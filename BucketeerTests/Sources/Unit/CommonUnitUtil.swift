import Foundation
@testable import Bucketeer

class CommonUnitUtil {
    public static let shared = CommonUnitUtil()

    let config: Config
    let userEntity: UserEntity
    let userEvaluationsId: String
    let apiClient: APIClientProtocol
    let db: SQLiteDatabase
    let eventStore: EventStore
    var evaluation: Bucketeer_Feature_Evaluation

    private init() {
        let config = Config(sdkKey: "", apiURL: "")
        self.config = config

        let userID = "u001"
        self.userEntity = UserEntity(id: userID, attributes: [:])!
        self.userEvaluationsId = "user-evaluations-id"

        self.evaluation = Bucketeer_Feature_Evaluation()
        evaluation.userID = userID
        evaluation.id = "e001"
        evaluation.featureID = "f001"

        self.apiClient = MockAPIClient()

        let databaseURL = try! FileManager.default
            .url(for: .libraryDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            .appendingPathComponent("dbTest.sqlite")
        self.db = try! SQLiteDatabase.open(path: databaseURL.path)
        self.db.migration()

        // Store
        self.eventStore = EventStore(db: db)
    }
}
