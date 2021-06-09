//
//  ChannelsAssembly.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/1/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import Foundation

class ChannelsAssembly {

    // Singlton
    static let shared = ChannelsAssembly()
    
    // MARK: - Init
    private init() {}
}

// MARK: Setup
extension ChannelsAssembly {
    func setup(_ viewController: ChannelsViewController) {
        let presenter = ChannelsPresenter()
        let interactor = ChannelsInteractor()
        let dataAPIManager = ChannelsAPIDataManager()
        let router = ChannelsWireframe(viewController: viewController)
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.wireFrame = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.channelsAPIDataManager = dataAPIManager
    }
}
