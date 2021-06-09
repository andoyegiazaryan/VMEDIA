//
//  NetworkClientError.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/1/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import Foundation


public enum NetworkClientError: Error {
    case none
    case unknown
    case json(description: String)
    case server(description: String)
    case dataIsEmpty
    case networkNotFound
    case cancelled
    case cacheNotFound
    case cacheDirectoryNotFound
    case responseCodeIsNot(code: Int)
    
    public var code: Int {
        switch self {
        case .none: return -1500
        case .unknown: return -1501
        case .json(_): return -1502
        case .server(_): return -1503
        case .dataIsEmpty: return -1504
        case .networkNotFound: return -1505
        case .cancelled: return -1506
        case .cacheNotFound: return -1507
        case .cacheDirectoryNotFound: return -1508
        case .responseCodeIsNot(_): return -1509
        }
    }
}

public func ==(lhs: NetworkClientError, rhs: NetworkClientError) -> Bool {
    return lhs.code == rhs.code
}

public func !=(lhs: NetworkClientError, rhs: NetworkClientError) -> Bool {
    return lhs.code != rhs.code
}


enum ErrorCode: Int, Error, Codable {
    
    case invalidJson = -10
    case faildRequest = -11
    
    case none = 0
    case unknownError = 1
    case unhandledException = 2
    case unauthorized = 3
    case notActivated = 4

    case validationError = 11

    case notfoundexception = 404
}


struct JsonError: Codable, Error {
    let method: Methods
    let errorCode: ErrorCode
    let errorDescription: Any
    
    enum keys: String, CodingKey {
        case method
        case errorCode
        case errorDescription
    }

    var description: String {
        return (self.errorDescription as? String) ?? ""
    }

    var localizedDescription: String {
        return self.description
    }

    init(from decoder: Decoder) throws {
        let value = try decoder.container(keyedBy: keys.self)
        
        self.method = try value.decode(Methods.self, forKey: .method)
        let error = try value.decode(ErrorCode.self, forKey: .errorCode)

        self.errorDescription = try value.decode(String.self, forKey: .errorDescription)
        self.errorCode = error
    }
    
    func encode (to encoder: Encoder) throws {
        var container = encoder.container (keyedBy: keys.self)
        try container.encode (method, forKey: .method)
        try container.encode (errorCode, forKey: .errorCode)
    }
}

typealias validationArray = [Validation]

struct Validation: Codable {
    var fieldName: String
    var validationError: String
}

extension Error {
    var jsonError: JsonError? {
        return self as? JsonError
    }
}
