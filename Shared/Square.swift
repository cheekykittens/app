import SpriteKit

final class Square: SKSpriteNode {
    required init?(coder: NSCoder) { nil }
    init(area: Area) {
        super.init(texture: .init(imageNamed: area.square), color: .clear, size: .init(width: 64, height: 64))
    }
}
