//
//  ViewController.swift
//  Login
//
//  Created by Steven Ybarra on 7/9/17.
//  Copyright © 2017 StevenYbarra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var forgotUsernameButton: UIButton!

    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    
    @IBAction func forgotUsernameButtonPressed(_ sender: Any) {
        
        //identifier is the string identifier of the destination segue;
        //sender should be outlet object of button that was pressed;
        performSegue(withIdentifier: "LostUsernameOrPassword", sender: forgotUsernameButton)
    }
    
    @IBAction func forgotPasswordButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "LostUsernameOrPassword", sender: forgotPasswordButton)
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //this method gives you access to the IDENTIFIER of the segue
    //that was called;
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //guard statement (early out if condition isn't met)
        //declare a constant to = sender argument and check
        //if the sender type is a UIButton;
        
        //try to cast sender argument as a UIButton;
        guard let sender = sender as? UIButton else { return }
        
        //if the safeguard was passed, execute the following;
        
        //if the UISenderButton was the forgotPasswordButton;
        if sender == forgotPasswordButton {
            //set the landing view navigation bar title to the following;
            segue.destination.navigationItem.title = "Forgot Password"
        }
        //if the UISenderButton was the forgotPasswordButton;
        else if sender == forgotUsernameButton {
            //set the landing view navigation bar title to the following;
            segue.destination.navigationItem.title = "Forgot Username";
        }
        //set the landing view navigation bar title to the textfield
        else {
            segue.destination.navigationItem.title = userNameTextField.text
        }
        
    }

}

