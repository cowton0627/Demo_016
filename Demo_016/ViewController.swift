//
//  ViewController.swift
//  Demo_016
//
//  Created by 鄭淳澧 on 2021/7/27.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var textFieldUseProgrammingDelegate: UITextField!
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        myScrollView.setContentOffset(CGPoint(x: 0, y: 336), animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
        textField.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        myScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTextField.delegate = self
        textFieldUseProgrammingDelegate.delegate = self
        
//        let center:NotificationCenter = NotificationCenter.default
//        center.addObserver(self, selector: #selector(keyboardShown),
//                          name: UIResponder.keyboardWillShowNotification,
//                          object: nil)
        
    }
    
    @objc func keyboardShown(notification: Notification) {
        let info: NSDictionary = notification.userInfo! as NSDictionary
        //取得鍵盤尺寸
        let keyboardSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        print(keyboardSize.height)
    }
    
//    //MARK:釋放鍵盤監聽通知
//     func releaseNotification(){
//      NotificationCenter.default.removeObserver(self)
//     }
    
}

