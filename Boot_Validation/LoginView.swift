//  LoginView.swift
//  Boot_Validation
//  Created by Miguel Gallego on 23/4/25.
import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        Form {
            TextField("Email", text: $email)
            SecureField("Password", text: $password)
            Button("Login") {
                
            }
            .disabled(!isFormValid)
        }
    }
    
    private var isFormValid: Bool {
        !password.isEmpty && email.isValidEmail
    }
}

#Preview {
    LoginView()
}
