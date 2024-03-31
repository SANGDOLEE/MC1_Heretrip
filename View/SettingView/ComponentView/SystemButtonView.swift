import SwiftUI

struct SystemButtonView: View {
    
    @State private var alarmToggle = true
    
    var buttonType: ButtonType
    var text: String
    var email: String?
    var version: String?
    
    enum ButtonType {
        case arrow
        case toggle
        case version
    }
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 48)
                .foregroundColor(Color(red: 240/255, green: 240/255, blue: 240/255))
                .cornerRadius(10)
            HStack {
                Text(text)
                    .padding(.leading, 20)
                Spacer()
                switch buttonType {
                case .arrow:
                    Text(email ?? "")
                        .padding(.trailing, 14.9)
                        .foregroundColor(Color.black)
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 10.1, height: 17.6)
                        .padding(.trailing, 26.9)
                case .toggle:
                    Toggle("", isOn: $alarmToggle)
                        .padding(.trailing, 20)
                case .version:
                    Text(version ?? "0.0.1")
                        .padding(.trailing, 20)
                        .foregroundColor(Color.black)
                }
            }
        }
    }
}
