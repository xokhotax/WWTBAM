//
//  Protocols.swift
//  WWTBAM
//
//  Created by Ivan Okhota on 06.04.2022.
//

import Foundation

protocol GameVCDelegate: class {
    func didEndGame (withResult result: Int, totalQuestions: Int)
}
