//
//  GeneralFunc.swift
//  WWTBAM
//
//  Created by Ivan Okhota on 12.04.2022.
//

import Foundation

func round(_ value: Double, toDecimalPlaces places: Int) -> Double {
  let divisor = pow(10.0, Double(places))
  return round(value * divisor) / divisor
}
