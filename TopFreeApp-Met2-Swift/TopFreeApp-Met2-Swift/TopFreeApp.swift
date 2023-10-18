import Foundation

struct TopApp: Codable {
    let feed: Feed
}

struct Feed: Codable {
    let entry: TopAppFeedEntry
}

struct TopAppFeedEntry: Codable {
    let imName: Label
    let imImage: [ImageInfo]
    let summary: Label

    enum CodingKeys: String, CodingKey {
        case imName = "im:name"
        case imImage = "im:image"
        case summary
    }
}
struct Label: Codable {
    let label: String
}

struct ImageInfo: Codable {
    let label: String
    let attributes: ImageAttributes
}

struct ImageAttributes: Codable {
    let height: String
}
