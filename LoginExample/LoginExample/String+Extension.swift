//
//  String+Extension.swift
//  LoginExample
//
//  Created by Toheed Jahan Khan on 18/01/23.
//

import Foundation
extension String {
    /// Used to validate if the given string is valid email or not
    ///
    /// - Returns: Boolean indicating if the string is valid email or not
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        print("emailTest.evaluate(with: self): \(emailTest.evaluate(with: self))")
        return emailTest.evaluate(with: self)
    }
    
    /// Used to validate if the given string matches the password requirements
    ///
    /// - Returns: Boolean indicating the comparison result
    func isValidPassword() -> Bool {
        print("self.count >= 6: \(self.count >= 6)")
        return self.count >= 6
    }
}
