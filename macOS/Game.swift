import SpriteKit

final class Game: SKView, SKViewDelegate {
    required init?(coder: NSCoder) { nil }
    init(area: Area) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        ignoresSiblingOrder = true
        delegate = self
        
        let scene = SKScene()
        scene.anchorPoint = .init(x: 0.5, y: 0.5)
        scene.scaleMode = .resizeFill
        scene.backgroundColor = SKColor(named: area.background)!
        presentScene(scene)
        
        let square1 = Square(area: area)
        let square2 = Square(area: area)
        square2.position.x += 70
        scene.addChild(square1)
        scene.addChild(square2)
    }
    
    func view(_: SKView, shouldRenderAtTime: TimeInterval) -> Bool {
//        state.render(shouldRenderAtTime)
        return true
    }

    override func mouseDown(with: NSEvent) {
        guard let scene = self.scene else { return }
        scene.nodes(at: with.location(in: scene)).compactMap { $0 as? Square }.first.map {
            $0.open()
        }
    }
}
