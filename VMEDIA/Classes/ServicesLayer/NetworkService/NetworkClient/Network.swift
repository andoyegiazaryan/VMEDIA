//
//  Network.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/2/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import Foundation

class Network: NetworkClientable {
    typealias Method = Methods

    static var scheme: String {
        return "https"
    }

    static var host: String {
        return "demo-c.cdn.vmedia.ca"
    }

    static var path: String{
        return "/json/"
    }
}
