//
//  QuestionsViewController.swift
//  Personality Quiz
//
//  Created by Steven Ybarra on 7/12/17.
//  Copyright © 2017 StevenYbarra. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {

    //----------------------------------------------------------
    //Outlets/Data Fields
    
    //question text outlet (displays actual question)
    @IBOutlet weak var questionTextLabel: UILabel!
    
    //response view outlets (vary depending on response type);
    
    //single stack view & objects;
    @IBOutlet weak var singleStackView: UIStackView!
    //buttons
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    
    //multi stack view & objects
    @IBOutlet weak var multiStackView: UIStackView!
    //labels
    @IBOutlet weak var mutliLabel1: UILabel!
    @IBOutlet weak var mutliLabel2: UILabel!
    @IBOutlet weak var mutliLabel3: UILabel!
    @IBOutlet weak var mutliLabel4: UILabel!
    //switches
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    
    //ranged stack view & objects;
    @IBOutlet weak var rangedStackView: UIStackView!
    //slider labels
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    //slider object
    @IBOutlet weak var rangedSlider: UISlider!
    
    //progress bar outlet (fills as user progresses)
    @IBOutlet weak var questionProgressView: UIProgressView!
    


    var questionIndex:Int = 0
    
    //an array of questions to display in the quiz;
    //questions are all initialized here and more can be added at the bottom;
    //be sure to follow the declaration format set below;
    var questions: [Question] = [
        
        //question 1: single response type
        Question(text: "Which of the following would you pick to eat first?",
                 type: .Single,
                 answers:
                    [
                    Answer(text: "Steak", type: .Dog),
                    Answer(text: "Caviar", type: .Cat),
                    Answer(text: "Carrot", type: .Rabbit),
                    Answer(text: "Seafood", type: .Turtle)
                    ]
        ),
        
        //question 2: multi-response type
        Question(text: "Which of the following activities do you enjoy?",
                 type: .Multiple,
                 answers:
                    [
                    Answer(text: "Swimming", type: .Turtle),
                    Answer(text: "Playing Tag", type: .Dog),
                    Answer(text: "Cuddling", type: .Rabbit),
                    Answer(text: "People Watching", type: .Cat)
                    ]
        ),

        //question 3: ranged response type
        Question(text: "How much do you enjoy car rides?",
                 type: .Ranged,
                 answers:
                    [
                    Answer(text: "I hate car rides", type: .Cat),
                    Answer(text: "They're okay but kind of scary", type: .Rabbit),
                    Answer(text: "I don't mind them at all", type: .Turtle),
                    Answer(text: "I LOVE CAR RIDES!!!", type: .Dog)
                    ]
        )
        
        //add more questions here by copying/pasting above format
    ]
    
    //array that stores the responses provided by the user
    var answersChosen:[Answer] = []
    
    //----------------------------------------------------------
    //Actions/Functions
    
    //this action is executed when any of the 4 singleView buttons are pressed;
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
            
        case singleButton2:
            answersChosen.append(currentAnswers[1])
            
        case singleButton3:
            answersChosen.append(currentAnswers[2])
            
        case singleButton4:
            answersChosen.append(currentAnswers[3])
            
        default:
            break;
        }
        
        //get the next question from questions[] array
        getNextQuestion()
    }
    
    //no arguments needed (since switches technically determine response storage and not the button)
    @IBAction func multipleAnswerButtonPressed() {
        
        
        let currentAnswers = questions[questionIndex].answers
        
        //since all 4 switches could be set to on, should 
        //only be if statements - no elses since all possible!
        if multiSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        
        if multiSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        
        if multiSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        
        if multiSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        
        //get the next question;
        getNextQuestion()
    }
    
    
    @IBAction func rangedAnswerButtonPressed() {
        
        let currentAnswers = questions[questionIndex].answers
        
        //set the
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
        answersChosen.append(currentAnswers[index])
        
        //get the next question
        getNextQuestion()
    }
    
    //continues the quiz to either next question or gets results
    func getNextQuestion() {
        
        //increase the question index +1
        questionIndex += 1
        
        //check to see if there's another question in the questions[] array
        if questionIndex < questions.count {
            //if there's another question, update UI to display it;
            updateUI()
        }
        else {
            //if there are no more questions, display results;
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
        
    }
    
    
    //updates the response view to the single stack view type
    func updateSingleStack(using answers: [Answer]) {
        
        //display the response view;
        singleStackView.isHidden = false
        
        //set the button names based on the responses in the questions array;
        //remember, answers[x] is the temp variable that 
        //uses the argument input into the method;
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
        
    }
    
    //updates the response view to the single stack view type,
    //also ensures the action objects set to default positions
    func updateMultiStack(using answers: [Answer]) {
        
        //display the response view;
        multiStackView.isHidden = false
        
        //set switches to off by default;
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        
        //set the label text based on the responses in the questions array;
        //remember, answers[x] is the temp variable that
        //uses the argument input into the method;
        mutliLabel1.text = answers[0].text
        mutliLabel2.text = answers[1].text
        mutliLabel3.text = answers[2].text
        mutliLabel4.text = answers[3].text
    }
    
    
    //updates the response view to the single stack view type,
    //also ensures the action object set to default position
    func updateRangedStack(using answers: [Answer]) {
        
        //display the response view;
        rangedStackView.isHidden = false;
        
        //set slider to default position;
        rangedSlider.setValue(0.5, animated: false)
        
        //display the 2 labels to show the spectrum limits
        //along the slider;
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
    
    
    
    //updates the view depending on the current question, response type, and progress of user;
    func updateUI() {
        
        //hides each of the 3 views by default
        singleStackView.isHidden = true;
        multiStackView.isHidden = true;
        rangedStackView.isHidden = true;
        
        //constant that gets a question from questions
        //array based on the value of questionIndex;
        let currentQuestion = questions[questionIndex]
        
        //constant that gets the answer from the current question;
        let currentAnswers = currentQuestion.answers
        
        //calculates the # of questions completed for progress bar;
        //current question # divided by total number/size of questions array;
        let totalProgress = Float(questionIndex)/Float(questions.count)
        
        
        //displays to the user the question number;
        navigationItem.title = "Question #\(questionIndex + 1)"
        
        //displays the actual text of the question;
        questionTextLabel.text = currentQuestion.text
        
        questionProgressView.setProgress(totalProgress, animated: true)
        
        //gets the (enum) type of the current question and displays
        //the appropriate view (reverses isHidden attribute to false;
        switch currentQuestion.type {
            
        case .Single:
            updateSingleStack(using: currentAnswers)
        
        case .Multiple:
            updateMultiStack(using: currentAnswers)
            
        case .Ranged:
            updateRangedStack(using: currentAnswers)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //check segue identifier (safety)
        if segue.identifier == "ResultsSegue" {
            //downcast destination for accessibility;
            let resultsViewController = segue.destination as! ResultViewController
            
            resultsViewController.responses = answersChosen
        }
    }
    
    override func viewDidLoad() {
        
        //ensure setup of the parent view
        super.viewDidLoad()
        
        //-----------------------------------------------
        // Do any additional setup after loading the view.
        //-----------------------------------------------
        
        //update the UI once this question class has loaded;
        updateUI();
        
        //hide the back button;
        navigationItem.hidesBackButton = true;
        
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
