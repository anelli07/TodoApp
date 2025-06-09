import SwiftUI

final class AuthService: ObservableObject {
    private let userKey = "USER"
    
    @Published var user: User?
    @Published var authError: String?
    
    init() {
        fetchUser()
    }
    
    func register (with user: User) {
        guard
            user.firstName.count > 0,
            user.lastName.count > 0,
            user.nickname.count > 0,
            user.password.count > 0
        else {
            authError = "Please fill all fields"
            return
        }
        
        self.user = user
        saveUser()
        authError = nil
    }
    
    func login(nickname: String, password: String) {
        guard
            let data = UserDefaults.standard.data(forKey: userKey),
            let saveUser = try? JSONDecoder().decode(User.self, from: data)
        else {
            authError = "User not found"
            return
        }
        
        if saveUser.nickname == nickname && saveUser.password == password {
            self.user = saveUser
            authError = nil
        } else {
            authError = "Wrong nickname or password"
        }
    }
    
    func logout() {
        user = nil
        authError = nil
        UserDefaults.standard.removeObject(forKey: "USER") //очищать память
        print("🔓 User logged out")
    }
    
    private func saveUser() {
        guard let user else { return }
        
        guard let data = try? JSONEncoder().encode(user) else {return}
        
        UserDefaults.standard.set(data, forKey: userKey)
    }
    
    private func fetchUser() {
        guard
        let data = UserDefaults.standard.data(forKey: userKey),
        let decoderUser = try? JSONDecoder().decode(User.self, from: data)
        else { return }
        
        self.user = decoderUser
    }
}
