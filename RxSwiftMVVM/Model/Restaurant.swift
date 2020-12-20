import Foundation

struct Restaurant: Codable {
    let name: String
    let cuisine: Cuisine
}

enum Cuisine: String, Codable {
    case indian
    case american
    case mexican
    case european
}
