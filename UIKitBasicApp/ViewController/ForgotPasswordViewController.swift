//
//  ForgotPasswordViewController.swift
//  UIKitBasicApp
//
//  Created by shafia on 12/08/2025.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var hStackUserName: BorderedStackView!
    @IBOutlet weak var hStackPass: BorderedStackView!
    @IBOutlet weak var hStackConfirmPass: BorderedStackView!
//    @IBOutlet weak var myStack: BorderedStackView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBAction func changePassButton(_ sender: UIButton) {
        print("Tinted Button Clicked!")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        hStackUserName.translatesAutoresizingMaskIntoConstraints = false
//        hStackUserName.layer.borderColor = UIColor.systemIndigo.cgColor
//        hStackUserName.layer.borderWidth = 1.5
//        hStackUserName.layer.cornerRadius = 8.0
//        logoImageView.layer.cornerRadius = 10.0
//        logoImageView.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logoImageView.layer.cornerRadius = 10.0
        logoImageView.clipsToBounds = true
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            view.frame.origin.y = -keyboardFrame.height / 2 // Adjust value as needed
        }
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        view.frame.origin.y = 0
    }



    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
