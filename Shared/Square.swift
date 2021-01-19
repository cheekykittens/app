import SpriteKit

final class Square: SKSpriteNode {
    private let area: Area
    
    required init?(coder: NSCoder) { nil }
    init(area: Area) {
        self.area = area
        super.init(texture: .init(imageNamed: area.square), color: .clear, size: .init(width: 64, height: 64))
    }
    
    func open() {
//        guard emitter == nil else { return }
        let emitter = SKEmitterNode()
        emitter.particleTexture = .init(imageNamed: "particle")
        emitter.particleSize = .init(width: 10, height: 10)
        emitter.particleBirthRate = 30
        emitter.emissionAngleRange = .pi * 2
        emitter.particleRotationRange = .pi * 2
        emitter.particleColor = SKColor(named: area.foreground)!
        emitter.particleColorBlendFactor = 1
        emitter.particleSpeed = 25
        emitter.particleLifetime = 3
        emitter.numParticlesToEmit = 30
        emitter.particleAlphaSpeed = -0.1
        emitter.particleRotationSpeed = 0.5
        emitter.particlePosition = .zero
        emitter.particlePositionRange = .zero
        emitter.zPosition = 3
        emitter.position = position
        scene!.addChild(emitter)
        emitter.run(.sequence([.wait(forDuration: 7), .removeFromParent()]))
//        self.emitter = emitter
    }
}
