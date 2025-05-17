//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Jonathan Dumitru on 5/16/25.
//

import SwiftUI

@main
struct CalculatorApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        Settings {} // Required for App protocol
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var windowController: FixedWindowController?

    func applicationDidFinishLaunching(_ notification: Notification) {
        let contentView = ContentView()
        let windowController = FixedWindowController()
        windowController.window?.contentView = NSHostingView(rootView: contentView)
        windowController.showWindow(self)
        self.windowController = windowController
    }
}
