//
//  ViewController.swift
//  Counter
//
//  Created by Никита Козловский on 19.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private var count: Int = 0

    @IBOutlet weak var countHistory: UITextView!
    
    @IBOutlet weak var labelCount: UILabel!
    
    @IBOutlet weak var buttonForIncrease: UIButton!
    
    @IBOutlet weak var buttonForReduce: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Увеличивает показатель счетчика на 1
    @IBAction func increaseTheCount(_ sender: Any) {
        count += 1
        labelCount.text = "Показатель счетчика: \(count)"
        countHistoryLog("Значение увеличено на +1", withDate: true)
        rangeTextView()
    }
    
    // Уменьшает показатель счетчика на 1
    @IBAction func reduceTheCount(_ sender: Any) {
        count -= 1
        labelCount.text = "Показатель счетчика: \(count)"
        countHistoryLog("Значение уменьшено на -1", withDate: true)
        rangeTextView()
        if count <= 0 {
            labelCount.text = "0"
            count = 0
        }
    }
    
    // Сбрасывает показатель счетчика до нуля
    @IBAction func resetCount(_ sender: Any) {
        labelCount.text = "0"
        count = 0
        countHistoryLog("Значение сброшено", withDate: true)
        rangeTextView()
    }
    
    // История изменений счетчика
    private func countHistoryLog(_ text: String, withDate: Bool) {
        var currentDateTime: String
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d.M.y HH:mm:ss"
        currentDateTime = dateFormatter.string(from: date) + ": "
        count >= 0 ? countHistory.insertText("\n" + currentDateTime + text) : countHistory.insertText("\n" + currentDateTime + "Попытка уменьшить значение счетчика ниже 0")
    }
    
    // Автоскролл строки
    private func rangeTextView() {
        let range = NSMakeRange(countHistory.text.count - 1, 0)
        countHistory.scrollRangeToVisible(range)
    }
}

