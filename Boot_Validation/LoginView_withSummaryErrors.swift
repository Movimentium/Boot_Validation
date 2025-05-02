//  LoginView_withSummaryErrors.swift
//  Boot_Validation
//  Created by Miguel Gallego on 2/5/25.
import SwiftUI

struct LoginView_withSummaryErrors: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errors: [LoginError_V2] = []
    
    var body: some View {
        Form {
            TextField("Email", text: $email)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
            Button("Login") {
                if isValid {
                    // ...
                }
            }
            if !errors.isEmpty {
                VStack(alignment: .leading) {
                    ForEach(errors) { error in
                        Text(error.localizedDescription)
                            .font(.caption).foregroundStyle(.red)
                    }
                }
            }
        }
    }
    
    var isValid: Bool {
        errors.removeAll()
        
        if email.isEmpty {
            errors.append(.emailEmpty)
        } else if !email.isValidEmail {
            errors.append(.emailInvalid)
        }
        
        if password.isEmpty {
            errors.append(.passwordEmpty)
        }
        return errors.isEmpty
    }
}


enum LoginError_V2: LocalizedError, Identifiable {
    case emailEmpty
    case emailInvalid
    case passwordEmpty
    
    var id: Int { hashValue }
 
    var errorDescription: String? {
        switch self {
        case .emailEmpty:    "Email cannot be empty"
        case .emailInvalid:  "Email is not in correct format"
        case .passwordEmpty: "Password cannot be empty"
        }
    }
}


#Preview {
    LoginView_withSummaryErrors()
}
