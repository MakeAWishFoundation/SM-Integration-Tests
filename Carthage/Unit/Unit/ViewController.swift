//
//  ViewController.swift
//  Unit
//
//  Created by Andrzej Michnia on 25/05/2019.
//  Copyright © 2019 MakeAWishFoundation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!

    var generator: NumberGenerator!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func generateNext() {
        numberLabel.text = "\(generator.next())"
    }
}

protocol AutoMockable { }

protocol NumberGenerator: AutoMockable {
    func next() -> Int
    func set(range: ClosedRange<Int>)
}
