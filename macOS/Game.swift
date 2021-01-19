import SpriteKit

final class Game: SKView, SKViewDelegate {
    private let area: Area
    
    required init?(coder: NSCoder) { nil }
    init(area: Area) {
        self.area = area
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

    override func mouseDown(with: NSEvent) {
        scene!.nodes(at: with.location(in: scene!)).compactMap { $0 as? Square }.first.map {
            $0.run(.fadeOut(withDuration: 0.5))
            emitter($0.position)
        }
    }
    
    private func emitter(_ position: CGPoint) {
        let emitter = SKEmitterNode()
        emitter.particleTexture = .init(imageNamed: "bubble")
        emitter.particleSize = .init(width: 50, height: 50)
        emitter.particleBirthRate = 30
        emitter.emissionAngleRange = .pi * 2
        emitter.particleRotationRange = .pi * 2
        emitter.particleColor = SKColor(named: area.foreground)!
        emitter.particleColorBlendFactor = 1
        emitter.particleSpeed = 100
        emitter.particleLifetime = 0.5
        emitter.numParticlesToEmit = 9
        emitter.particleAlphaSpeed = -0.6
        emitter.particleRotationSpeed = 0.5
        emitter.particlePosition = .zero
        emitter.particlePositionRange = .zero
        emitter.particleScaleRange = 0.2
        emitter.particleScaleSpeed = 1.1
        emitter.particleScale = 0.2
        emitter.zPosition = -1
        emitter.position = position
        
        scene!.addChild(emitter)
        
        emitter.run(.sequence([.wait(forDuration: 7), .removeFromParent()]))
    }
}
