//
//  StatusBarController.swift
//  ComicExplorer
//
//  Created by Azure on 21/1/24.
//

import Foundation
import AppKit
import SwiftUI

class StatusBarManager {
    private var statusBarItem: NSStatusItem?
    private var popover: NSPopover?
    static let shared = StatusBarManager()

    func setupStatusBar() {
        // Create the status item
        
        statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)

        // Set an image for the status bar item
        if let button = statusBarItem?.button {
            button.image = NSImage(named: "StatusBarButtonIcon")
        }

        // Create the SwiftUI view for the dropdown menu
        let menuView = StatusBarMenuView()
        let hostingView = NSHostingView(rootView: menuView)
        hostingView.frame = CGRect(x: 0, y: 0, width: 250, height: 200) // Customize size as needed

        // Create the menu and add the view
        let menu = NSMenu()
        let menuItem = NSMenuItem()
        menuItem.view = hostingView
        menu.addItem(menuItem)
        statusBarItem?.menu = menu
    }
}


struct StatusBarMenuView: View {
    var body: some View {
        ComicListRouter.createModule()
    }
}
