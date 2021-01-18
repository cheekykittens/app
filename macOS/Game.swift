import SpriteKit

final class Game: SKView, SKViewDelegate {
    required init?(coder: NSCoder) { nil }
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        ignoresSiblingOrder = true
        delegate = self
        
        let scene = SKScene()
        scene.anchorPoint = .init(x: 0.5, y: 0.5)
        scene.scaleMode = .resizeFill
        scene.backgroundColor = NSColor(named: "BackgroundPurple")!
        presentScene(scene)
    }
    
    func view(_: SKView, shouldRenderAtTime: TimeInterval) -> Bool {
//        state.render(shouldRenderAtTime)
        return true
    }
}
