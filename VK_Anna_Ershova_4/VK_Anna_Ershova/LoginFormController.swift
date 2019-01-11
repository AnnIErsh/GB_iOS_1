//
//  ViewController.swift
//  VK_Anna_Ershova
//
//  Created by Anna Ershova on 17/12/2018.
//  Copyright © 2018 Anna Ershova. All rights reserved.
//

import UIKit


class LoginFormController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //очистка логина и пароля
    override func viewWillAppear(_ animated: Bool) {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
        
        // Do any additional setup after loading the view, typically from a nib.
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе -- когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }

    
    
    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
//
//    @objc func editingChanged(){
//        guard let login = loginTextField.text, let password = passwordTextField.text else {
//            return
//        }
//        if login.isEmpty || password.isEmpty {
//        }
//
//    }
    
    
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        // Получаем текст логина
        let login = loginTextField.text!
        
        
        // Проверяем, верны ли они
        if login == "admin" {
            print("верный логин")
        } else {
            print("ошибка")
        }
    }
    

    
    
    @IBAction func exit(_ sender: AnyObject) {
        
        if let exit = navigationController {
            exit.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // Проверяем данные
        let checkResult = checkUserData()
        
        // Если данные неверны, покажем ошибку
        if !checkResult {
            showLoginError()
        }
        // Вернем результат
        return checkResult
    }
    
    
    
    func checkUserData() -> Bool {

        let login = loginTextField.text!
        let password = passwordTextField.text!
        if login == "admin" && password == "123456" {
            return true
        } else {
            return false
        }
    }
    
    
    func showLoginError() {
        // Создаем контроллер
        let alter = UIAlertController(title: "Error", message: "Invalid user data", preferredStyle: .alert)
        // Создаем кнопку для UIAlertController
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        // Добавляем кнопку на UIAlertController
        alter.addAction(action)
        // Показываем UIAlertController
        present(alter, animated: true, completion: nil)
        viewWillAppear(true) // поля входа пустые снова
    
    }
    

}



