import Foundation

struct CareTask: Identifiable {
    let id = UUID()
    let plantName: String
    let botanicalName: String
    let location: String
    var isCompleted: Bool
}
