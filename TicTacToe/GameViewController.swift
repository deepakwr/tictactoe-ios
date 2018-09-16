//
//  ViewController.swift
//  TicTacToe
//
//  Created by deepak chandrasekharan on 26/08/18.
//  Copyright © 2018 deepak chandrasekharan. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var player1WinsLabel: UILabel!
    @IBOutlet weak var player2WinsLabel: UILabel!
    @IBOutlet weak var gameOutput: UILabel!
    
    var game = TicTacToe();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        updateTurnHUD();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }

    @IBAction func restartAction(_ sender: UIButton) {
        game.restart();
        updateTurnHUD();
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton!;
            button?.setBackgroundImage(nil,for: UIControlState());
        }
        print("Restart Game");
    }
    
    func updateTurnHUD(){
        var playerTurn = "";
        if(game.getCurrentPlayer() == 1)
        {
            playerTurn = "Turn: O";
        }
        else{
            playerTurn = "Turn: X";
        }
        gameOutput.text = playerTurn;
    }
    
    @IBAction func gridPressedAction(_ sender: UIButton) {
    
        
        let id =  sender.tag-1;
        if(game.gameOver)
        {
            return;
        }
        
        if(!game.isGridEmpty(index: id))
        {
            return;
        }
        
        if(game.getCurrentPlayer() == 1)
        {
            sender.setBackgroundImage(UIImage(named:"Nought.png"), for: UIControlState());
        }
        else{
            sender.setBackgroundImage(UIImage(named:"Cross.png"), for: UIControlState());
        }
        
        game.enterGridValue(index: id, value: 0);
        
        let playerWin = game.checkGameOver();
        if(playerWin != -1)
        {
            gameOutput.isHidden = false;
            if(playerWin == 0)
            {
                gameOutput.text = "It's a Draw !";
            }
            else{
                gameOutput.text = game.getCurrentPlayer() + " Won !";
            }
            
            
            player1WinsLabel.text = "Noughts : " + (game.playerWins[1]?.description)!;
            player2WinsLabel.text = "Crosses : " + (game.playerWins[2]?.description)!;
            
            return;
        }
        
        game.switchTurn();
        updateTurnHUD();
    
    }
}

