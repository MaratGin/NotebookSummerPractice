import Foundation

// MARK: - DTO model

struct EventModelDTO: Codable {
    var id: Int?
    var date_start: String?
    var date_finish: String?
    var name: String?
    var description: String?
}
