import SwiftUI

struct MyBadgeView: View {
    
    @State var showView: Bool = false
    
    var body: some View{
        ScrollView{
            VStack{
                GeometryReader { geometry in 
                    VStack{
                        HStack{
                            VStack{
                                Button(action: {
                                    showView.toggle() // showView 값을 토글하여 sheet를 표시하거나 숨깁니다.
                                }) {
                                    Image("icon3")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: geometry.size.width / 3-30, height:100)
                                }
                            }.sheet(isPresented: $showView, content: {
                                SheetView()
                            })
                            
                            
                            Image("lock")
                                .resizable()
                                .grayscale(0.95)
                                .scaledToFit()
                                .frame(width: geometry.size.width / 3, height:100)
                            
                            Image("icon1")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width / 3 , height:100)
                        }.padding()
                        
                        HStack{
                            Text("첫 기록의 설렘")
                                .offset(x:-150)
                            
                            Text("꼼꼼한 여행자")
                                .offset(x:10)
                                .foregroundColor(.white)
                            
                            
                            Text("성실왕")
                                .offset(x:115)
                            
                        }
                        
                        HStack{
                            Image("icon4")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width / 3-30, height:100)
                            
                            Image("lock")
                                .resizable()
                                .grayscale(0.95)
                                .scaledToFit()
                                .frame(width: geometry.size.width / 3, height:100)
                            
                            Image("icon6")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width / 3 , height:100)
                        }.padding(.top, 65)
                        
                        HStack{
                            Text("미션왕")
                                .offset(x:-145)
                            
                            Text("게임 매니아")
                                .offset(x:5)
                                .foregroundColor(.white)
                            
                            Text("꼼꼼한 짐꾼")
                                .offset(x:150)
                            
                        }.padding()
                        
                        HStack{
                            Image("lock")
                                .resizable()
                                .grayscale(0.95)
                                .scaledToFit()
                                .frame(width: geometry.size.width / 3-30, height:100)
                            
                            Image("lock")
                                .resizable()
                                .grayscale(0.95)
                                .scaledToFit()
                                .frame(width: geometry.size.width / 3, height:100)
                            
                            Image("icon9")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width / 3 , height:100)
                        }.padding(.top, 65)
                        
                        HStack{
                            Text("따봉맨")
                                .offset(x:-150)
                                .foregroundColor(.white)
                            
                            Text("축구 매니아")
                                .offset(x:5)
                                .foregroundColor(.white)
                            
                            Text("추억 나눔가")
                                .offset(x:140)
                            
                        }.padding()
                        
                        HStack{
                            Image("lock")
                                .resizable()
                                .grayscale(0.95)
                                .scaledToFit()
                                .frame(width: geometry.size.width / 3-30, height:100)
                            
                            Image("icon11")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width / 3, height:100)
                            
                            Image("icon12")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width / 3 , height:100)
                        }.padding(.top, 65)
                        
                        HStack{
                            Text("진정한 여행가")
                                .offset(x:-150)
                                .foregroundColor(.white)
                            
                            Text("채식 주의자")
                                .offset(x:-20)
                            
                            Text("포토그래퍼")
                                .offset(x:120)
                        }.padding()
                    } 
                    
                }
                .navigationBarTitle("나의 뱃지")
            }
            
        }
    }
}
struct SheetView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                HStack{
                    Spacer()
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding(20)
                    }
                    .padding(.top, 15) // 버튼의 상단 여백 조정
                }
                Spacer( )
                Image("icon3")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .padding()
                
                
                Text("첫 기록의 설렘")
                    .padding()
                    .font(.system(size: 30))
                    .bold()
                
                Text("첫 여행기록을 남기셨네요 !\n짧은 기록 또한 언제든 좋습니다.")
                    .padding()
                
                Spacer() // 텍스트 아래 여백 조정
            }
        }
    }
}

struct MyBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        MyBadgeView()
    }
}
