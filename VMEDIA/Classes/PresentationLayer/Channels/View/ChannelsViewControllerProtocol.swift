//
//  ChannelsViewControllerProtocol.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/1/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import Foundation

// PRESENTER -> VIEW
protocol ChannelsViewControllerProtocol: ViewInterface {
    var presenter: ChannelsPresenterProtocol? { get set }

    func showChannels(channels: [ChannelModel])
}
