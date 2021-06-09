//
//  Error+Extension.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/2/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import Foundation

extension Error {
    public var errorCode: NetworkClientError {
        guard let urlError = self as? URLError else { return .unknown }
        
        switch urlError.code {
        case .notConnectedToInternet, .networkConnectionLost: return .networkNotFound
        case .cancelled: return .cancelled
        default: return .unknown
        }
    }
}
