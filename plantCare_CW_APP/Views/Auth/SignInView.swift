import SwiftUI

struct SignInView: View {
    @Binding var isAuthenticated: Bool
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    
    var body: some View {
        ZStack {
            Color.plantBackground.ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Welcome back")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.plantText)
                        
                        Text("Sign in to keep caring for your plants.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 20)
                    
                    // Form
                    VStack(alignment: .leading, spacing: 15) {
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
                            .padding(.top, 5)
                        
                        HStack {
                            if isPasswordVisible {
                                TextField("••••••••", text: $password)
                            } else {
                                SecureField("••••••••", text: $password)
                            }
                            
                            Button(action: { isPasswordVisible.toggle() }) {
                                Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        
                        Button(action: { /* Forgot Password */ }) {
                            Text("Forgot password?")
                                .font(.footnote)
                                .foregroundColor(.plantPrimary)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    }
                    
                    // Actions
                    VStack(spacing: 15) {
                        // THIS BUTTON TRIGGERS LOGIN
                        Button(action: {
                            isAuthenticated = true
                        }) {
                            Text("Sign In")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.plantPrimary)
                                .cornerRadius(12)
                        }
                        
                        HStack {
                            VStack { Divider() }
                            Text("or")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            VStack { Divider() }
                        }
                        
                        Button(action: { /* Apple Sign In */ }) {
                            HStack {
                                Image(systemName: "applelogo")
                                Text("Continue with Apple")
                            }
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(12)
                        }
                    }
                    
                    // Footer to go to Create Account
                    HStack {
                        Spacer()
                        Text("New to PlantCare?")
                            .foregroundColor(.gray)
                        NavigationLink("Create account", destination: CreateAccountView(isAuthenticated: $isAuthenticated))
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
