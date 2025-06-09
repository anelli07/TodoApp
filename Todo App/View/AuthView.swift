import SwiftUI

struct AuthView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var nickname: String = ""
    @State private var password: String = ""
    @State private var isRegistration = false
    @State private var showMain = false

    @EnvironmentObject var viewModel: AuthService

    var body: some View {
        VStack {
            Spacer()
            
            if isRegistration {
                styledTextField("First name", text: $firstName)
                styledTextField("Last name", text: $lastName)
            }
            styledTextField("Nickname", text: $nickname)
            styledSecureField("Password", text: $password)
            
            if let error = viewModel.authError {
                Text(error)
                    .foregroundColor(.red)
            }
            
            Spacer()
                
            Button {
                if isRegistration {
                    viewModel.register(
                        with: User(
                            firstName: firstName,
                            lastName: lastName,
                            nickname: nickname,
                            password: password
                        )
                    )
                } else {
                    viewModel.login(nickname: nickname, password: password)
                }
            } label: {
                Text("Confirm")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: 40)
            .background(Colors.darkblue)
            .cornerRadius(16)
            
            Button {
                isRegistration.toggle()
            } label: {
                Text(isRegistration ? "Login" : "Registration")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: 40)
            .background(Colors.darkblue)
            .cornerRadius(16)
        }
        .padding(.horizontal, 16)
    }
    
    private func styledTextField(
        _ placeholder: String,
        text: Binding<String>
    ) -> some View {
        TextField(text: text) {
            Text(placeholder)
                .foregroundColor(.gray.opacity(0.6))
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray.opacity(0.4), lineWidth: 0.5)
                .background(Colors.lightblue)
                .cornerRadius(16)
        )
    }
    
    private func styledSecureField(
        _ placeholder: String,
        text: Binding<String>
    ) -> some View {
        SecureField(placeholder, text: text)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    .background(Colors.lightblue)
            )
    }
    
}
