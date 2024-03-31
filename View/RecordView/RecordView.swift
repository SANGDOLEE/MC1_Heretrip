import SwiftUI
import UIKit

struct RecordView: View {
    
    @State private var image: Image? // 사용자가 고른 사진 !!! 
    @State private var isImagePickerPresented = false
    
    // Text Editor - PlaceHolder 변수
    @State private var text: String = ""
    let placeholder = "당신의 하루는 어떠셨나요?\n추억을 기록해보세요 !"
    
    // Image nil 유무에 따른 on/off 
    @State private var isTextEditorShown = false // TextEditor 조건부
    @State private var isTrashShown = false
    @State private var isTextInfo = false
    
    @State private var isShowingEditor = false
    @State private var editText = ""
    
    // 배열을 사용해서 사용자가 입력한 모든 텍스트를 저장
    @State private var allTexts: [String] = [] 
    
    @Environment(\.presentationMode) var presentationMode
    
    
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
            
            VStack{
                HStack{
                    HStack{
                        Text("TODAY")
                            .font(.system(size: 25))
                            .bold()
                            .padding()
                        
                        Text("\(formattedDate())")
                            .font(.system(size: 25))
                            .padding()
                    }
                    // .padding()
                    .padding(.horizontal, 125)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0.0, y: 10)
                    .frame(width: 800, height: 125 )
                }
                
                RectImageView(image: image)
                    .onTapGesture {
                        self.isImagePickerPresented.toggle()
                        isTextEditorShown = true
                    }
                    .sheet(isPresented: $isImagePickerPresented) {
                        ImagePicker(image: self.$image)
                    }
                
                
                HStack{
                    ZStack{
                        if image != nil && isTextEditorShown {
                            TextEditor(text: $editText)
                                .cornerRadius(15)
                                .background(.clear)
                                .frame(width: 550,height: 170)
                                .padding(.bottom, 50)
                        }   
                        
                        if image != nil && editText == "" {
                            Image(systemName: "rectangle.and.pencil.and.ellipsis")
                                .font(.largeTitle)
                                .foregroundColor(.mint)
                                .frame(width:100)
                                .padding(.bottom, 30)
                                .padding(.trailing, 240)
                            
                            Text(placeholder)
                                .lineSpacing(10)
                                .foregroundColor(.mint)
                        }
                        Spacer()
                        
                        // UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true)
                        //UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: HomeView())
                        
                        Button(action: {
                            
                            //UserDefaults.standard.synchronize()
                            // 버튼이 클릭되면 실행될 코드
                            allTexts.append(editText)
                            UserDefaults.standard.set(allTexts, forKey: "AllTexts")
                            
                            
                            // 이동할 뷰로 이동하는 코드를 추가할 수 있습니다.
                            UIApplication.shared.windows.first?.rootViewController = UIHostingController(rootView: HomeView())
                            
                            
                            
                            print("Updated allTexts array:", allTexts)
                        }) {
                            Text("완료")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                                .padding(15)
                                .frame(width: 550)
                                .background(Color.blue)
                                .cornerRadius(30)
                        }
                        .padding(.top, 220)
                    }
                }
            }.padding()
                .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0.0, y: 10)
        }
    }
    /*
    func saveImage(image: UIImage, name: String, onSuccess: @escaping ((Bool) -> Void)) {
        guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else { return }
        
        if let directory: NSURL = try? FileManager.default.url(for: .documentDirectory,
                                                               in: .userDomainMask,
                                                               appropriateFor: nil, create: false) as NSURL {
            do {
                let fileURL = directory.appendingPathComponent(name)!
                try data.write(to: fileURL)
                onSuccess(true)
            } catch let error as NSError {
                print("Could not saveImage🥺: \(error), \(error.userInfo)")
                onSuccess(false)
            }
        }
    }
     */
}

struct RectImageView: View {
    var image: Image?
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.gray)
                .frame(width: 500, height: 500)
                .cornerRadius(30)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.clear, lineWidth: 1)
                )
            if let image = image {
                image
                    .resizable()
                    .scaledToFit() // 이미지를 화면에 맞도록 조정합니다.
                    .clipShape(Rectangle())
                    .frame(width: 500, height: 500) // 이미지 프레임 크기를 조정합니다.
                    .background(Color(red: 240/255, green: 240/255, blue: 240/255))
            } else {
                Image(systemName: "photo.badge.plus")
                    .resizable()
                    .frame(width: 70, height: 50) // 원하는 너비와 높이로 조정
                    .foregroundColor(.white)
            }
        }
    }
}

// 데이트포매터
func formattedDate() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.string(from: Date())
}

struct Record_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
    }
}
