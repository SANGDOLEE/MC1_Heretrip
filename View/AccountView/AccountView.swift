import SwiftUI
import UIKit

struct AccountView: View {
    
    @State private var showHomeView = false
    
    @State private var image: Image?
    @State private var isImagePickerPresented = false
    
    @State private var nickname: String = "" 
    
    var body: some View {
        ZStack{
            Color(red: 240/255, green: 240/255, blue: 240/255)
                .ignoresSafeArea()
            
            VStack {
                
                VStack{
                    HStack {
                        Text("안녕하세요 !")
                            .bold()
                            .font(.system(size:30))
                            .padding(.bottom, 5)
                    }
                    Text("사용하실 닉네임을 정해주세요.")
                    
                }
                CircleImageView(image: image)
                    .onTapGesture {
                        self.isImagePickerPresented.toggle()
                    }
                    .sheet(isPresented: $isImagePickerPresented) {
                        ImagePicker(image: self.$image)
                        
                    }.padding()
                
                //Text("닉네임")
                //.padding(.trailing, 150)
                TextField("닉네임을 입력하세요.", text: $nickname)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200)
                    .padding(.bottom)
                
                
                Button(action: {
                    self.showHomeView = true
                }, label: {
                    Text(" 시작하기   ")
                        .padding()
                        .bold()
                })
                .frame(width: 200)
                .foregroundColor(nickname.count >= 1 ? Color.white : Color.mint) 
                .background(nickname.count >= 1 ? Color.blue : Color.gray)
                .cornerRadius(10) 
                .disabled(nickname.isEmpty) // 닉네임이 비어있으면 버튼 비활성화
                .fullScreenCover(isPresented: $showHomeView) {
                    // HomeView(nickname: self.nickname, profileImage: image)
                    HomeView()
                
                }
                
            }
        }
    }
        
}

struct CircleImageView: View {
    var image: Image?
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.gray)
                .frame(maxWidth: 200) // 이미지 크기에 따라 뷰 크기 조절
                .frame(height: 200)
            if let image = image {
                image
                    .resizable()
                    .scaledToFill() // 꽉차게
                    .clipShape(Circle())
                    .frame(maxWidth: 200) // 이미지 크기에 따라 뷰 크기 조절
                    .frame(height: 200)
            } else {
                Image(systemName: "photo")
                    .foregroundColor(.white)
                
            }
        }
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var image: Image?
    @Environment(\.presentationMode) private var presentationMode
    
    // SwiftUI에서 UIKit의 UIImagePickerController를 생성 -> 이 컨트롤러는 사용자가 앨범에서 이미지를 선택할 수 있는 화면을 표시
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = UIImagePickerController()
        controller.delegate = context.coordinator
        return controller
    }
    
    // IImagePickerController의 sourceType 속성을 설정하여 원하는 소스(앨범, 카메라 등)로 접근가능. 하지만 sourceType을 따로 설정하지 않았으므로, 기본값인 앨범이 사용.
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
     // 이 함수는 사용자가 이미지를 선택하고 선택을 완료했을 때 호출됩니다. 여기서 info 매개변수에는 선택한 미디어에 대한 정보가 포함. 이 함수에서는 사용자가 선택한 이미지를 가져와 SwiftUI Image로 변환하고, 그 결과를 ImagePicker의 image 속성에 할당.
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = Image(uiImage: uiImage)
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
