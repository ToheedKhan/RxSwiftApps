//
//  ViewController.swift
//  LoginExample
//
//  Created by Toheed Jahan Khan on 18/01/23.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let viewModel = LoginViewModel()  // 1
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*
         ‘rx’: We access the RxSwift ‘rx’ property that gives us the extension object of the text field

         ‘text’: We access ‘text’ on top of ‘rx’, which gives us the Reactive property of the text

         ‘orEmpty’: We need to call this since it converts the optional reactive ‘String?’ property to ‘String’, basically unwrapping it

         ‘bind(to:)’: As we saw earlier, passing any object to this method binds it to the property, so here we bind the emailTextField’s text property to the viewModel’s ‘email’ observable.

         ‘disposed’: Finally, we attach the disposeBag object for cleaning it up.
         */
        emailTextField.rx.text.orEmpty.bind(to: viewModel.email)
        .disposed(by: disposeBag)
        
        passwordTextField.rx.text.orEmpty.bind(to: viewModel.password)
        .disposed(by: disposeBag)
        
        //we used ‘map’ to transform objects from one type to another. Here, we use it on viewModel’s ‘isVaild
        viewModel.isValid.map { $0 }
        .bind(to: loginButton.rx.isEnabled)
        .disposed(by: disposeBag)
        
        
        /*
         If we remove viewModel's isValid property
         
         
         
         ======
         1) We declare a variable for email and assign the Observable accessed via ‘orEmpty’ transformator
         2) Similar to 1, we declare an Observable variable for password field
         3) We use the ‘combineLatest’ operator and add both the observables. So, if there are any changes in those observables, we get a callback to the block where we perform input validations and return a boolean indicating the operations’ result. In comparison with the previous approach, all we’ve done is: moved the “ ‘combineLatest’ + input validation “ from viewModel’s ‘init’ method to here and instead of assigning the result of the operation to ‘isValid’ property, we’ve directly linked it with the loginButton’s ‘isEnabled’ property.
         */
        
        //1
        let email = emailTextField.rx.text.orEmpty.asObservable()
        //2
        let password = passwordTextField.rx.text.orEmpty.asObservable()

        //3
        Observable.combineLatest(email, password) { (email, password) in
        return email.isValidEmail()
            && password.isValidPassword()
        }
        .bind(to: loginButton.rx.isEnabled)
        .disposed(by: disposeBag)
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
            let alert = UIAlertController(title: "Login", message: "Login Button Enabled/Tapped!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    
}

