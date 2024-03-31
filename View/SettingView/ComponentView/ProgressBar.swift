import SwiftUI

struct ProgressBar: View {
    
    @State private var dataCount: Float = 0 // 데이터 개수를 저장할 상태 변수
    
    var body: some View {
        VStack {
            ProgressView(value: dataCount, total: 10)
                .accentColor(Color.blue)
                .scaleEffect(x: 1, y: 4, anchor: .center)
            
            Text("현재 \(Int(dataCount))명과 인연을 맺었습니다 !")
                .bold()
                .foregroundColor(.blue)
                .padding(.top, 8)
                
        }
        .onAppear {
            // UserDefaults에서 데이터 가져오기
            if let dataArray = UserDefaults.standard.array(forKey: "AllChallenges") as? [String] {
                // 데이터 개수 설정
                dataCount = Float(dataArray.count)
                print(dataCount)
            } else {
                // 데이터를 불러오는 데 실패한 경우
                print("데이터를 불러오는 데 실패했습니다.")
            }
        }
    }
}
