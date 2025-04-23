//  LoginView_withErrorMsgs.swift
//  Boot_Validation
//  Created by Miguel Gallego on 23/4/25.
import SwiftUI

struct LoginView_withErrorMsgs: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var loginErrorMsgs = LoginErrorMsgs()
    
    var body: some View {
        Form {
            VStack(alignment: .leading) {
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                    .onChange(of: email) {
                        loginErrorMsgs.email = ""
                    }
                Text(loginErrorMsgs.email ?? "")
                    .font(.caption).foregroundStyle(.red)
            }
            VStack(alignment: .leading) {
                SecureField("Password", text: $password)
                    .onChange(of: password) {
                        loginErrorMsgs.password = ""
                    }
                Text(loginErrorMsgs.password ?? "")
                    .font(.caption).foregroundStyle(.red)
            }
            Button("Login") {
                if isFormValid {
                    // ...
                }
            }
        }
    }
    
    // MARK: - Logic
    private var isFormValid: Bool {
        loginErrorMsgs = LoginErrorMsgs()  // Clean msgs
        var isValid = true
        if email.isEmpty {
            loginErrorMsgs.email = "Email is required"
            isValid = false
        } else if !email.isValidEmail {
            loginErrorMsgs.email = "Email is not in correct format"
            isValid = false
        }
        if password.isEmpty {
            loginErrorMsgs.password = "Password is required"
            isValid = false
        }
        return isValid
    }
}

struct LoginErrorMsgs {
    var email: String?
    var password: String?
}


#Preview {
    LoginView_withErrorMsgs()
}
