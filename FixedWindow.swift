import AppKit

class FixedWindow: NSWindow {
    override var canBecomeKey: Bool { true }
    override func setFrame(_ frameRect: NSRect, display flag: Bool) {
        // Always enforce the fixed size
        let fixedSize = NSSize(width: 320, height: 480)
        let newFrame = NSRect(origin: frameRect.origin, size: fixedSize)
        super.setFrame(newFrame, display: flag)
    }
}

class FixedWindowController: NSWindowController {
    convenience init() {
        let window = FixedWindow(
            contentRect: NSRect(x: 0, y: 0, width: 320, height: 480),
            styleMask: [.titled, .closable, .miniaturizable],
            backing: .buffered,
            defer: false
        )
        self.init(window: window)
        window.center()
    }
} 