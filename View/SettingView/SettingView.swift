import SwiftUI
import UIKit

// 푸쉬알림 View 따로 구현 할 것인지
// ProgressBar Detail 설정
// 프로필 수정 View 넣을 것 인지 ?

struct SettingView: View {
    
    // @State private var image: Image?
    // @State private var isImagePickerPresented = false
    
    @Binding var nickname: String
    @Binding var profileImage: Image?
    
    @State private var progressValue: Float = 30
    
    var body: some View {
        ScrollView{
            VStack {
                
                /// 첫 번째 HStack
                HStack{
                    CircleImageViews(image: profileImage)
                        .padding(.leading, 10)
                    
                    /*
                        .onTapGesture {
                            self.isImagePickerPresented.toggle()
                        }
                        .sheet(isPresented: $isImagePickerPresented) {
                            ImagePicker(image: self.$image)
                        }.padding()
                    */
                    
                    Text("hahae")
                        .font(.largeTitle)
                        .bold()
                        .padding(.leading, 10)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Text("프로필 수정")
                            .font(.system(size: 15))
                            .foregroundColor(.black)
                            .padding(20)
                    }).background(Color(red: 240/255, green: 240/255, blue: 240/255))
                        .cornerRadius(10)
                }.padding()
                
                /// 2번쨰 VStack
                VStack{
                    HStack{
                        Image("appLogo")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding()
                        Spacer()
                        Text("여행에서 인연을 기록해요. 여기트립 !")
                            .padding()
                    }
                    HStack{
                         ProgressBar()
                            .padding([.leading, .trailing], 10)
                            .padding(.bottom, 40)
                    }
                }.overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color(red: 240/255, green: 240/255, blue: 240/255), lineWidth: 1)
                ).padding(.horizontal, 20)
                
                Spacer()
                
                VStack{
                    
                    HStack{
                        Text("설정")
                            .font(.largeTitle)
                            .bold()
                            .padding(.leading, 10)
                        
                        Spacer()
                    }.padding()
                    
                    VStack(spacing: 10) {
                        SystemButtonView(buttonType: .arrow, text: "계정", email: "id@naver.com")
                        SystemButtonView(buttonType: .toggle, text: "알림설정")
                    }.padding(.horizontal, 20)
                    
                }
                
                VStack{
                    HStack{
                        Text("기타")
                            .font(.largeTitle)
                            .bold()
                            .padding(.leading, 10)
                        
                        Spacer()
                    }.padding()
                    
                    VStack(spacing: 10) {
                        SystemButtonView(buttonType: .arrow, text: "이용약관")
                        SystemButtonView(buttonType: .arrow, text: "개인정보처리방침")
                        SystemButtonView(buttonType: .version, text: "현재 버전")
                        SystemButtonView(buttonType: .arrow, text: "피드백 보내기")
                    }.padding(.horizontal, 20)
                    Spacer()
                }
            }.navigationTitle("설정")
        }
    }
}

struct CircleImageViews: View {
    var image: Image?
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.gray)
                .frame(width: 80, height: 80)
            if let image = image {
                image
                    .resizable()
                    .scaledToFill() // 꽉차게
                    .clipShape(Circle())
                    .frame(width: 80, height: 80)
            } else {
                Image(systemName: "photo")
                    .foregroundColor(.white)
                
            }
        }
    }
}


/*
 struct SettingView_Previews: PreviewProvider {
 static var previews: some View {
 SettingView()
 }
 }
 
*/
