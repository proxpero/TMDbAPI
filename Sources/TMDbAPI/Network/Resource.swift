import Foundation

public struct Resource<A: Decodable> {

    public let request: URLRequest
    public let parse: (Data) -> A?

    public init(request: URLRequest) {
        self.request = request
        self.parse = { try? JSONDecoder().decode(A.self, from: $0) }
    }
    
    public init(url: URL) {
        self = .init(request: URLRequest(url: url))
    }
}
