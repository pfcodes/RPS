//
//  GameState.swift
//  RPS
//
//  Created by Phil on 2/21/20.
//  Copyright © 2020 AURORA Digital. All rights reserved.
//

import Foundation

enum GameState {
  case start, win, lose, draw
  
  var statusLabel: String {
    switch self {
    case .start: return "Rock, Paper, Scissors?"
    case .win: return "You Won!"
    case .lose: return "I Won!"
    case .draw: return "It's a Draw"
    }
  }
}
