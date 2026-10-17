import SwiftUI

struct CreateAccountView: View {
    @Binding var isAuthenticated: Bool
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            Color.plantBackground.ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Create account")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.plantText)
                        
                        Text("Join us to keep your plants happy.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 20)
                    
                    // Form
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Full Name")
                            .font(.headline)
                            .foregroundColor(.plantText)
                        TextField("Maya Silva", text: $fullName)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                        
                        Text("Email")
                            .font(.headline)
                            .foregroundColor(.plantText)
                        TextField("you@example.com", text: $email)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        
                        Text("Password")
                            .font(.headline)
                            .foregroundColor(.plantText)
                        SecureField("••••••••", text: $password)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                    
                    // Actions
                    VStack(spacing: 15) {
                        // THIS BUTTON TRIGGERS LOGIN
                        Button(action: {
                            isAuthenticated = true
                        }) {
                            Text("Create Account")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.plantPrimary)
                                .cornerRadius(12)
                        }
                    }
                    
                    // Footer to go back to Sign In
                    HStack {
                        Spacer()
                        Text("Already have an account?")
                            .foregroundColor(.gray)
                        NavigationLink("Sign In", destination: SignInView(isAuthenticated: $isAuthenticated))
                            .foregroundColor(.plantPrimary)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.top, 10)
                }
                .padding(.horizontal, 25)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
