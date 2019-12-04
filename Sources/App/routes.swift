import Vapor
import Logging

/// Register your application's routes here.
public func routes(_ router: Router) throws {

    struct CountResponse: Content {
        let count: Int
    }

    let cache = ExpiringKeysCache()

    router.get("touch", String.parameter) { req -> HTTPStatus in
        let key: String = try req.parameters.next()
        let logger = try req.make(Logger.self)

        logger.info("Putting \(key) to cache ...")

        let _ = cache.touch(key: key)

        return .ok
    }

    router.get("count") { req -> CountResponse in
        let logger = try req.make(Logger.self)
        let keysCount = cache.keysCount()

        logger.info("Number of valid keys: \(keysCount)")

        return CountResponse(count: keysCount )
    }
}
