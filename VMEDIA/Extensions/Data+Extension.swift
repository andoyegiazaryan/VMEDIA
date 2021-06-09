//
//  Data+Extension.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/2/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import Foundation

extension Data {
    func toJson() throws -> Any {
        guard let json = try? JSONSerialization.jsonObject(with: self, options: .allowFragments) else {
            throw NetworkClientError.json(description: "can't create json from data")
        }
        return json
    }
}
