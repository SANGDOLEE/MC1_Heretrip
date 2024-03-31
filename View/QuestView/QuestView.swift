import SwiftUI


struct QuestView: View {
    
    var topicRecommendKor: TopicRecommendData = TopicRecommendData()
    
    @State private var firsttext = "오늘 하루 어떠세요?"
    @State private var secondtext = "옷이 정말 잘 어울리시네요."
    @State private var thirdtext = "날씨가 참 좋은 것 같아요."
    @State private var fourtext = "사진 찍는걸 좋아하시나봐요."
    @State private var freetext = "자유주제"
  
    var body: some View{
        
        ZStack{
            Color(red: 240/255, green: 240/255, blue: 240/255)
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    VStack {
                        HStack{
                            Text("도전 할 문장을 ")
                                .font(.system(size: 30))
                                .bold()
                            
                            
                            Image(systemName: "hand.point.up.left")
                                .font(.system(size:30))
                        }.padding(.bottom, 35)
                    }
                    .padding()
                    .buttonStyle(PressableButtonStyle())
                }
                
                HStack{
                    NavigationLink(
                        destination: RecordOrNextView(challengeText:topicRecommendKor.topicData[0], copyText:$firsttext),
                        label: {
                            Text("\(topicRecommendKor.topicData[0])")
                                .font(.headline)
                                .foregroundColor(.blue)
                                .frame(height: 55)
                                .frame(width: 400)
                                .background(Color.white)
                                .cornerRadius(30)
                                .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0.0, y: 10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.blue, lineWidth: 1)
                                )
                        }
                    )
                    .buttonStyle(PressableButtonStyle())
                }.padding()
                
                HStack{
                    NavigationLink(
                        destination: RecordOrNextView(challengeText:topicRecommendKor.topicData[1], copyText:$secondtext),
                        label: {
                            Text("\(topicRecommendKor.topicData[1])")
                                .font(.headline)
                                .foregroundColor(.blue)
                                .frame(height: 55)
                                .frame(width: 400)
                                .background(Color.white)
                                .cornerRadius(30)
                                .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0.0, y: 10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.blue, lineWidth: 1)
                                )
                        }
                    )
                    .buttonStyle(PressableButtonStyle())
                }
                
                HStack{
                    NavigationLink(
                        destination: RecordOrNextView(challengeText:topicRecommendKor.topicData[2],copyText:$thirdtext),
                        label: {
                            Text("\(topicRecommendKor.topicData[2])")
                                .font(.headline)
                                .foregroundColor(.blue)
                                .frame(height: 55)
                                .frame(width: 400)
                                .background(Color.white)
                                .cornerRadius(30)
                                .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0.0, y: 10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.blue, lineWidth: 1)
                                )
                        }
                    )
                    .buttonStyle(PressableButtonStyle())
                }.padding()
                
                HStack{
                    NavigationLink(
                        destination: RecordOrNextView(challengeText:topicRecommendKor.topicData[3], copyText:$fourtext),
                        label: {
                            Text("\(topicRecommendKor.topicData[3])")
                                .font(.headline)
                                .foregroundColor(.blue)
                                .frame(height: 55)
                                .frame(width: 400)
                                .background(Color.white)
                                .cornerRadius(30)
                                .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0.0, y: 10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.blue, lineWidth: 1)
                                )
                        }
                    )
                    .buttonStyle(PressableButtonStyle())
                }
                
                HStack{
                    NavigationLink(
                        destination: RecordOrNextView(challengeText:topicRecommendKor.topicData[4],copyText:$freetext),
                        label: {
                            Text("\(topicRecommendKor.topicData[4])")
                                .font(.headline)
                                .foregroundColor(.blue)
                                .frame(height: 55)
                                .frame(width: 400)
                                .background(Color.white)
                                .cornerRadius(30)
                                .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0.0, y: 10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.blue, lineWidth: 1)
                                )
                        }
                    )
                    .buttonStyle(PressableButtonStyle())
                }.padding()
            }.padding(.top, 50)
            Spacer()
        }
        
    }
}

struct TextStyle {
    var backgroundColor: Color
    var fontColor: Color
}



/// 버튼 Custom !!
struct PressableButtonStyle: ButtonStyle {
    let scaledAmount: CGFloat
    
    init(scaledAmount: CGFloat = 0.9) {
        self.scaledAmount = scaledAmount
    }
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
        //            .brightness(configuration.isPressed ? 0.1 : 0)
            .opacity(configuration.isPressed ? 0.9 : 1.0)
    }
}

extension View {
    func withPressableStyle(_ scaledAmount: CGFloat = 0.9) -> some View {
        buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
}



struct QuestView_Previews: PreviewProvider {
    static var previews: some View {
        QuestView()
    }
}
 

