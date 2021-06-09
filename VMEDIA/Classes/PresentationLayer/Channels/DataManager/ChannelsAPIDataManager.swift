//
//  ChannelsAPIDataManager.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/1/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import Foundation

class ChannelsAPIDataManager {}

// MARK: - ChannelsAPIDataManagerProtocol
extension ChannelsAPIDataManager: ChannelsAPIDataManagerProtocol {
    func getChannels(_ completion: @escaping (_ response: [ChannelModel]) -> ()) {
        Network.Method.channels.emptyMsg.request(true, result: [ChannelModel].self) { (response) in
            switch response {
            case .success(let data):
                completion(data)
            case .failure(let error):
                error.notify()
            }
        }
    }
}
