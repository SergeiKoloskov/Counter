//
//  ViewController.swift
//  Counter
//
//  Created by MacBookPro on 20.03.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CounterLabel: UILabel!
    
    @IBOutlet weak var addOneButton: UIButton!
    private var number = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CounterLabel.text = "Значени счетчика: \(number)"
        addOneButton.layer.cornerRadius = 16
    }


    @IBAction func AddOne(_ sender: Any) {
        number += 1
        CounterLabel.text = "Значени счетчика: \(number)"
    }
    
}

