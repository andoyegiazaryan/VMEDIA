//
//  WireframeInterface.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/1/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Base Wireframe Interface -
protocol WireframeInterface {
    
    // MARK: REQUIRED
    var navigationController: UINavigationController? { get set }
    var viewController: UIViewController { get set }

    init(viewController: UIViewController, navigationController: UINavigationController?)
}

// MARK: - Base Wireframe Interface Default Implementation -
extension WireframeInterface {

    // MARK: CONVENIENCE INIT
//    public init(viewController: UIViewController, navigationController: UINavigationController? = nil) {
//        self.init(viewController: viewController, navigationController: navigationController)
//        self.viewController = viewController
//        self.navigationController = navigationController
//    }

    // MARK: PUSH
    func pushOnNavigationController(context: UIViewController) {
        navigationController?.pushViewController(context, animated: true)
    }

    // MARK: POP
    func popFromNavigationController() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: PRESENT
    func presentFromViewController(viewController: UIViewController, context: UIViewController) {
        viewController.present(context, animated: true, completion: nil)
    }

    // MARK: DISMISS
    func dismissViewController() {
        viewController.dismiss(animated: true, completion: nil)
    }
}
