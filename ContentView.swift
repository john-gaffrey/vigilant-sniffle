import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello world")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(formattedDate())
                .font(.headline)
        }
        .padding()
    }

    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter.string(from: Date())
    }
}

#Preview {
    ContentView()
}
