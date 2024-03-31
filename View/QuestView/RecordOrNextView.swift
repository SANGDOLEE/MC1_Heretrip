import SwiftUI

struct RecordOrNextView: View {
    
    /// 챌린지 문장과 관련한 변수들
    var topicRecommendKor: TopicRecommendData = TopicRecommendData()
    var topicRecommendEng: TopicRecommendData = TopicRecommendData()
    
    @State private var infoMessage: String = "챌린지 문장을 터치해보세요!"
    @State var challengeText: String = "" // 챌린지 고른 문장
    @Binding var copyText: String // 뒤집으면서 보여주기위해 challengeText를 Copy함 
    
    @State var isSpinning = false
    @State var count = 0
    
    @State var challengeStart = false // 챌린지 문장을 골랐을 떄 기록하는 버튼이 등장 
    
    // modal dismiss 변수 
    @Environment(\.dismiss) private var dismiss // dismiss 변수
    @State private var isDismissAll = false // 모든 모달을 닫는 상태 변수
    
    @State private var allChallenges: [String] = []
    
    
    
    var body: some View {
    
        ZStack{
            Color(red: 240/255, green: 240/255, blue: 240/255)
                .ignoresSafeArea()
            VStack{
                HStack{
                    Text("\(infoMessage)")
                        .padding(.bottom, 35)
                        .font(.system(size: 30))
                        .bold()
                    
                }
                
                HStack{
                    Button(action: {
                        
                        withAnimation {
                            isSpinning.toggle()
                            count += 1
                            infoMessage = "Challenge Start !"
                            challengeStart = true
                            // 회전 횟수에 따라 텍스트 설정
                            if count.isMultiple(of: 2) {
                                challengeText = copyText // 도전을 고른 문장을 무조건 한국어로 보여주고
                            } else {
                                if challengeText == topicRecommendKor.topicData[0] {
                                    challengeText = topicRecommendEng.topicDataEng[0]
                                } else if challengeText == topicRecommendKor.topicData[1]{
                                    challengeText = topicRecommendEng.topicDataEng[1]
                                } else if challengeText == topicRecommendKor.topicData[2] {
                                    challengeText = topicRecommendEng.topicDataEng[2]
                                } else if challengeText == topicRecommendKor.topicData[3] {
                                    challengeText = topicRecommendEng.topicDataEng[3]
                                } else {
                                    challengeText = topicRecommendEng.topicDataEng[4]
                                }
                            }
                            
                        }
                        
                    }) {
                        Text(challengeText)
                            .font(.headline)
                            .foregroundColor(getTextSecond().fontColor)
                            .frame(height: 55)
                            .frame(width: 400)
                            .background(getTextSecond().backgroundColor)
                            .cornerRadius(30)
                            .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0.0, y: 10)
                            .rotation3DEffect(
                                .degrees(isSpinning ? 360 : 0),
                                axis: (x: 1.0, y: 0.0, z: 0.0),
                                anchor: .center,
                                anchorZ: 0,
                                perspective: 1)
                            .animation(.easeInOut(duration: 0.1), value: isSpinning)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.blue, lineWidth: 1)
                            )
                        
                    }
                }.padding()
                
                if challengeStart == true {
                    ZStack() {
                        NavigationLink(destination: RecordView()) {
                            VStack {
                                Text("바로 기록하기")
                                    .padding(.bottom, 40)
                                    .font(.system(size: 30))
                                    .padding(.trailing, 10)
                                    .bold()
                                    .foregroundColor(.blue)
                                    .frame(height: 200)
                                    .frame(width: 400)
                                    .background(.white)
                                    .cornerRadius(30)
                                    .shadow(color: Color.blue.opacity(0.3), radius: 1, x: 0.0, y: 10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(Color.blue, lineWidth: 1)
                                    )
            
                                    .onAppear {
                                        allChallenges.append(challengeText)
                                        UserDefaults.standard.set(allChallenges, forKey: "AllChallenges")
                                        
                                         print("Updated allChallenges array:", allChallenges)
                                    }
                            }
                        }
                        .buttonStyle(PressableButtonStyle())
                        
            
                        Text("사진과 글을 바로 남길래요")
                            .foregroundColor(.blue)
                            .padding(.top,50)
                        
                        
                        // Image(systemName: "scribble.variable")
                        Image(systemName: "camera.fill")
                            .font(.system(size:30))
                            .foregroundColor(.blue)
                        //.padding(.top, 120)
                            .padding(.leading, 230)
                            .padding(.bottom, 40)
                        
                    }.background(.white)
                        .cornerRadius(30)
                        .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0.0, y: 10)
                        .padding()
                    
                    ZStack {
                        Button(action: {
                            
                            allChallenges.append(challengeText)
                            UserDefaults.standard.set(allChallenges, forKey: "AllChallenges")
                            
                            UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: HomeView())
                            
                            print("Updated allChallenges array:", allChallenges)
                            
                        }, label: {
                            Text("나중에 기록하기")
                                .font(.system(size: 30))
                                .bold()
                                .padding(.trailing, 10)
                                .padding(.bottom,40)
                                .foregroundColor(.blue)
                                .frame(height: 200)
                                .frame(width:400)
                                .background(.white)
                                .cornerRadius(30)
                                .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0.0, y: 10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.blue, lineWidth: 1)
                                )
                            
                        }).buttonStyle(PressableButtonStyle())
                        
                        Text("사진과 글은 나중에 남길게요")
                            .foregroundColor(.blue)
                            .padding(.top,50)
                        
                        Image(systemName: "camera")
                            .font(.system(size:30))
                            .foregroundColor(.blue)
                            .padding(.bottom, 40)
                            .padding(.leading, 230)
                        
                    }.background(.white)
                        .cornerRadius(30)
                        .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0.0, y: 10)
                        .padding()
                    
                }
                
            }
        }
        
         .onAppear  {
            if let loadedTexts = UserDefaults.standard.array(forKey: "AllChallenges") as? [String] {
                self.allChallenges = loadedTexts
            }
        }
         
         
    }
    
    func getTextSecond() -> TextStyle {
        if count.isMultiple(of: 2) {
            return TextStyle(backgroundColor: .white, fontColor: .blue)
        } else {
            return TextStyle(backgroundColor: .blue, fontColor: .white)
        }
    }
}

struct TextStyleSecond {
    var backgroundColor: Color
    var fontColor: Color
}

/*
struct RecordOrNextView_Previews: PreviewProvider {
    static var previews: some View {
        RecordOrNextView(copyText:.constant("example Text"))
    }
}


*/


