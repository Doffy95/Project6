//
//  ViewController.swift
//  Project2
//
//  Created by ZuG on 9/20/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries: [String] = []
    var score: Int = 0
    var correctAnswer: Int = 0
    var answerTimes: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        answerTimes = 0
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        
        if answerTimes == 10 {
            score = 0
            answerTimes = 0
        }
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased() + "      Score: \(String(score))"
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var mess: String
        
        answerTimes += 1
        

        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            mess = "Your score is \(score)."
        } else {
            title = "Wrong"
            score -= 1
            mess = "The correct answer is the picture number \(String(correctAnswer + 1))"
        }
        
        if answerTimes == 10 {
            title = "congratulations".uppercased()
        }
        
        let ac = UIAlertController(title: title, message: mess, preferredStyle: .alert)
        
        if answerTimes == 10 {
            ac.addAction(UIAlertAction(title: "Play again", style: .default, handler: askQuestion))
        } else {
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        }
        present(ac, animated: true)
    }
}
