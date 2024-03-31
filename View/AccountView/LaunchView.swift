import SwiftUI


struct LaunchView: View {
    @State private var showAccountView = false
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            VStack {
                Image("appmainlogo")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Text("여기트립")
                    .bold()
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .padding()
                
                 Text("    지금 바로 챌린지를\n통해 인연을 만들어보세요")
                           .foregroundColor(.white)
            }.padding(.bottom, 50)
        }
        .onAppear {
            // 1초 후에 AccountView로 전환
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                 self.showAccountView = true
            }
        }
        .fullScreenCover(isPresented: $showAccountView) {
            HomeView()
        }
    }
}


struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
