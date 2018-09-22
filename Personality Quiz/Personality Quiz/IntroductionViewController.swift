//
//  IntroductionViewController.swift
//  Personality Quiz
//
//  Created by Steven Ybarra on 7/12/17.
//  Copyright © 2017 StevenYbarra. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {

    //unwind function allows reset back to intro screen;
    @IBAction func unwindToQuizIntroduction(segue: UIStoryboardSegue) {
        //normally any data needed to be retained after reset would be passed here,
        //no data needs to be retained, so function is empty and simply
        //performs the reset back to intro screen;
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
