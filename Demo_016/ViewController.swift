//
//  ViewController.swift
//  Demo_016
//
//  Created by 鄭淳澧 on 2021/7/27.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var cTextField: UITextField!
    @IBOutlet weak var bTextField: UITextField!
    @IBOutlet weak var aTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        aTextField.delegate = self
        cTextField.delegate = self
        hideKeyboardWhenTappedAround()

        
        let center: NotificationCenter = NotificationCenter.default
        center.addObserver(self,
                           selector: #selector(keyboardShown),
                           name: UIResponder.keyboardWillShowNotification,
                           object: nil)
    }
    
    
    private func hideKeyboardWhenTappedAround() {
        let tapAround: UITapGestureRecognizer =
        UITapGestureRecognizer(target: self,
                               action: #selector(dismissKeyboard))
        tapAround.cancelsTouchesInView = false
        view.addGestureRecognizer(tapAround)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardShown(notification: Notification) {
        let info: NSDictionary = notification.userInfo! as NSDictionary
        // 取得鍵盤尺寸
        let keyboardSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        print(keyboardSize.height)
    }
    
    
    
//    // 釋放鍵盤監聽通知
//     func releaseNotification() {
//      NotificationCenter.default.removeObserver(self)
//     }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        var height: CGFloat = 0
        let screenHeight = UIScreen.main.bounds.height
        let offsetY: CGFloat = 20
        switch textField {
        case aTextField:
            height = aTextField.frame.maxY - (screenHeight - 336) + offsetY
        case bTextField:
            height = bTextField.frame.maxY - (screenHeight - 336) + offsetY
        case cTextField:
            height = cTextField.frame.maxY - (screenHeight - 336) + offsetY
        default: break
        }
        myScrollView.setContentOffset(CGPoint(x: 0, y: height), animated: true)

//        myScrollView.setContentOffset(CGPoint(x: 0, y: 336), animated: true)
        // 123
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
        textField.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        myScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
}

