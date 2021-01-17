import AppKit

final class Window: NSWindow {
    init() {
        super.init(contentRect: .init(x: 0, y: 0, width: 900, height: 600),
                   styleMask: [.closable, .miniaturizable, .resizable, .titled, .fullSizeContentView], backing: .buffered, defer: false)
        minSize = .init(width: 300, height: 200)
        toolbar = .init()
        titlebarAppearsTransparent = true
        collectionBehavior = .fullScreenNone
        isReleasedWhenClosed = false
        center()
        setFrameAutosaveName("Window")
        
        add(Launch(window: self))
    }
    
    func newGame() {
        add(Game())
    }
    
    private func add(_ view: NSView) {
        contentView!.subviews.forEach { $0.removeFromSuperview() }
        contentView!.addSubview(view)
        
        view.topAnchor.constraint(equalTo: contentView!.safeAreaLayoutGuide.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: contentView!.safeAreaLayoutGuide.bottomAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: contentView!.safeAreaLayoutGuide.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: contentView!.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
}
