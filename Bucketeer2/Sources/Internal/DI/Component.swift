import Foundation

protocol Component: AnyObject {
    var config: BKTConfig { get }
    var userHolder: UserHolder { get }
    var evaluationInteractor: EvaluationInteractor { get }
    var eventInteractor: EventInteractor { get }
}

final class ComponentImpl: Component {
    let dataModule: DataModule

    init(dataModule: DataModule) {
        self.dataModule = dataModule
    }

    var config: BKTConfig {
        dataModule.config
    }

    var userHolder: UserHolder {
        dataModule.userHolder
    }

    var evaluationInteractor: EvaluationInteractor {
        EvaluationInteractorImpl(
            apiClient: dataModule.apiClient,
            evaluationDao: dataModule.evaluationDao,
            defaults: dataModule.defaults
        )
    }

    var eventInteractor: EventInteractor {
        EventInteractorImpl(
            eventsMaxBatchQueueCount: dataModule.config.eventsMaxBatchQueueCount,
            apiClient: dataModule.apiClient,
            eventDao: dataModule.eventDao,
            clock: dataModule.clock,
            idGenerator: dataModule.idGenerator,
            logger: dataModule.config.logger
        )
    }
}
