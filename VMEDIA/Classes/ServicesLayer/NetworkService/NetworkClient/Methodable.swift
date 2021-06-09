//
//  Methodable.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/1/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import Foundation


public protocol Methodable {
    /// Method name, like getArticles.php or articles/all
    var name: String { get }
        
    /// ServerInfo
    var serverInfo: ServerInfo.Type { get }
    
    /// Appending name component to baseUrl
    var requestUrl: URL { get }
    
    /// header values as [String: String]
    var headerValues: HeaderValues? { get }
    
    // http method
    var httpMethod: NetworkClientRequest.HttpMethod { get }
}

extension Methodable {
    public var requestUrl: URL {
        return serverInfo.baseUrl.appendingPathComponent(name)
    }
    
    public var cacheRequest: NetworkClientCacheRequest {
        return NetworkClientCacheRequest(method: self)
    }

    public var targetCacheFolderUrl: URL {
        return serverInfo.documentDirectory.appendingPathComponent("\(serverInfo.cacheRootFolderName)/\(name)")
    }
    
    fileprivate func createCacheFolderIfNeeded() throws {
        let fileManager = FileManager.default
        let path = targetCacheFolderUrl.path
        guard !fileManager.fileExists(atPath: path) else {return}
        try fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
    }
    
    public func createCacheFolderIfNeededAndReturn() throws -> URL {
        try createCacheFolderIfNeeded()
        return targetCacheFolderUrl
    }
    
    public func getCachePath(for fileName: String) throws -> URL {
        let url = try createCacheFolderIfNeededAndReturn()
        return url.appendingPathComponent(fileName)
    }
}



