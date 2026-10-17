import SwiftUI

struct CareToolsView: View {
    // Grid layout: 2 columns
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.plantBackground.ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // Top Header
                        HStack {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("MY PLANT CARE")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                                    .tracking(1)
                                
                                Text("Care tools")
                                    .font(.system(size: 34, weight: .bold, design: .serif)) // Matches the elegant font in UI
                                    .foregroundColor(.plantText)
                            }
                            Spacer()
                            
                            // Profile Circle
                            Text("M")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 40, height: 40)
                                .background(Color.orange.opacity(0.7))
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        }
                        .padding(.top, 10)
                        
                        // Hero Image Card
                        ZStack(alignment: .bottomLeading) {
                            // Placeholder for the image. Replace "monstera_hero" with your actual asset name
                            Image("monstera_hero")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .frame(maxWidth: .infinity)
                                .clipped()
                                .cornerRadius(20)
                                // Dark gradient overlay so text is readable
                                .overlay(
                                    LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.6)]), startPoint: .center, endPoint: .bottom)
                                        .cornerRadius(20)
                                )
                            
                            VStack(alignment: .leading, spacing: 12) {
                                Text("3 plants need\nyour attention")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Button(action: { /* Action */ }) {
                                    Text("View care plan")
                                        .font(.footnote)
                                        .fontWeight(.bold)
                                        .foregroundColor(.plantPrimary)
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 8)
                                        .background(Color.white)
                                        .cornerRadius(20)
                                }
                            }
                            .padding(20)
                        }
                        
                        // Section Title
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Organize your garden")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.plantText)
                            Text("Everything your plants need, in one place.")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        // Grid of Tools
                        LazyVGrid(columns: columns, spacing: 16) {
                            ToolCard(icon: "drop.fill", iconColor: .blue, title: "Watering", subtitle: "4 plants due this week")
                            ToolCard(icon: "sparkles", iconColor: .orange, title: "Fertilizer", subtitle: "Next feed in 2 days")
                            ToolCard(icon: "chart.line.uptrend.xyaxis", iconColor: .green, title: "Growth records", subtitle: "+8.4 cm this month")
                            ToolCard(icon: "photo", iconColor: .pink, title: "Plant photos", subtitle: "48 memories")
                            ToolCard(icon: "clock.arrow.circlepath", iconColor: .purple, title: "Care history", subtitle: "All activity in one place")
                            ToolCard(icon: "camera.viewfinder", iconColor: .green, title: "Remind & Scan", subtitle: "Smart alerts and diagnosis")
                        }
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

// Reusable Tool Card Component
struct ToolCard: View {
    let icon: String
    let iconColor: Color
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            // Icon Circle
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(iconColor)
                .frame(width: 45, height: 45)
                .background(iconColor.opacity(0.15))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.plantText)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(20)
    }
}
