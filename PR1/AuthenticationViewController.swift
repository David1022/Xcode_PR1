//
//  AuthenticationViewController.swift
//  PR1
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class AuthenticationViewController: UIViewController, UITextFieldDelegate {
    // BEGIN-UOC-4
    @IBOutlet var firstField: UITextField!
    @IBOutlet var secondField: UITextField!
    @IBOutlet var thirdField: UITextField!
    @IBOutlet var fourthField: UITextField!
    
    @IBAction func editingTextField(_ sender: UITextField) {
        if let text = sender.text, text.count > 1 {
            sender.text = "\(text.dropLast(text.count - 1))"
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        // TODO: Se puede mejorar este código???
        let code : String = "\(firstField?.text ?? "")\(secondField?.text ?? "")\(thirdField?.text ?? "")\(fourthField?.text ?? "")"
        if Services.validate(code: code) {
            performSegue(withIdentifier: "SegueToMainNavigation", sender: self)
        } else {
            Utils.show(Message: "Sorry, the entered code is not valid", WithTitle: "Error", InViewController: self)
        }
    }
    // END-UOC-4
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    } 
}
