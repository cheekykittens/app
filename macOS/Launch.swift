import AppKit
import Combine

final class Launch: NSView {
    private var subs = Set<AnyCancellable>()
    
    required init?(coder: NSCoder) { nil }
    init(window: Window) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        let title = Text()
        title.font = .systemFont(ofSize: 30, weight: .black)
        title.stringValue = NSLocalizedString("Cheeky Kittens", comment: "")
        addSubview(title)
        
        let new = Control.Title()
        new.layer!.backgroundColor = NSColor.systemBlue.cgColor
        new.text.stringValue = NSLocalizedString("New Game", comment: "")
        new.click.sink {
            window.newGame()
        }.store(in: &subs)
        addSubview(new)
        
        title.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        title.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -30).isActive = true
        
        new.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20).isActive = true
        new.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        new.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
