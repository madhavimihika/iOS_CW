// Views/Auth/WelcomeView.swift
import SwiftUI

struct WelcomeView: View {
    // 1. We need this binding to tell RootView when the user successfully logs in
    @Binding var isAuthenticated: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.plantBackground.ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    // Logo & Title
                    VStack(spacing: 15) {
                        Image(systemName: "leaf.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.plantSecondary)
                        
                        Text("Plant Care")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.plantPrimary)
                        
                        Text("Keep every plant happy")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.plantText)
                            .padding(.top, 10)
                        
                        Text("Care for every plant. Track growth, scan for diseases and never miss a watering.")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 40)
                    }
                    
                    Spacer()
                    
                    // 2. Navigation Buttons
                    VStack(spacing: 12) {
                        // Navigate to Sign In
                        NavigationLink(destination: SignInView(isAuthenticated: $isAuthenticated)) {
                            Text("Sign In")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.plantPrimary)
                                .cornerRadius(12)
                        }
                        
                        // Navigate to Create Account
                        NavigationLink(destination: CreateAccountView(isAuthenticated: $isAuthenticated)) {
                            Text("Create Account")
                                .font(.headline)
                                .foregroundColor(.plantPrimary)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.plantBackground)
                                .cornerRadius(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.plantPrimary, lineWidth: 1)
                                )
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 40)
                }
            }
            .navigationBarHidden(true)
        }
    }
}
