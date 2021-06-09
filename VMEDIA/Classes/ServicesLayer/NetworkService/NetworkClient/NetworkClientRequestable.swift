//
//  NetworkClientRequestable.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/1/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import Foundation

public protocol NetworkClientRequestable: class {
    init(method: Methodable, param: JSONParam, headerValues: HeaderValues)
    init(method: Methodable, param: JSONParam)
    init(method: Methodable)
}
