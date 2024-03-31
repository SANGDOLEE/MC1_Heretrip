import SwiftUI

struct GeometryButtonView: View {
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                VStack {
                    Spacer()
                    NavigationLink(destination: PersonRecommendView()) {
                        Text("챌린지 시작")
                            .padding()
                            .frame(width: geometry.size.width * 0.5)
                            .background(Color.blue)
                            .font(.system(size: 25))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.bottom, 20)
                        
                        
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.clear)
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}
/*
 
 struct GeometryButtonView_Previews: PreviewProvider {
 static var previews: some View {
 GeometryButtonView()
 }
 }
 */
