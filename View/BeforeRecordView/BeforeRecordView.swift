import SwiftUI

struct BeforeRecordView: View {
    
    @State private var allTexts: [String] = []
    let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: 2) // 2열로 그리드 아이템 정의
    
    //@State private var image: Image?
    
    @State var showDetail: Bool = false
    
    
    init() {
        // 이니셜라이저를 사용하여 뷰가 생성될 때 UserDefaults에서 값을 읽어와 allTexts 배열에 설정합니다.
        if let loadedTexts = UserDefaults.standard.array(forKey: "AllTexts") as? [String] {
            self._allTexts = State(initialValue: loadedTexts)
        }
    }
    
    
    var body: some View {
        ZStack{
            Color(red: 240/255, green: 240/255, blue: 240/255)
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    Spacer()
                    ZStack {
                        HStack{
                            HStack{
                                Text("지난 여행 목록")
                                    .font(.system(size: 25))
                                    .bold()
                                    .padding()
                                
                                Image(systemName: "photo.on.rectangle.angled")
                                    .font(.system(size:25))
                            }
                            .padding(.horizontal, 100)
                            .background(Color.white)
                            .cornerRadius(30)
                            .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0.0, y: 10)
                            .frame(width: 800, height: 125 )
                        }
                    }
                    LazyVGrid(columns: columns, spacing: 16) {
                         ForEach(allTexts.reversed(), id: \.self) { text in
                            VStack {
                                
                                Image("Europe")
                                    .resizable()
                                    .frame(width: 250, height: 250)
                                    .padding(.horizontal)
                                    .padding(.top)
                                    .onTapGesture {
                                        showDetail = true // 이미지를 탭하면 DetailView를 표시하도록 showDetail을 true로 설정
                                    }
                                
                                Text(text)
                                    .padding()
                                    .font(.system(size: 20))
                                    .lineLimit(2) // 최대 두 줄 표시
                                    .truncationMode(.tail) // 텍스트가 잘릴 경우 생략 부호(...)를 표시
                            }
                            .background(Color.white)
                            .cornerRadius(30)
                            .padding()
                        }
                    }
                    .padding(.horizontal, 75) // 그리드의 좌우 여백 지정
                    .sheet(isPresented: $showDetail, content: {
                        DetailView() // showDetail이 true일 때 DetailView를 표시
                    })

                    .onAppear(){
                        UserDefaults.standard.synchronize()
                        
                        if let loadedTexts = UserDefaults.standard.array(forKey: "AllTexts") as? [String] {
                            self.allTexts = loadedTexts
                        }
                    }
                }
            }
        }
    }
}



struct DetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack{
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
                }
                Spacer()
                HStack {
                    Text("이 때의 추억이 떠오르시나요?😎 ")
                        .font(.system(size: 30))
                        .bold()
                }.padding(.bottom, 35)
                
                VStack{
                    HStack{
                        Image("Europe")
                            .resizable()
                            .frame(width: 400, height: 400)
                    }.cornerRadius(30)
                        .background(.white)
                        .padding()
                    
                    VStack{
                        HStack{
                            Text("슬기로운 포항 생활🌊\nApple Developer Academy🍏")
                            // .padding(.bottom, 40)
                            //.font(.system(size: 30))
                                .padding(.trailing, 10)
                            //.bold()
                                .foregroundColor(.black)
                                .frame(height: 200)
                                .frame(width: 400)
                                .background(.white)
                                .cornerRadius(30)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(Color.blue, lineWidth: 1)
                                )
                          
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

struct BeforeRecordView_Previews: PreviewProvider {
    static var previews: some View {
        BeforeRecordView()
    }
}


/*
 Button(action: {
 UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: HomeView())
 
 }, label: {
 Text("나가기")
 .font(.system(size: 20))
 .bold()
 .foregroundColor(.white)
 .frame(height: 50)
 .frame(width:100)
 .background(.blue)
 .cornerRadius(30)
 .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0.0, y: 10)
 .overlay(
 RoundedRectangle(cornerRadius: 30)
 .stroke(Color.gray, lineWidth: 1)
 )
 }).buttonStyle(PressableButtonStyle())
 .padding(.leading, 600)
 .padding()
 }.padding(.bottom, 35)
 */
