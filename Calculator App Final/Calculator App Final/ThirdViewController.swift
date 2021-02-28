//
//  ThirdViewController.swift
//  Calculator App Final
//
//  Created by Jordan Sun on 10/13/19.
//  Copyright © 2019 Jordan Sun. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var label: UILabel!
    
    var activePlayer = 1
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameIsActive = true
    
    @IBAction func Action(_ sender: UIButton) {
        if (gameState[sender.tag-1] == 0 && gameIsActive == true){
            gameState[sender.tag-1] = activePlayer
            
            
            
            if (activePlayer == 1){
                sender.setTitle("X", for: .normal)
                activePlayer = 2
            }
            else {
                sender.setTitle("O", for: .normal)
                activePlayer = 1
            }
        }
        for combination in winningCombinations{
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                gameIsActive = false
                
                if gameState[combination[0]] == 1{
                    label.text = "Cross has won"
                }
                else {
                    label.text = "Nought has won"
                }
                
                playAgainButton.isHidden = false
                label.isHidden = false
                
            }
        }
        
        gameIsActive = false
        
        for i in gameState{
            if i == 0{
                gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false{
            label.text = "It was a draw"
            label.isHidden = false
            playAgainButton.isHidden = false
        }
        
    }
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: UIButton) {
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        label.isHidden = true
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setTitle(" ", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
