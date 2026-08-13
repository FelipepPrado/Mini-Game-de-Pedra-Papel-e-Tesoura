import SwiftUI
import Observation

//Nome das telas
enum NameViews: Hashable{
    case Init
    case GameView
}

@Observable
class ViewRouter{
    var path = NavigationPath()
    
    func clear(){
        path = .init()
    }
    
    func removeLast(){
        path.removeLast()
    }
    
    func initView(){
        self.clear()
    }
    
    func playGame(){
        path.append(NameViews.GameView)
    }
}


enum ViewManagar {
    @ViewBuilder
    static func viewForDestination(_ destination: NameViews) -> some View {
        switch destination {
        case .Init:
            ContentView()
        case .GameView:
            GameView()
        }
    }
}
