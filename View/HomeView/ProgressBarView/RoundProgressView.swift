import SwiftUI

struct RoundProgressView : View {
    
    @State var progress: Double = 0.15
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                
                CircleProgressBar(progress: progress)
                
                Text("\(progress * 100, specifier: "%.0f")")
                    .font(.largeTitle)
                    .bold()
            }.frame(width: 200, height: 200)
            /*
            Spacer()
            HStack {
                // 4
                // Slider(value: $progress, in: 0...1)
                // 5
                //Button("Reset") {
                //    resetProgress()
                //}.buttonStyle(.borderedProminent)
            }
             */
        }
    }
    
    func resetProgress() {
        progress = 0
    }
}


