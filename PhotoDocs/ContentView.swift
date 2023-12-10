//
//  ContentView.swift
//  PhotoDocs
//
//  Created by Wang on 04.12.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PhotoView()
                .tabItem {
                    Label("photos", systemImage: "photo")
                }
            
            VideoView()
                .tabItem {
                    Label("videos", systemImage: "video")
                }
            
            DocView()
                .tabItem {
                    Label("docs", systemImage: "doc.text.viewfinder")
                }
            
            SettingView()
                .tabItem {
                    Label("settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    ContentView()
}
