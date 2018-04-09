import XCTest
@testable import TMDbAPI

class TMDbInitTests: XCTestCase {

    let baseUrl = URL(string: "https://api.themoviedb.org/3")!
    let apiKey = "123"

    func testDefaultInitialization() {
        let tmdb = TMDb(baseUrl: baseUrl, apiKey: apiKey)
        XCTAssertEqual(tmdb.baseUrl.absoluteString, baseUrl.absoluteString)
        XCTAssertEqual(tmdb.key, apiKey)
        XCTAssertEqual(tmdb.language, Language.en)
        XCTAssertEqual(tmdb.region, Region.us)
        XCTAssertNil(tmdb.sessionId)
    }

    func testCustomInitialization() {

        let lang = Language.de
        let region = Region.gb
        let sessionId = "secret"

        let tmdb = TMDb(
            baseUrl: baseUrl,
            apiKey: apiKey,
            language: lang,
            region: region,
            sessionId: sessionId
        )
        XCTAssertEqual(tmdb.baseUrl.absoluteString, baseUrl.absoluteString)
        XCTAssertEqual(tmdb.key, apiKey)
        XCTAssertEqual(tmdb.language, lang)
        XCTAssertEqual(tmdb.region, region)
        XCTAssertNotNil(tmdb.sessionId)
        XCTAssertEqual(tmdb.sessionId, sessionId)
    }

    func testSetSessionId() {
        let sessionId = "secret"
        let tmdb = TMDb(baseUrl: baseUrl, apiKey: apiKey)
        XCTAssertNil(tmdb.sessionId)
        tmdb.sessionId = sessionId
        XCTAssertNotNil(tmdb.sessionId)
        XCTAssertEqual(tmdb.sessionId, sessionId)
    }

    static var allTests = [
        "testDefaultInitialization": testDefaultInitialization,
        "testCustomInitialization": testCustomInitialization,
        "testSetSessionId": testSetSessionId
    ]
}
