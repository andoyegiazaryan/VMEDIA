//
//  UIApplication+Extension.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/9/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import UIKit

extension UIApplication {
    var window: UIWindow? {
        let application = UIApplication.shared
        if #available(iOS 13.0, *) {
            return UIApplication.shared.connectedScenes
                    .filter({$0.activationState == .foregroundActive})
                    .map({$0 as? UIWindowScene})
                    .compactMap({$0})
                    .first?.windows
                    .filter({$0.isKeyWindow}).first
        } else {
            return application.keyWindow
        }
    }
}
