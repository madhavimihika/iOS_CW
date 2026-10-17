import SwiftUI
import FirebaseAuth

struct MainTabView: View {
    var body: some View {
        TabView {
            // Real Dashboard
            DashboardView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            // Placeholder for My Plants
            Text("My Plants Coming Soon")
                .tabItem {
                    Label("My Plant", systemImage: "leaf.fill")
                }
            
            // Placeholder for Scan
            Text("Scan Coming Soon")
                .tabItem {
                    Label("Scan", systemImage: "camera.viewfinder")
                }
            
            // Placeholder for Nurseries
            Text("Nurseries Coming Soon")
                .tabItem {
                    Label("Nurseries", systemImage: "mappin.and.ellipse")
                }
            
           
            // Real Profile Tab with Log Out
            VStack {
                Text("Profile")
                    .font(.title)
                Button("Log Out") {
                    try? AuthService.shared.signOut()
                }
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.top, 20)
            }
            .tabItem {
                Label("Profile", systemImage: "person.fill")
            }
        }
        .tint(.plantPrimary)
    }
}
