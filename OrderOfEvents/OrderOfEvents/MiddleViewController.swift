//
//  MiddleViewController.swift
//  OrderOfEvents
//
//  Created by Steven Ybarra on 7/11/17.
//  Copyright © 2017 StevenYbarra. All rights reserved.
//

import UIKit

class MiddleViewController: UIViewController {

    
    
    
    
    @IBOutlet weak var outcomeLabel: UILabel!
    
    //add 1 to eventNumber numbering events as they're added
    //to outcomeLabel
    var eventNumber:Int = 1
    
    /*  1) Use conditional binding to unwrap the existing text
            in the label;
        2) Set the label text = to what was already there plus
            a statement about the lifecycle event that just occurred;
        3) update eventNumber;
     */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let existingText = outcomeLabel.text {
            outcomeLabel.text = "\(existingText)\nEvent Number \(eventNumber) was viewDidLoad";
            eventNumber += 1;
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //conditional binding to unrwap outcomeLabel.text
        if let existingText = outcomeLabel.text {
            outcomeLabel.text = "\(existingText)\nEvent Number \(eventNumber) was viewWillAppear";
            eventNumber += 1;
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //conditional binding to unrwap outcomeLabel.text;
        if let existingText = outcomeLabel.text {
            outcomeLabel.text = "\(existingText)\nEvent Number \(eventNumber) was viewDidAppear";
            eventNumber += 1;
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let existingText = outcomeLabel.text {
            outcomeLabel.text = "\(existingText)\nEvent Number \(eventNumber) was viewWillDisappear";
            eventNumber += 1;
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if let existingText = outcomeLabel.text {
            outcomeLabel.text = "\(existingText)\nEvent Number \(eventNumber) was viewDidDisappear";
            eventNumber += 1;
        }
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
