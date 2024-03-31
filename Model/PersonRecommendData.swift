import SwiftUI

struct PersonRecommendData {
    
    var peopleData: [String] = [
        "사진을 찍고 있는 사람",
        "식사를 할 때 오른쪽 사람",
        "카메라를 들고 있는 사람",
        "금발 머리를 한 사람",
        "운동을 하고 있는 사람",
        "헤드셋을 쓴 사람",
        "화려한 옷을 입은 사람",
        "아이와 같이 있는 사람",
        "내가 간 카페의 종업원",
        "검정색 상의를 입은 사람",
        "혼자 여행온 것 같은 사람",
        "친구랑 여행온 사람",
        "콜라를 마시고 있는 사람",
        "커피를 들고 있는 사람",
        "수염이 긴 사람"
    ]
    
    init(){
        
    }
    // 데이터 반환 메서드
    func randomPerson() -> String {
        return peopleData.randomElement()!
    }
}
