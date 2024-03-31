import SwiftUI

struct PersonRecommendView: View {
    
    var personRecommend: PersonRecommendData = PersonRecommendData()  
    
    // UserDefautls에 사용 될 대화상대 를 담을 배열
    @State private var allPeople :[String] = []

    var body: some View {
        ZStack{
            Color(red: 240/255, green: 240/255, blue: 240/255)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Text("대화 상대 추천 ")
                        .font(.system(size: 30))
                        .bold()
                    Image(systemName: "person.line.dotted.person.fill")
                        .font(.system(size:30))
                }.padding(.bottom, 35)
                ZStack{
                    Text("\(personRecommend.randomPerson())")
                        .font(.system(size: 25))
                        .bold()
                        .frame(width: 240,height: 100)
                        .foregroundColor(.white)
                        .padding(70)
                        .padding(.bottom, 40)
                    
                    
                    Text("에게 말을 해보시겠어요 ?")
                        .foregroundColor(.white)
                        .padding(.top,50)
                    
                }.background(Color(.blue))
                    .cornerRadius(30)
                    .padding()
                
                HStack{
                    NavigationLink(destination: QuestView()) {
                        Text("OK")
                            .font(.system(size: 20))
                            .padding(.horizontal, 75)
                            .padding(.vertical, 20)
                            .background(Color.white)
                            .foregroundColor(.blue)
                            .cornerRadius(30)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.blue, lineWidth: 1)
                            )
                            .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0.0, y: 10)
                        
                            .onAppear {
                                allPeople.append(personRecommend.randomPerson())
                                UserDefaults.standard.set(allPeople, forKey: "AllPeople")
                                
                                print("Updated allChallenges array:", allPeople)
                            }
                        
                    }.buttonStyle(PressableButtonStyle())
                    
                    NavigationLink(destination: QuestView()) {
                        Text("SKIP")
                            .font(.system(size: 20))
                            .padding(.horizontal, 75)
                            .padding(.vertical, 20)
                            .background(Color.white)
                            .foregroundColor(.blue)
                            .cornerRadius(30)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(Color.blue, lineWidth: 1)
                            )
                            .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0.0, y: 10)
                        
                    }.buttonStyle(PressableButtonStyle())
                }
            }
        }
        
         .onAppear {
            if let loadedTexts = UserDefaults.standard.array(forKey: "AllPeople") as? [String] {
                self.allPeople = loadedTexts
            }
        }
         
         
    }
}

/* 
struct PersonRecommendView_Previews: PreviewProvider {
    static var previews: some View {
        PersonRecommendView()
    }
}
 */

