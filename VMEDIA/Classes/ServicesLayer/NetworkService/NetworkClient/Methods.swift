//
//  Methods.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/2/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import Foundation

enum Methods: String, Codable {
    case channels, programItems
    
}

extension Methods: Methodable {
    var name: String {
        return self.rawValue.capitalizingFirstLetter()
    }
    
    var serverInfo: ServerInfo.Type {
        return Network.self
    }
    
    var headerValues: HeaderValues? {
        return ["Content-Type": "application/json; charset=utf-8"]
    }

    var httpMethod: NetworkClientRequest.HttpMethod {
        .get
    }
}

extension Methods {
    func Message<T: Codable>(params: T) -> JsonMessage<T> {
        return JsonMessage(method: self, param: params)
    }
    
    var emptyMsg: JsonMessage<Empty> {
        return JsonMessage(method: self, param: Empty())
    }
}

