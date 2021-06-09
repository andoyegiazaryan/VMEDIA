//
//  NetworkClientable.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/1/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import Foundation

public protocol NetworkClientable: ServerInfo {
    associatedtype Method: Methodable
}

extension NetworkClientable {
    public static func cacheRequest(for method: Method) -> NetworkClientCacheRequest {
        return NetworkClientCacheRequest(method: method)
    }
    
    public static func clearCache(for method: Method) {
        try? FileManager.default.removeItem(at: method.targetCacheFolderUrl)
    }
}
