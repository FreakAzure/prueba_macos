//
//  ComicExplorerApp.swift
//  ComicExplorer
//
//  Created by Azure on 21/1/24.
//

import SwiftUI
import ServiceManagement

@main
struct ComicExplorerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init() {
        DispatchQueue.main.async {
            StatusBarManager.shared.setupStatusBar()
        }
    }
    
    func setupAutoLaunch() { // Opens app on device startup
        if #available(macOS 13.0, *) {
            let mainApp = SMAppService.mainApp
            do {
                try mainApp.register()
            } catch let error {
                print(error)
            }
        } else {
            let appBundleIdentifier = "com.azure.comexplorer.ComicExplorer"
                    if !SMLoginItemSetEnabled(appBundleIdentifier as CFString, true) {
                        print("Failed to add login item.")
                    } else {
                        print("Successfully added login item.")
                    }
        }
       
    }
}
