//
//  SettingView.swift
//  PhotoDocs
//
//  Created by Wang on 04.12.23.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        TabView {
            PhotoView()
                .tabItem {
                    Label("Photos", systemImage: "photo")
                }
            
            VideoView()
                .tabItem {
                    Label("Videos", systemImage: "video")
                }
            
            DocView()
                .tabItem {
                    Label("Docs", systemImage: "doc.text.viewfinder")
                }
            
            SettingView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    SettingView()
}
