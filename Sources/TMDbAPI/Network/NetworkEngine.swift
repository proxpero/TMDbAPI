import Foundation

public protocol NetworkEngine {
    func load<A: Decodable>(_ request: URLRequest, as type: A.Type, completion: @escaping (Result<A, NetworkingError>) -> Void)
}

public enum NetworkingError: Error {
    case badRequest
    case resourceParsing
    case decoding
    case badResponse(String)
}

extension URLSession {
    public func load<A: Decodable>(_ resourse: Resource<A>, as type: A.Type = A.self, completion: @escaping (Result<A, NetworkingError>) -> Void) {

        dataTask(with: resourse.request) { (data, response, error) in
            if let error = error {
                completion(.failure(.badResponse(error.localizedDescription)))
                return
            }
            
            guard let _ = response, let data = data else {
                completion(.failure(.badResponse("data is nil")))
                return
            }
            
            guard let value = try? JSONDecoder().decode(A.self, from: data) else {
                completion(.failure(.decoding))
                return
            }

            completion(.success(value))
        }.resume()
    }
}
