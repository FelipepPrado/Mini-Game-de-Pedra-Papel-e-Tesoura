import SwiftUI

struct ContentView: View {
    @Environment(ViewRouter.self) var viewRouter
    
    var body: some View {
        @Bindable var path = viewRouter
        NavigationStack(path: $path.path){
            ZStack{
                Color.white.ignoresSafeArea()
                NavigationLink(destination: GameView()){
                    Text("Jogar")
                        .foregroundStyle(Color.black)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
