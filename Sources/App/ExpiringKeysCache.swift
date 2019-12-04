#if os(Linux)
import Glibc
#else
import Darwin
#endif

class ExpiringKeysCache {
    /* 5 secs expiration thresho;d */
    public let threshold: UInt = 5

    private var cache: [String:UInt] = [:]

    public func touch(key: String) -> Bool {
        let now = UInt(time(nil))

        let keyExists = cache.keys.contains(key)

        // update cache with timestamp
        cache[key] = now

        return keyExists
    }

    public func keysCount() -> Int {
        cleanup()

        return cache.count
    }

    private func cleanup() {
        let now = UInt(time(nil))-threshold

        // remove expired elements
        let updatedCache = cache.filter { (k,v) in v >= now }

        cache = updatedCache
    }
}
