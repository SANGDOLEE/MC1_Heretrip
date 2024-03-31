import SwiftUI

class SessionManager: ObservableObject {
    @Published private(set) var coordinatorID = UUID() // 1
    @Published private(set) var normalID = UUID() // 2
    
    func popToCoordinatorRootView() {
        self.coordinatorID = .init()
    }
    
    func popToNormalRootView() {
        self.normalID = .init()
    }
}
