//
//  AlphabetFilterView.swift
//  UIKitBasicApp
//
//  Created by shafia on 18/08/2025.
//

import UIKit

class AlphabetFilterView: UIView {
    
    var onLetterTapped: ((String) -> Void)?
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        scrollView.showsHorizontalScrollIndicator = false
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        scrollView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -8),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor) // keep buttons aligned
        ])
        
        addButtons()
    }
    
    private func addButtons() {
        for letter in "ABCDEFGHIJKLMNOPQRSTUVWXYZ" {
            let button = UIButton(type: .system)
            button.setTitle(String(letter), for: .normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            button.backgroundColor = .systemTeal
            button.setTitleColor(.white, for: .normal)
            button.layer.cornerRadius = 15
            button.clipsToBounds = true
            
            // fixed circle size
            button.widthAnchor.constraint(equalToConstant: 40).isActive = true
            button.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
            button.addAction(UIAction(handler: { [weak self] _ in
                self?.onLetterTapped?(String(letter))
            }), for: .touchUpInside)
            
            stackView.addArrangedSubview(button)
        }
    }
}

