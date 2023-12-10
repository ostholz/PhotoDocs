//
//  PhotoViewViewModel.swift
//  PhotoDocs
//
//  Created by Wang on 06.12.23.
//

import Foundation

class PhotoViewViewModel: ObservableObject {
    
    @Published var items: [FileEntry] = []
    
    
    private func loadItems() {
        items = []
        var tempItems = [FileEntry]()
        let subfolders = FileService.shared.listFolders(in: FileService.shared.urlOfFolder(folder: .photos))
        let folderItems: [FileEntry] = subfolders.map { .init(url: $0, type: .folder) }
        tempItems.append(contentsOf: folderItems )
        
        let files = FileService.shared.listFiles(in: FileService.shared.urlOfFolder(folder: .photos))
        let fileItems: [FileEntry] = files.map { .init(url: $0, type: .image) }
        tempItems.append(contentsOf: fileItems)
        items = tempItems
    }
    
    
    
    /*
    func loadPhotos() {
        photos = FileService.shared.loadPhotos()
    }
    
    func deletePhoto(at indexSet: IndexSet) {
        photos.remove(atOffsets: indexSet)
    }
    
    func deletePhoto(at index: Int) {
        photos.remove(at: index)
    }
    
    func savePhotos() {
        FileService.shared.save(photos: photos)
    }
    
    func addPhoto(_ photo: Photo) {
        photos.append(photo)
    }
    
    func updatePhoto(_ photo: Photo, at index: Int) {
        photos[index] = photo
    }
     */
}
