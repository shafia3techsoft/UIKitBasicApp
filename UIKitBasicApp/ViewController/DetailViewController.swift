//
//  DetailViewController.swift
//  UIKitBasicApp
//
//  Created by shafia on 13/08/2025.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var animeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsTextView: UITextView! // Use UITextView if text is long

    var anime: AnimeMovie? // The model you will pass in

    override func viewDidLoad() {
        super.viewDidLoad()
        if let anime = anime {
            animeImageView.image = UIImage(named: anime.imageName)
            titleLabel.text = anime.name
//            titleLabel.font =
            titleLabel.textColor = anime.backgroundColor
            detailsTextView.text = anime.details
        }
    }
}

