//
//  FileServices.swift
//  PhotoDocs
//
//  Created by Wang on 05.12.23.
//

import Foundation

class FileService {
    
    enum Folder: String, CaseIterable {
        case photos, videos, docs
    }
    
    static let shared = FileService()
    static let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    private init() {} // Private initialization to ensure singleton instance

    private let fileManager = FileManager.default
    
    func urlOfFolder(folder: Folder) -> URL {
        return Self.documentDirectory.appendingPathComponent(folder.rawValue, isDirectory: true)
    }
    
    func listFolders(in directory: URL) -> [URL] {
        do {
            let directoryContents = try fileManager.contentsOfDirectory(at: directory, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            return directoryContents.filter { $0.hasDirectoryPath }
        } catch {
            print("Error listing folders: \(error)")
            return []
        }
    }

    func listFiles(in directory: URL) -> [URL] {
        do {
            let directoryContents = try fileManager.contentsOfDirectory(at: directory, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            return directoryContents.filter { !$0.hasDirectoryPath }
        } catch {
            print("Error listing files: \(error)")
            return []
        }
    }

    func createFolder(named folderName: String, at directory: URL) -> Bool {
        let folderURL = directory.appendingPathComponent(folderName, isDirectory: true)
        do {
            try fileManager.createDirectory(at: folderURL, withIntermediateDirectories: true, attributes: nil)
            return true
        } catch {
            print("Error creating folder: \(error)")
            return false
        }
    }
    
    func createFolderUnderDocument(named folderName: String) -> Bool {
        createFolder(named: folderName, at: Self.documentDirectory)
    }
    
    func createFolder(folderURL: URL) -> Bool {
        do {
            try fileManager.createDirectory(at: folderURL, withIntermediateDirectories: true, attributes: nil)
            return true
        } catch {
            print("Error creating folder: \(error)")
            return false
        }
    }

    func deleteFolder(at folderURL: URL) -> Bool {
        guard isFolderEmpty(at: folderURL) else {
            print("Folder is not empty")
            return false
        }

        do {
            try fileManager.removeItem(at: folderURL)
            return true
        } catch {
            print("Error deleting folder: \(error)")
            return false
        }
    }

    private func isFolderEmpty(at folderURL: URL) -> Bool {
        if let files = try? fileManager.contentsOfDirectory(atPath: folderURL.path) {
            return files.isEmpty
        }
        return false
    }
}

extension FileService {
    func initNeededFolders() {
        Folder.allCases.forEach { folder in
            checkOrCreate(pathName: folder.rawValue)
        }
    }
    
    func checkOrCreate(pathName: String) {
        let documentDir = Self.documentDirectory
        let targetUrl = documentDir.appending(path: Folder.photos.rawValue)
        if !fileManager.fileExists(atPath: targetUrl.absoluteString) {
            _ = createFolder(folderURL: targetUrl)
        }
    }
}
