//
//  ViewController.swift
//  WeatherApp
//
//  Created by Юрий Султанов on 13.12.2021.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var scrollView: UIScrollView!
    @IBAction func loginButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func unwindToMain(unwindSegue: UIStoryboardSegue) { }
    
    private let animator = SomeAnimator()
    let observer = SomeObserver()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView
            .addGestureRecognizer(
                UITapGestureRecognizer(
                    target: self,
                    action: #selector(hideKeyboard)))
        
//        let someSubs0 = SomeSubscriber()
//        let someSubs1 = SomeSubscriber()
//        let someSubs2 = SomeSubscriber()
//        let someSubs3 = SomeSubscriber()
//
//        observer.subscribe(subscriber: someSubs0)
//        observer.subscribe(subscriber: someSubs1)
//        observer.subscribe(subscriber: someSubs2)
//        observer.subscribe(subscriber: someSubs3)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(
            self,
            name: NSNotification.Name("myNewNotification"),
            object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        observer.notify()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWasShown),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillBeHidden(notification:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
        navigationController?.navigationBar.isHidden = true
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(someMethod),
            name: NSNotification.Name("myNewNotification"),
            object: nil)
    }
    
    @objc
    private func someMethod(notification: Notification) {
        let model = notification.userInfo?["someModel"] as? CityModel
        print(model)
//        view.backgroundColor = UIColor.systemGray
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        NotificationCenter.default.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
        navigationController?.navigationBar.isHidden = false
        
        
    }
    
    // MARK: - Actions
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue)
            .cgRectValue
            .size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        UIView.animate(withDuration: 1) {
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardShown" })?
                .priority = .required
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardHide" })?
                .priority = .defaultHigh
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        UIView.animate(withDuration: 1) {
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardShown" })?
                .priority = .defaultHigh
            self.scrollView.constraints
                .first(where: { $0.identifier == "keyboardHide" })?
                .priority = .required
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        switch identifier {
        case "goToMain":
            if !checkUser() {
                presentAlert()
                return false
            } else {
                clearData()
                return true
            }
        default:
            return false
        }
        
    }
    
    // MARK: - Private methods
    private func checkUser() -> Bool {
        usernameTextField.text == "" && passwordTextField.text == ""
    }
    
    private func presentAlert() {
        let alertController = UIAlertController(
            title: "Error",
            message: "Incorect username or password",
            preferredStyle: .alert)
        let action = UIAlertAction(title: "Close", style: .cancel)
        alertController.addAction(action)
        present(alertController,
                animated: true)
    }
    
    private func clearData() {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
}

extension LoginViewController: UIViewControllerTransitioningDelegate {
    func animationController(
        forPresented presented: UIViewController,
        presenting: UIViewController,
        source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        animator
    }
}
