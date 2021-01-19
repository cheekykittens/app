import Foundation

public enum Area: String, Codable {
    case
    purple
    
    public var square: String { "square_\(self)" }
    public var background: String { "background_\(self)" }
    public var foreground: String { "foreground_\(self)" }
}
