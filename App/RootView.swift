import SwiftUI
import FirebaseAuth

struct RootView: View {
    @State private var user: User? = Auth.auth().currentUser
    
    var body: some View {
        Group {
            if user != nil {
                MainTabView()
            } else {
                WelcomeView(isAuthenticated: Binding(
                    get: { user != nil },
                    set: { _ in }
                ))
            }
        }
        .id(user?.uid ?? "guest") // This forces the view to reset when logging in/out
        .onAppear {
            _ = Auth.auth().addStateDidChangeListener { _, firebaseUser in
                self.user = firebaseUser
            }
        }
    }
}
