//  LoginView_withVM.swift
//  Boot_Validation
//  Created by Miguel Gallego on 24/4/25.
import SwiftUI

struct LoginView_withVM: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        Form {
            TextField("Email", text: $email)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
            Button("Login") {
                
            }
        }
    }
    
    // MARK: - Logic
    private var isFormValid: Bool {
        !password.isEmpty && email.isValidEmail
    }

}

struct LoginState {
    
}


enum LoginError: Error, LocalizedError {
    case emailEmpty
    case emailInvalid
    case passwordEmpty
    
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
