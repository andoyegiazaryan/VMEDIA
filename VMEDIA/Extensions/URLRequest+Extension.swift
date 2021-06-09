//
//  URLRequest+Extension.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/2/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import Foundation

extension URLRequest {
    mutating func setHeader(values: HeaderValues?) {
        values?.forEach {
            addValue($0.value, forHTTPHeaderField: $0.key)
        }
    }
}
