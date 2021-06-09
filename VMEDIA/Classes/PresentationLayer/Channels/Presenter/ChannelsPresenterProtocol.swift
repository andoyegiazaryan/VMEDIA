//
//  ChannelsPresenterProtocol.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/1/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import Foundation

protocol ChannelsPresenterProtocol: PresenterInterface {
    var view: ChannelsViewControllerProtocol? { get set }
    var interactor: ChannelsInteractorInputProtocol? { get set }
    var wireFrame: ChannelsWireframeProtocol? { get set }

    func getChannels()
}
