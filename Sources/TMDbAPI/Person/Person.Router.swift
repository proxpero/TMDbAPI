import Foundation
//import UtilityKit

extension TMDb.Person {

    enum Router: RouterType {
        case details(Id)
        case popular(Page, Language, Region)
        case movieCredits(Id)
        case tvCredits(Id)
        case images(Id)

        var path: String {
            switch self {
            case .details(let id): return "/person/\(id)"
            case .popular: return "/person/popular"
            case .movieCredits(let id): return "/person/\(id)/movie_credits"
            case .tvCredits(let id): return "/person/\(id)/tv_credits"
            case .images(let id): return "/person/\(id)/images"
            }
        }

        func queryItems(apiKey: ApiKey) -> [URLQueryItem] {
            switch self {
            case .details:
                return [QueryType.apiKey(apiKey).item]
            case .popular(let page, let language, let region):
                return [URLQueryItem](apiKey: apiKey, page: page, language: language, region: region)
            case .movieCredits:
                return [QueryType.apiKey(apiKey).item]
            case .tvCredits:
                return [QueryType.apiKey(apiKey).item]
            case .images:
                return [QueryType.apiKey(apiKey).item]
            }
        }
    }
}
