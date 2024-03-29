//
//  ViewController.swift
//  Guess the Flag Game
//
//  Created by Yogesh Tekwani on 1/9/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!

    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var alertTitle: String
        
        if sender.tag == correctAnswer{
            alertTitle = "Correct !"
            score += 10
        } else{
            alertTitle = "Wrong !"
            score -= 10
        }
        
        let ac = UIAlertController(title: alertTitle, message: "Score = \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Contine", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
    }
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.view.backgroundColor = .tertiarySystemBackground
        
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("monaco")
        countries.append("ireland")
        countries.append("italy")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        
        countries += ["spain", "us", "uk"]
        
        button1.backgroundColor = .lightGray
        button2.backgroundColor = .lightGray
        button3.backgroundColor = .lightGray
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        askQuestion()

    }
    
    func askQuestion(alertAction: UIAlertAction! = nil){
        
        countries.shuffle()
        
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
    }


}

