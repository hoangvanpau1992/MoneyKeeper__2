//
//  MainTableViewController.swift
//  MoneyKeeper__2
//
//  Created by Hoang on 5/30/17.
//  Copyright © 2017 Hoang. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    static var instance: MainTableViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "MainTaleVC") as! MainTableViewController
    }

    @IBOutlet weak var borrowToPay: UIButton! {
        didSet {
            borrowToPay.setImage(UIImage(named: "Checked"), for: .normal)
            borrowToPay.setImage(UIImage(named: "Unchecked"), for: .selected)
        }
    }
    @IBOutlet var rightViewTF: UIView!
    @IBOutlet weak var keyboardTextField: UITextField!
    var string: String = ""
    var isTappingNumber: Bool = false
    var isEndOperration: Bool = true
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var operation: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardTextField.delegate = self
        registerNotificationTableCV()
        keyboardTextField.rightView = rightViewTF
        keyboardTextField.rightViewMode = .always
    }
   
    func registerNotificationTableCV(){
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: NSNotification.Name.init(NotificationKey.numberPadButtons), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification2(_:)), name: NSNotification.Name.init(NotificationKey.marksButtons), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotificationFinishAction(_:)), name: NSNotification.Name.init(NotificationKey.finishAction), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotificationCAction(_:)), name: NSNotification.Name.init( NotificationKey.cAction), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideCursor(_:)), name: NotificationKey.hiddenKeyboard, object: nil)
    }
    func handleNotification(_ notification: Notification) {
        let dict = notification.userInfo as! [String: AnyObject]
        let titleButton = dict["titleButton1"] as! String
        if isTappingNumber {
            keyboardTextField.text = keyboardTextField.text! + titleButton
        }else{
            keyboardTextField.text = titleButton
            isTappingNumber = true
        }
    }
    func handleNotification2(_ notification: Notification) {
        let dict = notification.userInfo as! [String: AnyObject]
        let titleButton = dict["titleButton2"] as! String
        operation = titleButton
        if let inputOperation = Double(keyboardTextField.text!) {
            if isEndOperration {
                firstNumber = inputOperation
                isEndOperration = false
            }else {
                firstNumber = Double(keyboardTextField.text!)!
            }
        }else{
            print("Ban can nhap so vao truoc khi thuc hien tinh toan")
        }
        isTappingNumber = false
    }
    func handleNotificationFinishAction(_ notification: Notification) {
        isTappingNumber = false
        
        var result: Double = 0
        
        if let realSecondNumber = Double(keyboardTextField.text!) {
            secondNumber = realSecondNumber
        }
        
        switch operation {
        case "+":
            result = firstNumber + secondNumber
        case "-":
            result = firstNumber - secondNumber
        case "X":
            result = firstNumber * secondNumber
        case ":":
            result = firstNumber / secondNumber
            
        default:
            print("Error Operation")
        }
        keyboardTextField.text = "\(result)"
    }
    
    func handleNotificationCAction(_ notification: Notification) {
        firstNumber = 0
        secondNumber = 0
        keyboardTextField.text = ""
        isEndOperration = true
    }
    
    func hideCursor(_ notification: Notification) {
        keyboardTextField.resignFirstResponder()
    }
    @IBAction func borrowToPay(_ sender: UIButton) {
        borrowToPay.isSelected = !borrowToPay.isSelected
        tableView.reloadData()
    }
    enum CellIndex : Int {
        case distance1
        case texFieldCalculator
        case distance2
        case category
        case description
        case distance3
        case account
        case date
        case payee
        case event
        case borrow
        case lender
        case save
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case CellIndex.texFieldCalculator.rawValue:
            return 60
        case CellIndex.lender.rawValue:
            return borrowToPay.isSelected ? 0 : 50
        case CellIndex.distance1.rawValue, CellIndex.distance2.rawValue, CellIndex.distance3.rawValue:
            return 10
        default:
            return 55
        }
    }
}

