//
//  DetailViewController.swift
//  UIKitBasicApp
//
//  Created by shafia on 13/08/2025.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsTextView: UITextView! // Use UITextView if text is long

    var meal: Meal? // The model you will pass in

    override func viewDidLoad() {
        super.viewDidLoad()
        if let meal = meal {
            
            if let urlString = meal.strMealThumb, let url = URL(string: urlString) {
                DispatchQueue.global().async {
                    if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.mealImageView.image = image
                        }
                    }
                }
            } else {
                mealImageView.image = UIImage(systemName: "photo")
            }
            
            titleLabel.text = meal.strMeal
            titleLabel.font = AppFont.shared.headingRegular
            titleLabel.textColor = .peach
            detailsTextView.text = "\(meal.strInstructions ?? "") \n\n -> Ingredients:\n \(meal.ingredients)"
        }
    }
}

