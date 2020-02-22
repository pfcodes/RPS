//
//  Sign.swift
//  RPS
//
//  Created by Phil on 2/21/20.
//  Copyright © 2020 AURORA Digital. All rights reserved.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)
func randomSign() -> Sign {
  let sign = randomChoice.nextInt()
  if sign == 0 {
    return .rock
  } else if sign == 1 {
    return .paper
  } else {
    return .scissors
  }
}

enum Sign {
  case rock, paper, scissors
  
  var emoji: String {
    switch self {
    case .rock:
      return "👊"
    case .paper:
      return "✋"
    case .scissors:
      return "✌️"
    }
  }
  
  func getShootResult(against otherSign: Sign) -> GameState {
    if self == otherSign {
      return .draw
    }
  
    switch self {
    case .paper:
      return otherSign == .rock ? .win : .lose
    case .scissors:
      return otherSign == .paper ? .win : .lose
    case .rock:
      return otherSign == .scissors ? .win : .lose
    }
  }
}
