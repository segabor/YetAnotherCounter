import Vapor
import Logging

/// Register your application's routes here.
public func routes(_ router: Router) throws {

    struct Counter: Content {
        var value: Int = 0
    }

    // global state
    var state: Counter = Counter()

    // state getter
    router.get("counter") { req -> Counter in
        let logger = try req.make(Logger.self)

        logger.debug("Returning state \(state)")

        return state
    }

    // state setter
    router.post("counter") { req -> HTTPStatus in
        let logger = try req.make(Logger.self)
        let nextState = try req.content.syncDecode(Counter.self)

        logger.debug("Change state \(state) to \(nextState)")

        state = nextState

        return .ok
    }
}
