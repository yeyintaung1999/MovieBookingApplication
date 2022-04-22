// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let currentShowingMovieList = try? newJSONDecoder().decode(CurrentShowingMovieList.self, from: jsonData)

import Foundation

// MARK: - CurrentShowingMovieList
struct CurrentShowingMovieList: Codable {
    let code: Int?
    let message: String?
    let data: [MovieStruct]?
}

// MARK: - Datum
struct MovieStruct: Codable {
    let id: Int?
    let originalTitle, releasedDate: String?
    let isAdult, rating: Int?
    let status: Status?
    let isActive: Int?
    let duration: String?
    let images: Images?

    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case releasedDate = "released_date"
        case isAdult = "is_adult"
        case rating, status
        case isActive = "is_active"
        case duration, images
    }
}


