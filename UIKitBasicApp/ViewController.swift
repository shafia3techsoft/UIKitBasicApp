//
//  ViewController.swift
//  UIKitBasicApp
//
//  Created by shafia on 11/08/2025.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBAction func simpleButton(_ sender: UIButton) {
        titleLabel.text = "Simple Button Clicked!"
    }
    
    @IBAction func tintedButton(_ sender: UIButton) {
        titleLabel.text = "Tinted Button Clicked!"
    }
    @IBOutlet weak var textField : UITextField!
    @IBOutlet weak var hStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        titleLabel.text = "Yes i am in Explore View"
        titleLabel.textColor = UIColor.green
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.layer.borderColor = UIColor.systemIndigo.cgColor
        hStack.layer.borderWidth = 1.5
        hStack.layer.cornerRadius = 8.0
    }

    
}
