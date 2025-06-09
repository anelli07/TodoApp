import SwiftUI

struct ViewDetailsProfile: View {
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 20) {
                
                Image("profile")
                    .resizable()
                    .frame(width: 280, height: 350)
                    .cornerRadius(10)
                
                // описание
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: "graduationcap.fill")
                            .foregroundColor(.blue)
                        Text("Nazarbayev University")
                            .bold()
                    }
                    
                    HStack {
                        Image(systemName: "desktopcomputer")
                            .foregroundColor(.green)
                        Text("3rd year Computer Science student")
                            .bold()
                    }
                    HStack {
                        Image(systemName: "figure.dance")
                            .foregroundColor(.red)
                        Text("Dancer with 10 years of experience")
                    }
                    HStack {
                        Image(systemName: "trophy.fill")
                            .foregroundColor(.yellow)
                        Text("Award-winning innovator")
                    }
                    HStack {
                        Image(systemName: "sun.min")
                            .foregroundColor(.yellow)
                        Text("Motivator and Empath")
                    }
                    HStack {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.purple)
                        Text("Good person")
                    }
                }
                .padding()
                .multilineTextAlignment(.leading)
            }
            Spacer()
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Details")
                    .font(.title2)
                    .bold()
            }
        }
    }
}

#Preview {
    ViewDetailsProfile()
}
