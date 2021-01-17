import AppKit

extension Control {
    final class Title: Control {
        private(set) weak var text: Text!
        
        required init?(coder: NSCoder) { nil }
        override init() {
            super.init()
            wantsLayer = true
            layer!.cornerRadius = 15
            
            let text = Text()
            text.font = .systemFont(ofSize: 12, weight: .medium)
            addSubview(text)
            self.text = text
            
            heightAnchor.constraint(equalToConstant: 30).isActive = true
            
            text.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            text.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        }
    }
}
