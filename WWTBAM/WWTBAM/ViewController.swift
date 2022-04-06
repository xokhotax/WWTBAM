//
//  ViewController.swift
//  WWTBAM
//
//  Created by Ivan Okhota on 03.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultScore: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier { case "toGame":
        guard let destination = segue.destination as? GameViewController else { return }
        destination.GameEnd = { [weak self] result in
            guard let self = self else {return}
            self.resultScore.text = "Last Score: \(result)"
        } default:
        break
        }
    }

    @IBAction func unwindToFirstScreen(_ segue: UIStoryboardSegue) {}
}

