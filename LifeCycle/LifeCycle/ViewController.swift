//
//  ViewController.swift
//  LifeCycle
//
//  Created by Steven Ybarra on 7/10/17.
//  Copyright © 2017 StevenYbarra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //work here depends on the view being loaded and ensures that said view has
        //everything ready by the time it is fully loaded; in other words, the
        //method name is from "view did load, and here's everything executed upon loading";
        
        //note this can also include network requests and access to databases;
        //also good for updating a label's font, text, or color
        //things that may only need to be performed once;
        
        //NOTE: If there is ANY set of code the parent class' implementation of
        //viewDidLoad() that ABSOLUTELY needs to run, execute with the super. keyword;
        //super.viewDidLoad() (which is set at the top by default);
        
        
        //for debugging;
        print("(1.1) FirstViewController: View Did Load");
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        //pass along the parameter given to this subclass
        //when calling the parent implementation with the
        //super. keyword;
        super.viewWillAppear(animated)
        
        print("(1.2) FirstViewController: View Will Appear");
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("(1.3) FirstViewController: View Did Appear");
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        
        print("(1.4) FirstViewController: View Will Disappear");
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated);
        
        print("(1.5) FirstViewController: View Did Disappear");
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

