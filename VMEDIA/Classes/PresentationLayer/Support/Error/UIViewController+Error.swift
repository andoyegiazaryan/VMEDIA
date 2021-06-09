//
//  UIViewController+Error.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/9/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import UIKit

extension UIViewController {
    func notifyError(text: String?) {
        TopErrorView.showError(text: text)
    }
    
    func notifyError(attributed: NSAttributedString?) {
        TopErrorView.showError(attributed: attributed)
    }
    
    func notifyError(error: Error?) {
        TopErrorView.showError(text: error?.localizedDescription)
    }
    
    func notifySuccess(text: String?) {
        TopErrorView.showError(text: text, success: true)
    }
}

extension Error {
    func notify() {
        guard let error = self.jsonError else {
            return
        }
        TopErrorView.showError(text: error.description)
    }
}
