import XCTest
@testable import Bucketeer2

final class EventDaoTests: XCTestCase {
    let url = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("event_test.db")
    var path: String { url.path }

    override func setUp() {
        super.setUp()
        let db = try! SQLite(path: path, logger: nil)

        let eventTable = SQLite.Table(entity: EventEntity())
        let eventSql = eventTable.sqlToCreate()
        try! db.exec(query: eventSql)

        let dao = EventDaoImpl(db: db)
        let events = [
            Event(
                id: "event1",
                event: .goal(.init(
                    timestamp: 1,
                    goal_id: "goal1",
                    user_id: "user1",
                    value: 1,
                    user: .init(id: "user1", data: [:]),
                    tag: "tag1",
                    source_id: .ios
                )),
                type: .goal
            ),
            Event(
                id: "event2",
                event: .goal(.init(
                    timestamp: 2,
                    goal_id: "goal2",
                    user_id: "user2",
                    value: 2,
                    user: .init(id: "user2", data: [:]),
                    tag: "tag2",
                    source_id: .ios
                )),
                type: .goal
            ),
        ]
        try! dao.add(events: events)
    }

    override func tearDown() {
        try! FileManager.default.removeItem(at: url)

        super.tearDown()
    }

    func testAddEvent() throws {
        let db = try SQLite(path: path, logger: nil)
        let dao = EventDaoImpl(db: db)
        let event = Event(
            id: "event3",
            event: .goal(.init(
                timestamp: 3,
                goal_id: "goal3",
                user_id: "user3",
                value: 3,
                user: .init(id: "user3", data: [:]),
                tag: "tag3",
                source_id: .ios
            )),
            type: .goal
        )
        try dao.add(event: event)
        let events = try dao.getEvents()
        XCTAssertEqual(events.count, 3)
        let ids = events.map(\.id)
        XCTAssertEqual(ids, ["event1", "event2", "event3"])
    }

    func testDelete() throws {
        let db = try SQLite(path: path, logger: nil)
        let dao = EventDaoImpl(db: db)
        try dao.delete(ids: ["event1", "event3"])

        let events = try dao.getEvents()
        XCTAssertEqual(events.count, 1)
        guard let event = events.first else {
            return
        }
        XCTAssertEqual(event.id, "event2")
    }
}
