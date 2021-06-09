//
//  Dictionary+Extension.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/2/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import Foundation

public extension Dictionary {
    var jsonString: String {
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            if let convertedString = String(data: data, encoding: String.Encoding.utf8) {
                return convertedString
            }
            return "{}"
        } catch {
            return "{}"
        }
    }
}

public extension Encodable {
    var tryJson: JSONParam? {
        guard let data = toData else {
            return nil
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
            return json as? JSONParam
        }
        catch { }
        return nil
    }

    var toData: Data? {
        let jsonEncoder = JSONEncoder()
        do {
            return try jsonEncoder.encode(self)
        }
        catch { }
        return nil
    }
}
