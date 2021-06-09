//
//  ChannelsWireframe.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/1/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import UIKit

class ChannelsWireframe: ChannelsWireframeProtocol {

    var navigationController: UINavigationController?
    
    var viewController: UIViewController
    
    required init(viewController: UIViewController, navigationController: UINavigationController? = nil) {
        self.viewController = viewController
        self.navigationController = navigationController
    }
}
