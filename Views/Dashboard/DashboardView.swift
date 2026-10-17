import SwiftUI

struct DashboardView: View {
    @StateObject private var viewModel = DashboardViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.plantBackground.ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // Header
                        VStack(alignment: .leading, spacing: 5) {
                            Text(viewModel.currentDate)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text("\(viewModel.greeting), \(viewModel.userName)")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.plantText)
                        }
                        .padding(.top, 10)
                        
                        // Garden Health Card
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Garden health")
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.8))
                            
                            Text("\(viewModel.gardenHealth)%")
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(.white)
                            
                            // Progress Bar
                            GeometryReader { geometry in
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: geometry.size.width, height: 8)
                                        .foregroundColor(Color.white.opacity(0.3))
                                    
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: geometry.size.width * CGFloat(viewModel.gardenHealth) / 100, height: 8)
                                        .foregroundColor(.white)
                                }
                            }
                            .frame(height: 8)
                            
                            Text("\(viewModel.healthyCount) healthy, \(viewModel.needCareCount) need care, \(viewModel.diseaseCount) possible disease")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.8))
                        }
                        .padding(20)
                        .background(Color.plantPrimary)
                        .cornerRadius(20)
                        
                        // Weather Card
                        HStack {
                            Image(systemName: "sun.max.fill")
                                .font(.largeTitle)
                                .foregroundColor(.yellow)
                            
                            VStack(alignment: .leading) {
                                Text("Perfect growing day")
                                    .font(.headline)
                                    .foregroundColor(.plantText)
                                Text("22° - Bright indirect light")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Text("Sri Lanka")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                        
                        // Today's Care Section
                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Today's care")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                    Text("3 task waiting")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                Spacer()
                                
                                Button(action: { /* Navigate to Scan later */ }) {
                                    HStack {
                                        Image(systemName: "camera.viewfinder")
                                        Text("Scan Plant")
                                    }
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 15)
                                    .padding(.vertical, 8)
                                    .background(Color.plantPrimary)
                                    .cornerRadius(20)
                                }
                            }
                            
                            // Task List
                            ForEach(viewModel.careTasks, id: \.id) { task in
                                HStack {
                                    Image(systemName: "leaf.fill")
                                        .foregroundColor(.plantSecondary)
                                        .frame(width: 40, height: 40)
                                        .background(Color.plantBackground)
                                        .cornerRadius(10)
                                    
                                    VStack(alignment: .leading) {
                                        Text(task.plantName)
                                            .font(.headline)
                                        Text("\(task.botanicalName) • \(task.location)")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()
                                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                        .foregroundColor(task.isCompleted ? .plantPrimary : .gray)
                                        .font(.title2)
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(15)
                            }
                        }
                        
                       NavigationLink(destination: CareToolsView()) {
                           Text("Organize My Plant")
                               .font(.headline)
                               .foregroundColor(.white)
                               .frame(maxWidth: .infinity)
                               .padding()
                               .background(Color.plantPrimary)
                               .cornerRadius(15)
                       }
                       .padding(.top, 10)
                    }// Add this right under the Organize button
                    Button(action: {
                        try? AuthService.shared.signOut()
                        // RootView will automatically catch this and show the Welcome screen
                    }) {
                        Text("Log Out (Test)")
                            .font(.headline)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(15)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                }
            }
            .navigationBarHidden(true)
        }
    }
}
