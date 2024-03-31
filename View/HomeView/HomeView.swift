import SwiftUI


struct HomeView: View {
    
    // @State var nickname: String // Account에서 입력받은 nickname 값을 가져옴
    // @State var profileImage: Image?
    
    // @Binding var addImage: Image
    // @Binding var addText: String?
    
    @State var peopleCount = 0
    
    
    var body: some View {
        NavigationView{
            
            GeometryReader { geometry in 
                
                ZStack{
                    Color(red: 240/255, green: 240/255, blue: 240/255)
                        .ignoresSafeArea()
                    
                    VStack {
                        
                        HStack {
                            
                            Spacer()
                            /*
                             // 설정 뷰
                             
                             Button(action: {
                             // push 알림 확인하는 action code
                             // 여기에 네비게이션 링크를 활성화
                             }) {
                             NavigationLink(
                             destination: SettingView(nickname: $nickname, profileImage: $profileImage ),
                             label: {
                             Image(systemName: "gear")
                             .font(.largeTitle)
                             .foregroundColor(.black)
                             }
                             )
                             }
                             */
                        }.padding(20)
                        
                        
                        Spacer()
                        HStack {
                            /*
                             ZStack {
                             /*
                              Text("🌎")
                              .font(.system(size: 20))
                              .padding(.trailing, 280)
                              .padding(.bottom, 140)
                              
                              Text("Hello")
                              .bold()
                              .padding(.trailing, 150)
                              .padding(.bottom, 140)
                              .font(.system(size: 20))
                              */
                             Image("sky")
                             .resizable()
                             .frame(width:320, height: 130)
                             .cornerRadius(30)
                             .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0.0, y: 10)
                             .padding(.top, 40)
                             
                             Text("나의 위치")
                             .foregroundColor(.white)
                             .bold()
                             .font(.system(size: 20))
                             .padding(.trailing, 200)
                             .padding(.bottom, 40)
                             
                             Text("포항")
                             .foregroundColor(.white)
                             .padding(.trailing, 240)
                             .padding(.top, 10)
                             
                             Text("맑음")
                             .foregroundColor(.white)
                             .padding(.trailing, 240)
                             .padding(.top, 120)
                             
                             Text("12°")
                             .foregroundColor(.white)
                             .bold()
                             .font(.largeTitle)
                             .font(.system(size: 20))
                             .padding(.leading, 230)
                             .padding(.bottom, 40)
                             
                             Text("최고:20° 최저:8° ")
                             .foregroundColor(.white)
                             .padding(.top, 120)
                             .padding(.leading, 170)
                             
                             }.frame(width:550, height: 200 )
                             .background(Color.white)
                             .cornerRadius(30)
                             .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0.0, y: 10)
                             */
                            
                        }
                        Spacer()
                        VStack{
                            
                            HStack{
                                Image("appLogo")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .padding()
                                Spacer()
                               
                            }
                            HStack{
                                ProgressBar()
                                    .padding([.leading, .trailing], 10)
                                    .padding(.bottom, 40)
                            }
                            
                        }
                        .frame(width: 550, height: 150 )
                        .background(.white)
                        .cornerRadius(30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color(red: 240/255, green: 240/255, blue: 240/255), lineWidth: 1)
                        ).padding(.horizontal, 60)
                            .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0.0, y: 10)
                            .padding()
                        
                        
                        
                        VStack{
                            ZStack {
                                // 배경 이미지
                                Image("travel1")
                                    .resizable()
                                    .scaledToFill()
                                    .edgesIgnoringSafeArea(.all)
                                    .opacity(0.75)
                                
                                // 텍스트와 이미지를 올립니다.
                                VStack {
                                    NavigationLink(
                                        destination: BeforeRecordView(), 
                                        label: {
                                            Text("여행 목록")
                                                .foregroundColor(.white)
                                                .bold()
                                                .font(.system(size: 25))
                                            
                                            Image(systemName: "square.3.layers.3d")
                                                .foregroundColor(.white)
                                                .font(.system(size: 25))
                                        }
                                    )
                                }
                            }
                            .frame(width: 550, height: 125 )
                            .background(Color.white)
                            .cornerRadius(30)
                            .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0.0, y: 10)
                            .padding()
                            
                            ZStack {
                                Image("travel2")
                                    .resizable()
                                    .scaledToFill()
                                    .edgesIgnoringSafeArea(.all)
                                    .opacity(0.75)
                                
                                VStack{
                                    NavigationLink(
                                        destination: SuccessChallengeListView(), 
                                        label: {
                                            Text("챌린지 목록")
                                                .foregroundColor(.white)
                                                .bold()
                                                .font(.system(size: 25))
                                            
                                            Image(systemName: "square.3.layers.3d")
                                                .foregroundColor(.white)
                                                .font(.system(size: 25))
                                            
                                        }
                                    )
                                }
                            }.frame(width: 550, height: 125 )
                                .background(Color.white)
                                .cornerRadius(30)
                                .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0.0, y: 10)
                                .padding()
                            
                            
                            ZStack {
                                Image("travel3")
                                    .resizable()
                                    .scaledToFill()
                                    .edgesIgnoringSafeArea(.all)
                                    .opacity(0.75)
                                
                                VStack{
                                    NavigationLink(
                                        destination: MyBadgeView(), 
                                        label: {
                                            Text("뱃지 목록")
                                                .foregroundColor(.white)
                                                .bold()
                                                .font(.system(size: 25))
                                            
                                            Image(systemName: "square.3.layers.3d")
                                                .foregroundColor(.white)
                                                .font(.system(size: 25))
                                        }
                                    )
                                }
                            }.frame(width: 550, height: 125 )
                                .background(Color.white)
                                .cornerRadius(30)
                                .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0.0, y: 10)
                                .padding()
                            
                          
                        }
                        GeometryButtonView() // 챌린지 시작 버튼
                            .padding(.bottom,30)
                            .bold()
                        
                    }.padding(.top,100)
                }
                
            }
        }.onAppear {
            // UserDefaults에서 데이터 가져오기
            if let dataArray = UserDefaults.standard.array(forKey: "AllChallenges") as? [String] {
                // 데이터 개수 설정
                self.peopleCount = dataArray.count
            } else {
                // 데이터를 불러오는 데 실패한 경우
                print("데이터를 불러오는 데 실패했습니다.")
            }
        }
    }
}



/*
 struct HomeView_Previews: PreviewProvider {
 static var previews: some View {
 HomeView(addImage: .constant(nil))
 }
 }
 */


