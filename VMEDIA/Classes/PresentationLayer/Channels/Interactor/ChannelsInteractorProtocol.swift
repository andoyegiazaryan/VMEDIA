//
//  ChannelsInteractorProtocol.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/1/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import Foundation

// PRESENTER -> INTERACTOR
protocol ChannelsInteractorInputProtocol: InteractorInputInterface {
    var presenter: ChannelsInteractorOutputProtocol? { get set }
    var channelsAPIDataManager: ChannelsAPIDataManagerProtocol? { get set }

    func getChannels()
}

// INTERACTOR -> PRESENTER
protocol ChannelsInteractorOutputProtocol: InteractorOutputInterface {
    func showChannels(channels: [ChannelModel])
}
