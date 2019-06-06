import XCTest

@testable import TMDbAPI

typealias Movie = TMDb.Movie

class ResourceTests: XCTestCase {

    var movie: Movie!
    var session: URLSession!

    override func setUp() {
        let url = URL(string: "https://api.themoviedb.org/3")
        let api = TMDb(baseUrl: url!, apiKey: "4559e8696247b2066f5ab358314210d1")
        movie = Movie(
            api: api
        )
        session = URLSession(configuration: URLSessionConfiguration.ephemeral)
    }
    
    func testMovieDetails() {
        
    }

    func testPopularListResource() {
//        let expect = expectation(description: "LoadResource")
//        let url = movie.popularUrl()
//        let resource = Resource<Movie.List>(url: url)
//        session.load(resource) { result in
//            if case .success(let list) = result {
//                let objects = list.resultObjects
//                XCTAssertEqual(objects.count, 20)
//            } else {
//                XCTFail()
//            }
//            expect.fulfill()
//        }
//        waitForExpectations(timeout: 0.05)
    }

    func testUpcomingListResource() {
        let expect = expectation(description: "LoadResourcePromise")
        let resource = movie.details(for: 269149)
//        let url = movie.upcomingUrl()
//        let resource = Resource<Movie.List>(url: url)
        session.load(resource) { result in
            switch result {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error)
            }
//            XCTAssertEqual(objects.count, 20)
            expect.fulfill()
        }
        waitForExpectations(timeout: 10)
    }

    func testTopRatedListResource() {
//        let expect = expectation(description: "LoadResourcePromise")
//        let url = movie.topRatedUrl()
//        let resource = Resource<Movie.List>(url: url)
//        session.load(resource).then { list in
//            let objects = list.resultObjects
//            XCTAssertEqual(objects.count, 20)
//            expect.fulfill()
//        }
//        waitForExpectations(timeout: 0.05)
    }

    func testNowPlayingListResource() {
//        let expect = expectation(description: "LoadResourcePromise")
//        let url = movie.nowPlayingUrl()
//        let resource = Resource<Movie.List>(url: url)
//        session.load(resource).then { list in
//            let objects = list.resultObjects
//            XCTAssertEqual(objects.count, 20)
//            expect.fulfill()
//        }
//        waitForExpectations(timeout: 0.05)
    }

    func testDetailsResource() {
//        let expect = expectation(description: "LoadResourcePromise")
//        let url = movie.detailsUrl(for: 399174)
//        let resource = Resource<Movie.DetailResultObject>(url: url)
//        session.load(resource).then { object in
//            XCTAssertEqual(object.id, 399174)
//            expect.fulfill()
//        }
//        waitForExpectations(timeout: 0.05)

    }

}
