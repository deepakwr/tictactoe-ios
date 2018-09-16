//
//  TicTacToe.swift
//  TicTacToe
//
//  Created by deepak chandrasekharan on 08/09/18.
//  Copyright © 2018 deepak chandrasekharan. All rights reserved.
//

import Foundation

class TicTacToe {
    
    //player id 1 - Noughts
    //player id 2 - Crosses
    
    var currentPlayer:Int;
    var isVsCPU:Bool;
    var gridValues:[Int];
    var playerWins = [1:0,2:0];
    var gameOver:Bool;
    
    let winningValues = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]];
    
    init() {
        currentPlayer = 1;
        isVsCPU = false;
        gridValues=[0,0,0,0,0,0,0,0,0];
        gameOver = false;
    }
    
    func getCurrentPlayer()->Int{
        return currentPlayer;
    }
    
    func getCurrentPlayer()->String{
        if(currentPlayer==1)
        {
            return "Noughts";
        }
        else
        {
            return "Crosses";
        }
    }
    
    func enterGridValue(index:Int,value:Int){
        print("Currentplayer " + String(currentPlayer));
        gridValues[index] = currentPlayer;
        print(gridValues);
    }
    
    func switchTurn(){
        currentPlayer = (currentPlayer == 1) ? 2: 1
    }
    
    func restart(){
        switchTurn();
        isVsCPU = false;
        gameOver = false;
        gridValues=[0,0,0,0,0,0,0,0,0];
    }
    
    func isGridEmpty(index:Int)->Bool{
        if(gridValues[index] == 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    
    func checkGameOver() -> Int{
        
        for win in winningValues{
            if( gridValues[win[0]] != 0 && gridValues[win[0]] == gridValues[win[1]]
            && gridValues[win[1]] == gridValues[win[2]] )
            {
                if(currentPlayer == 1)
                {
                    print("Noughts won");
                }
                else
                {
                 
                    print("Crosses Won");
                }
                playerWins[currentPlayer] = playerWins[currentPlayer]!+1;
                print("Noughts Wins:  " + (playerWins[1]?.description)! + " - Crosses Wins: " + (playerWins[2]?.description)!);
                gameOver = true;
                return currentPlayer;
            }
        }
        
        if(!gridValues.contains(0))
        {
            gameOver = true;
            return 0;
        }
        return -1;
  
    }
    
}
