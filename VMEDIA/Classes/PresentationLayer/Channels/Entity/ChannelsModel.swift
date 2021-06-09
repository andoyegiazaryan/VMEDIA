//
//  ChannelsModel.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/9/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import Foundation

struct ChannelModel: Codable, Hashable {
    var id, orderNum, accessNum: Int
    var CallSign: String
}
