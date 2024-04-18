//
//  ViewController.swift
//  lifecounter
//
//  Created by stlp on 4/17/24.
//

import UIKit

class ViewController: UIViewController {
    var P1_curr: Int = 20
    var P2_curr: Int = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var P1_Life: UILabel!
    
    @IBOutlet weak var P2_Life: UILabel!
    
    @IBAction func updateP1(_ sender: UIButton) {
        let inputAction = sender.currentTitle
        
        switch(inputAction) {
            case "+1":
                P1_curr += 1
            case "-1":
                P1_curr -= 1
            case "+5":
                P1_curr += 5
            case "-5":
                P1_curr -= 5
            default:
                print("do nothing")
        }
        
        P1_Life.text = String(P1_curr)
        checkGameOver()
    }
    
    
    @IBAction func updateP2(_ sender: UIButton) {
        let inputAction = sender.currentTitle
        
        switch(inputAction) {
            case "+1":
                P2_curr += 1
            case "-1":
                P2_curr -= 1
            case "+5":
                P2_curr += 5
            case "-5":
                P2_curr -= 5
            default:
                print("do nothing")
        }
        
        P2_Life.text = String(P2_curr)
        checkGameOver()
    }
    
    @IBOutlet weak var GameResult: UILabel!
    
    func checkGameOver() {
        if (P1_curr <= 0) {
            GameResult.text = "Player 1 LOSES"
        }
        else if (P2_curr <= 0) {
            GameResult.text = "Player 2 LOSES"
        }
    }
}

