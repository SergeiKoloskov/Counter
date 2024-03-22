//
//  ViewController.swift
//  Counter
//
//  Created by MacBookPro on 20.03.2024.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var logsTextView: UITextView!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var substractOneButton: UIButton!
    @IBOutlet weak var addOneButton: UIButton!
    
    
    private var today = Date.now
    private let dateFormatter = DateFormatter()
    private var trueDate = ""
    private var isResseted = false
    private var lessThanZero = false
    
    private var number = 0 {
        didSet {
            if number < 0 {
                number += 1
            }
            today = Date.now
            trueDate = dateFormatter.string(from: today)
            counterLabel.text = "Значение счетчика: \(number)"
            printLogsInTextView(oldValue: oldValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logsTextView.text = "История изменений:"
        counterLabel.text = "Значение счетчика: \(number)"
        dateFormatter.dateFormat = "HH:mm:ss, dd/MM/yyyy"
        
        addOneButton.layer.cornerRadius = 16
        substractOneButton.layer.cornerRadius = 16
        resetButton.layer.cornerRadius = 12
    }


    @IBAction func AddOne(_ sender: Any) {
        number += 1
    }
    
    @IBAction func minusOne(_ sender: Any) {
        if number == 0 {
            lessThanZero = true
        }
        number -= 1
    }
    
    @IBAction func resetTheCounter(_ sender: Any) {
        isResseted = true
        number = 0
    }
    
    func printLogsInTextView(oldValue: Int) {
        
        if lessThanZero {
            logsTextView.text += "\n\(trueDate): попытка уменьшить значение счётчика ниже 0"
            lessThanZero = false
        } else {
            if isResseted {
                logsTextView.text += "\n\(trueDate): значение сброшено"
                isResseted = false
            } else {
                if oldValue < number {
                    logsTextView.text += "\n\(trueDate): значение изменено на +1"
                } else {
                    logsTextView.text += "\n\(trueDate): значение изменено на -1"
                }
            }
        }
        let range = NSRange(location: logsTextView.text.count - 1, length: 0)
        logsTextView.scrollRangeToVisible(range)
    }
    
    
}

