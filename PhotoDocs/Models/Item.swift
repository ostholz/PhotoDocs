//
//  Items.swift
//  PhotoDocs
//
//  Created by Wang on 06.12.23.
//

import Foundation


enum EntryType {
    case image
    case folder
    
}

struct FileEntry {
    let url: URL
    let type: EntryType
    
    var path: String {
        url.absoluteString
    }
    
    var name: String {
        url.lastPathComponent
    }
}

extension FileEntry: Identifiable {
    var id: String {
        "\(path)/\(name)"
    }
}


