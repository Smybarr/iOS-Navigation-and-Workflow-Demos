//
//  RedViewController.swift
//  Rainbow Tabs
//
//  Created by Steven Ybarra on 7/9/17.
//  Copyright © 2017 StevenYbarra. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        //this sets the badge notification display to "!" programmatically during runtime;
        tabBarItem.badgeValue = "!";
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

