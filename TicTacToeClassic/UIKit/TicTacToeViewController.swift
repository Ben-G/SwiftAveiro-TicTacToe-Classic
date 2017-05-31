//
//  ViewController.swift
//  TicTacToeFlux
//
//  Created by Benji Encz on 5/21/17.
//  Copyright © 2017 Benjamin Encz. All rights reserved.
//

import UIKit

class TicTacToeViewController: UIViewController {

    @IBOutlet var instructionLabel: UILabel!

    var game = Game() {
        didSet {
            self.connect4View.board = game.board
            self.instructionLabel.text = "Place an \(self.game.currentPlayer.rawValue)"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.instructionLabel.text = "Place an \(self.game.currentPlayer.rawValue)"

        self.connect4View.buttonTappedClosure = { index in
            let movePossible = self.game.attemptPlacing(atIndex: index)
            if !movePossible {
                self.instructionLabel.text = "Move is not possible! Place \(self.game.currentPlayer.rawValue) again."
            }

            if let winner = self.game.winner {
                self.instructionLabel.text = "Player \(winner) Wins!!"
            }
        }
    }

    // MARK: View Setup

    lazy var connect4View: TicTacToeView = {
        let view = Bundle.main.loadNibNamed(
            "TicTacToeView", owner: nil, options: nil
            )?.first as! TicTacToeView

        view.frame = CGRect(
            x: 0,
            y: 0,
            width: self.view.frame.size.width,
            height: self.view.frame.size.width
        )
        view.center = self.view.center
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(view)

        view.board = Board()
        view.backgroundColor = .clear
        
        return view
    }()
    
}


