//
//  PhotoView.swift
//  PhotoDocs
//
//  Created by Wang on 04.12.23.
//

import SwiftUI

struct PhotoView: View {
    @ObservedObject var viewModel = PhotoViewViewModel()
    
    private let gridItems = [GridItem(.adaptive(minimum: 50, maximum: 90))]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridItems) {
//                    ForEach(viewModel.items) { item in
    //
    //                }
//                    ForEach(0..<100) { item in
//                        Image(systemName: "photo")
//                            .resizable()
//                            .scaledToFit()
//                    }.padding()
                }
            }
        }
    }
    
    @ViewBuilder
    func cell(for entry: FileEntry) -> some View {
        if entry.type == .folder {
            Image(systemName: "folder")
        } else {
            
        }
    }
}


#Preview {
    PhotoView()
}
