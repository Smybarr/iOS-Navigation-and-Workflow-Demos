//
//  ViewController.swift
//  Personality Quiz
//
//  Created by Steven Ybarra on 7/12/17.
//  Copyright © 2017 StevenYbarra. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultAnswerLabel: UILabel!
    
    @IBOutlet weak var resultDescriptionLabel: UILabel!
    
    
    
    //array that holds the responses;
    //bang operator ! gurantees there will be values for respones array
    var responses:[Answer]!
    
    
    
    
    func calculatePersonalityResult() {
        
        //create a dictionary map with animal type and # of responses;
        var frequencyOfAnswers:[AnimalType:Int] = [:]
        
        let responseTypes = responses.map { $0.type }
        
        //iterate through responseTypes map to add/update key value pairs;
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by:
        { (pair1, pair2) -> Bool in
                return pair1.value > pair2.value
        } )
        
        //shorter version:
        //let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        //set the mostCommonAnswer value to the first item in the sorted array;
        let mostCommonAnswer = frequentAnswersSorted.first!.key
        
        //set the resultAnswerLabel = to the calculated animal value;
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        
        //set the result label = definition for mostCommonAnswer
        resultDescriptionLabel.text = mostCommonAnswer.definition
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        calculatePersonalityResult()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

