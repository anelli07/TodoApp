import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            TodoListTab()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Todo")
                }
            ProfileTab()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }
    }
}

struct TodoListTab: View {
        var body: some View {
            NavigationView {
                TodoListView()
                    .navigationTitle(Text("My todos"))
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }

struct ProfileTab: View {
        @EnvironmentObject var viewModel: AuthService
        
        var body: some View {
            NavigationStack {
                VStack {
                    ProfileView()
                    Button {
                        viewModel.logout()
                    } label: {
                        Text("Logout")
                            .foregroundColor(.red)
                            .padding(.top)
                    }
                }
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.large)
            }
        }
    }


