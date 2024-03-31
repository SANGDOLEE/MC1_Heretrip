import SwiftUI

struct SuccessChallengeListView: View {
    
    @State private var allChallenges: [String] = []
    @State private var allPeople: [String] = []
    @State private var allImages: [Image] = []
    
    var body: some View{
        ZStack{
            Color(red: 240/255, green: 240/255, blue: 240/255)
                .ignoresSafeArea()
            
            VStack{
                HStack{
                    Spacer()
                    HStack{
                        Text("대화상대")
                            .font(.system(size: 25))
                            .bold()
                            .padding()
                    }
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0.0, y: 10)
                    .frame(width: 400, height: 125 )
                    .padding(.leading, 300)
                    
                    HStack{
                        Text("챌린지문장")
                            .font(.system(size: 25))
                            .bold()
                            .padding()
                            
                    }
                    
                        .background(Color.white)
                        .cornerRadius(30)
                        .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0.0, y: 10)
                        .frame(width: 400, height: 125 )
                     .padding(.trailing, 300)
                    Spacer()
                }.padding(.top, 125)
                HStack{
                    Spacer()
                    VStack{
                        ForEach(allPeople, id: \.self) {text in
                            Text(text)
                                .padding()
                                .foregroundColor(.blue)
                                .font(.system(size: 20))
                                .padding()
                            
                        }
                    }.background(.white)
                        .cornerRadius(30)
                    VStack{
                        ForEach(allChallenges, id: \.self) {text in
                            Text(text)
                                .padding()
                                .foregroundColor(.blue)
                                .font(.system(size: 20))
                                .padding( )
                            
                        }
                    }.background(.white)
                        .cornerRadius(30)
                    Spacer()
                }
                Spacer()
            }.onAppear(){
                UserDefaults.standard.synchronize()
                
                if let loadedTexts = UserDefaults.standard.array(forKey: "AllChallenges") as? [String] {
                    self.allChallenges = loadedTexts
                }
                if let loadedPeople = UserDefaults.standard.array(forKey: "AllPeople") as? [String] {
                    self.allPeople = loadedPeople
                }
            }
        }.navigationTitle("성공한 챌린지 목록✅")
    }
} 


/*
struct SuccessChallengeListView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessChallengeListView()
    }
}
*/
