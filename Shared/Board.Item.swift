import Foundation

public extension Board {
    enum Item: Codable {
        case
        none,
        poo,
        cookie(Cookie)
        
        public init(from: Decoder) throws {
            self = try {
                if let cookie = try $0.decodeIfPresent(Cookie.self, forKey: .cookie) {
                    return .cookie(cookie)
                }
                if try $0.decodeIfPresent(String.self, forKey: .poo) != nil {
                    return .poo
                }
                return .none
            } (from.container(keyedBy: Key.self))
        }
        
        public func encode(to: Encoder) throws {
            var container = to.container(keyedBy: Key.self)
            switch self {
            case .none: try container.encode(Key.none, forKey: .none)
            case .poo: try container.encode(Key.poo, forKey: .poo)
            case let .cookie(cookie): try container.encode(cookie, forKey: .cookie)
            }
        }
        
        private enum Key: String, Codable, CodingKey {
            case
            none,
            poo,
            cookie
        }
    }
}
