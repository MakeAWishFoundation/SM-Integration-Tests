//
//  ViewController.swift
//  Prototyping
//
//  Created by Andrzej Michnia on 25/05/2019.
//  Copyright © 2019 MakeAWishFoundation. All rights reserved.
//

import UIKit
import SwiftyPrototype

class ViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!

    let generator = NumberGeneratorMock()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print()

        Given(generator, .next(willReturn: 1,2,5,3,43,8,6,4,3,5,6,0))
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
