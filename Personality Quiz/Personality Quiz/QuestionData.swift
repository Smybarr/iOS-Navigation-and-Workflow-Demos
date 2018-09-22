//
//  QuestionData.swift
//  Personality Quiz
//
//  Created by Steven Ybarra on 7/17/17.
//  Copyright © 2017 StevenYbarra. All rights reserved.
//

import Foundation

//3 types of questions - single answer, multi-answer, ranged answer
enum QuestionType {
    case Single, Multiple, Ranged
}

//enum types can be declared explicitly as long as you set the values!
enum AnimalType: Character {
    case Dog = "🐶", Cat = "🐱", Rabbit = "🐰", Turtle = "🐢"
    
    //enums can also have variables;
    //this is a calculated variable;
    var definition : String {
        
        switch self {
        case .Dog:
            return "You are very outgoing and sociable, and are the type who enjoys fun activities with great friends"
            
        case .Cat:
            return "A mild-mannered person who prefers to be pampered, and can sometimes be judgemental of others while pursuing your own goals"
        
        case .Rabbit:
            
            return "You enjoy eating healthy, are full of energy, and are an overall kind and caring person to be around"
        
        case .Turtle:
            return "Slow and steady wins the race - because of that patience, you are wise beyond your years and very detail-oriented"
        }
    }
}



struct Question {
    
    var text:String //text content of the question
    var type:QuestionType //1 of 3 ENUM types (single answer, multi-answer, scaled-response)
    var answers:[Answer] //an array of Answer objects that will be used to calculate the quiz results
    
}

struct Answer {
    var text:String
    var type:AnimalType
}
