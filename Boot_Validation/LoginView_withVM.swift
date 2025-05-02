//  LoginView_withVM.swift
//  Boot_Validation
//  Created by Miguel Gallego on 24/4/25.
import SwiftUI

struct LoginView_withVM: View {
    @State private var loginState = LoginState()
    
    var body: some View {
        Form {
            VStack(alignment: .leading) {
                TextField("Email", text: $loginState.email)
                    .textInputAutocapitalization(.never)
                if let emailError = loginState.emailError {
                    Text(emailError.localizedDescription)
                        .font(.caption).foregroundStyle(.red)
                }
            }
            VStack(alignment: .leading)  {
                SecureField("Password", text: $loginState.password)
                if let passwordError = loginState.passwordError {
                    Text(passwordError.localizedDescription)
                        .font(.caption).foregroundStyle(.red)
                }
            }
            Button("Login") {
                if loginState.isValid() {
                    // ...
                }
            }
        }
    }
    
}

struct LoginState {             // You can write this in another file
    var email: String = ""
    var password: String = ""
    var emailError: LoginError?
    var passwordError: LoginError?
    
    mutating func isValid() -> Bool {
        clearErrors()
        
        if email.isEmpty {
            emailError = .emailEmpty
            return false
        } else if !email.isValidEmail {
            emailError = .emailInvalid
            return false
        }
        
        if password.isEmpty {
            passwordError = .passwordEmpty
            return false
        }
        return true
    }
    
    mutating func clearErrors() {
        emailError = nil
        passwordError = nil
    }
}


enum LoginError: LocalizedError {
    case emailEmpty
    case emailInvalid
    case passwordEmpty
    
    // var recoverySuggestion: String? { } // Implementación opcional
    
    var errorDescription: String? {
        switch self {
        case .emailEmpty:    "Email cannot be empty"
        case .emailInvalid:  "Email is not in correct format"
        case .passwordEmpty: "Password cannot be empty"
        }
    }
}


#Preview {
    LoginView_withVM()
}
