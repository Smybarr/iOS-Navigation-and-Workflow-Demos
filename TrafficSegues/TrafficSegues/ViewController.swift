//
//  ViewController.swift
//  TrafficSegues
//
//  Created by Steven Ybarra on 7/9/17.
//  Copyright © 2017 StevenYbarra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var segueSwitch: UISwitch!

    
    @IBAction func yellowButtonTapped(_ sender: Any) {
        
        if segueSwitch.isOn {
            performSegue(withIdentifier: "Yellow", sender: nil)
        }
    }
    
    @IBAction func greenButtonTaped(_ sender: Any) {
        
        if !segueSwitch.isOn {
            performSegue(withIdentifier: "Green", sender: nil)
        }

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

