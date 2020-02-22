//
//  ViewController.swift
//  RPS
//
//  Created by Phil on 2/21/20.
//  Copyright © 2020 AURORA Digital. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var signLabel: UILabel!
  @IBOutlet weak var statusLabel: UILabel!
  @IBOutlet weak var rockButton: UIButton!
  @IBOutlet weak var paperButton: UIButton!
  @IBOutlet weak var scissorsButton: UIButton!
  @IBOutlet weak var playAgainButton: UIButton!
  
  var gameState: GameState = .start
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
  }
  
  func updateUI() {
    statusLabel.text = gameState.statusLabel
    if gameState != .start {
      playAgainButton.isHidden = false
    }

    switch gameState {
    case .win:
      view.backgroundColor = .green
    case .lose:
      view.backgroundColor = .red
    case .draw:
      view.backgroundColor = .yellow
    case .start:
      signLabel.text = "🤖"
      rockButton.isHidden = false
      paperButton.isHidden = false
      scissorsButton.isHidden = false
      playAgainButton.isHidden = true
      view.backgroundColor = .lightGray
    }
  }
  
  func play(sign: Sign) {
    // Disable other buttons
    switch sign {
    case .rock:
      paperButton.isHidden = true
      scissorsButton.isHidden = true
    case .paper:
      scissorsButton.isHidden = true
      rockButton.isHidden = true
    case .scissors:
      paperButton.isHidden = true
      rockButton.isHidden = true
    }

    // Seelct a sign
    let computerSelectedSign = randomSign()
    signLabel.text = computerSelectedSign.emoji
    gameState = sign.getShootResult(against: computerSelectedSign)
    
    updateUI()
  }

  @IBAction func rockButtonTapped(_ sender: Any) {
    play(sign: .rock)
  }
  
  @IBAction func paperButtonTapped(_ sender: Any) {
    play(sign: .paper)
  }
  
  @IBAction func scissorsButtonTapped(_ sender: Any) {
    play(sign: .scissors)
  }
  
  @IBAction func playAgainButtonTapped(_ sender: Any) {
    gameState = .start
    updateUI()
  }
}

