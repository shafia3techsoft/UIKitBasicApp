//
//  BorderedStackView.swift
//  UIKitBasicApp
//
//  Created by shafia on 12/08/2025.
//

import UIKit

@IBDesignable
class BorderedStackView: UIStackView {
    
    @IBInspectable var borderColor: UIColor = .systemIndigo {
        didSet { layer.borderColor = borderColor.cgColor }
    }
    
    @IBInspectable var borderWidth: CGFloat = 1.5 {
        didSet { layer.borderWidth = borderWidth }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 8.0 {
        didSet { layer.cornerRadius = cornerRadius }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
    }
}

