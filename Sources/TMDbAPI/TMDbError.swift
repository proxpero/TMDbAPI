public enum TMDbError {
    public enum Auth: Error {
        case requestToken
        case session
    }

    public enum Movie: Error {
        case decoding
    }

    public enum Tv: Error {
        case decoding
    }

    public enum Networking: Error {
        case resourceParsing
        case invalidResponse
    }
}
