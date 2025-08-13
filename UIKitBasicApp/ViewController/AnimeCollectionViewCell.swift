//
//  AnimeCollectionViewCell.swift
//  UIKitBasicApp
//
//  Created by shafia on 12/08/2025.
//

import UIKit

class AnimeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var animeImageView: UIImageView!
    @IBOutlet weak var animeTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Card style
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        
        // Image rounding
        animeImageView.contentMode = .scaleAspectFill
        animeImageView.clipsToBounds = true
    }
}

