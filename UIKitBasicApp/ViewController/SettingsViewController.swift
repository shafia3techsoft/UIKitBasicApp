//
//  SettingsViewController.swift
//  UIKitBasicApp
//
//  Created by shafia on 12/08/2025.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var themeStack: UIStackView!
    @IBOutlet weak var forgotPassStack: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openThemeVC))
            themeStack.isUserInteractionEnabled = true
            themeStack.addGestureRecognizer(tapGesture)
        
        let forgotPassGesture = UITapGestureRecognizer(target: self, action: #selector(openForgotPassVC))
            forgotPassStack.isUserInteractionEnabled = true
        forgotPassStack.addGestureRecognizer(forgotPassGesture)
    }
    
    @objc func openThemeVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let themeVC = storyboard.instantiateViewController(withIdentifier: "ThemeVC") as! ThemeViewController
        navigationController?.pushViewController(themeVC, animated: true)
    }
    
    @objc func openForgotPassVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let forgotPassVC = storyboard.instantiateViewController(withIdentifier: "ForgotPass1VC") as! ForgotPasswordViewController
        navigationController?.pushViewController(forgotPassVC, animated: true)
    }
    
    //Bottom Sheet
//    @objc func openThemeVC() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let themeVC = storyboard.instantiateViewController(withIdentifier: "ThemeVC") as! ThemeViewController
//        present(themeVC, animated: true, completion: nil)
//    }


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
