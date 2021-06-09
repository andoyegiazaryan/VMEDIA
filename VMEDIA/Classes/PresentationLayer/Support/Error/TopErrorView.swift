//
//  TopErrorView.swift
//  VMEDIA
//
//  Created by Ando Yegiazaryan on 6/9/21.
//  Copyright © 2021 Ando Yegiazaryan. All rights reserved.
//

import UIKit

class TopErrorView: UIView {
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    internal required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private convenience init(text: String?) {
        self.init(frame: CGRect.infinite)
        errorLabel.text = text
    }
    
    private convenience init(attribute: NSAttributedString?) {
        self.init(frame: CGRect.infinite)
        errorLabel.attributedText = attribute
    }
    
    private lazy var doOneTime: Void = {
        UIView.animate(withDuration: 0.2, animations: {
            self.frame.origin.y = -self.bounds.height
            self.alpha = 0
        }, completion: { _ in
            self.removeFromSuperview()
        })
        UIApplication.shared.window?.windowLevel = UIWindow.Level.normal
    }()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3.0) {
            _ = self.doOneTime
        }
    }
    
    private func setupLabel() {
        addSubview(errorLabel)

        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            errorLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }

    private func setup() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(close))
        self.addGestureRecognizer(gesture)
        self.setupLabel()
    }
    
    @objc private func close() {
        _ = doOneTime
    }
    
    public static func showError(text: String?, success: Bool = false) {
        let view = TopErrorView(text: text)
        view.showAutoHiddenView(success: success)
    }
    
    public static func showError(attributed: NSAttributedString?, success: Bool = false) {
        let view = TopErrorView(attribute: attributed)
        view.showAutoHiddenView(success: success)
    }
    
    private func showAutoHiddenView(success: Bool = false) {
        guard let window = UIApplication.shared.window else {
            return
        }
        if success {
            self.backgroundColor = .green
        }else {
            self.backgroundColor = .red
        }
        
        _ = (window.subviews.first(where: { $0 is TopErrorView }) as? TopErrorView)?.doOneTime
        
        window.addSubview(self)
        NSLayoutConstraint.activate([
            window.topAnchor.constraint(equalTo: self.topAnchor),
            window.leftAnchor.constraint(equalTo: self.leftAnchor),
            window.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
        self.translatesAutoresizingMaskIntoConstraints = false
        window.layoutIfNeeded()
        self.alpha = 0
        self.frame.origin.y = -self.bounds.height
        UIView.animate(withDuration: 0.2) {
            self.frame.origin.y = 0
            self.alpha = 1.0
        }
    }
}
