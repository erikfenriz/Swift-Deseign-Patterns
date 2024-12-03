import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }.onAppear {
            let count = 100
            
            for index in 0..<count {
                AppSettings.shared.set(value: index, forKey: String(index))
            }
            
            DispatchQueue.concurrentPerform(iterations: count) { index in
                if let n = AppSettings.shared.object(forKey: String(index)) as? Int {
                    print(n)
                }
            }
            
            AppSettings.shared.reset()
            
            DispatchQueue.concurrentPerform(iterations: count) { index in
                print("Iteration index \(index)")
                AppSettings.shared.set(value: index, forKey: String(index))
            }
        }
    }
}
