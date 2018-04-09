import Foundation

public struct Resource<A> {

    public let url: URL
    public let method: HttpMethod<Data>
    public let parse: (Data) -> A?

    public init(url: URL, method: HttpMethod<Data> = .get, parse: @escaping (Data) -> A?) {
        self.url = url
        self.method = method
        self.parse = parse
    }
}

public extension Resource {

    init(url: URL, method: HttpMethod<Data> = .get, parseJSON: @escaping (Any) -> A?) {
        self.url = url
        self.method = method.map { json -> Data in
            let result = try! JSONSerialization.data(withJSONObject: json, options: [])
            return result
        }
        self.parse = { data in
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            return json.flatMap(parseJSON)
        }
    }
}

public extension Resource where A: Decodable {
    init(url: URL) {
        self.url = url
        self.method = .get
        self.parse = { try? JSONDecoder().decode(A.self, from: $0) }
    }
}
