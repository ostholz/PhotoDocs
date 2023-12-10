//
//  PhotoDocsApp.swift
//  PhotoDocs
//
//  Created by Wang on 04.12.23.
//

import SwiftUI

@main
struct PhotoDocsApp: App {
    
    init() {
        // App startet
        prepareApp()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    private func prepareApp() {
        FileService.shared.initNeededFolders()
    }
}
