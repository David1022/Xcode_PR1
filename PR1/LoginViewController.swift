//
//  LoginViewController.swift
//  PR1
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    // BEGIN-UOC-2
    @IBAction func loginTapped(_ sender: UIButton) {
        var loginAllowed : Bool = false
        if let user = usernameField.text, let psw = passwordField.text {
            loginAllowed = Services.validate(username: user, password: psw)
        }
        
        if loginAllowed {
            performSegue(withIdentifier: "SegueToAuthentication", sender: self)
        } else {
            Utils.show(Message: "Sorry, the username and password are invalid", WithTitle: "Error", InViewController: self)
        }
    }
    // END-UOC-2
    
    // BEGIN-UOC-5
    override func viewWillAppear(_ animated: Bool) {
        usernameField.text = ""
        passwordField.text = ""
    }
    // END-UOC-5
    
    // BEGIN-UOC-6
    override func viewDidLoad() {
        let hour : Int = getCurrentHour()
        
        if hour == -1 {
            welcomeLabel.text = "Welcome"
        } else if (hour >= 6) && (hour < 11) {
            welcomeLabel.text = "Good morning"
            self.view.backgroundColor = UIColor.orange.lighter()
        } else if (hour >= 12) && (hour < 17) {
            welcomeLabel.text = "Good afternoon"
            self.view.backgroundColor = UIColor.yellow.lighter()
        } else if (hour >= 18) && (hour < 22) {
            welcomeLabel.text = "Good evening"
            self.view.backgroundColor = UIColor.red.lighter()
        } else {
            welcomeLabel.text = "Good night"
            self.view.backgroundColor = UIColor.blue.lighter()
        }
    }
    
    func getCurrentHour() -> Int {
        let date = Date()
        let calendar = Calendar.current
        let component = calendar.dateComponents([.hour], from: date)
        
        if let hour = component.hour {
            return hour
        } else {
            return -1
        }
    }
    // END-UOC-6
    
    @IBAction func unwindToLogin(for unwindSegue: UIStoryboardSegue, towardsViewController subsequentVC: UIViewController) {
        print("Unwind to login")
    }
}
