import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {

    struct Counter: Content {
        var value: Int = 0
    }

    // global state
    var state: Counter = Counter()

    // state getter
    router.get("counter") { req -> Counter in
        return state
    }

    // state setter
    router.post("counter") { req -> HTTPStatus in
        let nextState = try req.content.syncDecode(Counter.self)

        state = nextState

        return .ok
    }
}
