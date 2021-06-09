//
//  ChannelsAPIDataManagerProtocol.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/1/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import Foundation

protocol ChannelsAPIDataManagerProtocol: class {
    func getChannels(_ completion: @escaping (_ response: [ChannelModel]) -> ())
}
