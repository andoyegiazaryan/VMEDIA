//
//  URLResponse+Extension.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/2/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import Foundation

public extension URLResponse {
    func isStatus(code: Int) throws {
        if let statusCode = (self as? HTTPURLResponse)?.statusCode, statusCode != code {
            throw NetworkClientError.responseCodeIsNot(code: code)
        }
    }
}
