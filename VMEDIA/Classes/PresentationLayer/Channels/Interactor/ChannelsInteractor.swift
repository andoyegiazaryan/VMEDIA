//
//  ChannelsInteractor.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/1/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import Foundation

class ChannelsInteractor {
    weak var presenter: ChannelsInteractorOutputProtocol?
    var channelsAPIDataManager: ChannelsAPIDataManagerProtocol?
}


// MARK: - ChannelsInteractorInputProtocol
extension ChannelsInteractor: ChannelsInteractorInputProtocol {
    func getChannels() {
        channelsAPIDataManager?.getChannels({ [weak self] in
            self?.presenter?.showChannels(channels: $0)
        })
    }
}
