//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    
    let allQuestion = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    var score : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       nextQuestion()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
  
        
        if sender.tag == 1 {
            
            pickedAnswer = true
        }else if sender.tag == 2 {
            
            
            pickedAnswer = false
        }
        
        checkAnswer()
        questionNumber += 1
        
        nextQuestion()
       
    }
    
    
    func updateUI() {
        
        
        progressLabel.text = "\(questionNumber+1) / 13"
        scoreLabel.text = "Score: \(score)"
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
        
        
      
    }
    

    func nextQuestion() {
        

        if questionNumber <= 12 {
            
            
            
        questionLabel.text = allQuestion.list[questionNumber].questionText
            
        updateUI()
        
        } else {
            
            
            let alert = UIAlertController(title: "alert", message: "You finished the quiz, do you want to try it again?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                
                self.startOver()
                
                
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    
    func checkAnswer() {
        
        
        let correctAnswer = allQuestion.list[questionNumber].answer
       
        if correctAnswer == pickedAnswer {
            
            ProgressHUD.showSuccess(
            "Correct")
            
            
            score += 1
            
            
                    }else {
           
            ProgressHUD.showSuccess("Wrong!")
        }
        
        nextQuestion()
       
    }
    
    
    func startOver() {
       
        questionNumber = 0
        score = 0
        nextQuestion()
        
        
    }
    

    
}
