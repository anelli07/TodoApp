import SwiftUI


struct ProfileView: View {
    @EnvironmentObject var authService: AuthService

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                ZStack{
                    //Profile image
                    Circle()
                        .fill(.regularMaterial)
                        .frame(width: 100, height: 100)
                        .blur(radius: 3)
                        .shadow(color: .blue.opacity(0.8), radius: 7, x: 0, y: 0)
                    Image("profile")
                        .resizable()
                        .frame(width: 140, height: 140)
                        .clipShape(Circle())
                }
                
                //Profile name
                Text("\(authService.user?.firstName ?? "") \(authService.user?.lastName ?? "")")                    .font(.title)
                    .bold()
                
                    .padding(0.5)
                
                HStack (spacing: 20){
                    VStack {
                        Image(systemName: "calendar")
                        Text("21 y.o")
                    }
                    
                    VStack {
                        Image(systemName: "location")
                        Text("Astana")
                    }
                    
                    VStack {
                        Image(systemName: "person.2")
                        Text("1M")
                    }
                }
                .padding()
                
                // View details button
                NavigationLink (destination: ViewDetailsProfile()) {
                    Text("View Details")
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(10)
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("My Profile")
                            .font(.title2)
                            .bold()
                    }
                }
                Spacer()
                Spacer()
                Spacer()
            }
        }
    }
}

#Preview {
    ProfileView()
}
