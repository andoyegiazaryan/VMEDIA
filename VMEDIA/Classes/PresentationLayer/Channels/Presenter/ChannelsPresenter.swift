//
//  ChannelsPresenter.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/1/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import Foundation

class ChannelsPresenter {
    weak var view: ChannelsViewControllerProtocol?
    var interactor: ChannelsInteractorInputProtocol?
    var wireFrame: ChannelsWireframeProtocol?
}

extension ChannelsPresenter: ChannelsPresenterProtocol {
    func getChannels() {
        interactor?.getChannels()
    }
}

extension ChannelsPresenter: ChannelsInteractorOutputProtocol {
    func showChannels(channels: [ChannelModel]) {
        view?.showChannels(channels: channels)
    }
}
