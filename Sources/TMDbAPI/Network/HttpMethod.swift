public enum HttpMethod<Body> {
    case get
    case post(Body)
}

public extension HttpMethod {

    var string: String {
        switch self {
        case .get: return "GET"
        case .post: return "POST"
        }
    }

    /// If the verb is a `post` then tranform the body of the post into an `A`
    /// If the verb is a `get` then do nothing.
    func map<A>(transform: (Body) -> A) -> HttpMethod<A> {
        switch self {
        case .get: return .get
        case .post(let body):
            return .post(transform(body))
        }
    }
}
