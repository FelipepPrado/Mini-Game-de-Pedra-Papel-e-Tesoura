import SwiftUI

struct ContentView: View {
    @Environment(ViewRouter.self) var viewRouter
    
    var body: some View {
        @Bindable var path = viewRouter
        NavigationStack(path: $path.path){
            ZStack{
                Color.white.ignoresSafeArea()
                VStack(spacing: 15){
                    VStack{
                        Text("Pedra Papel e Tesoura")
                            .font(.system(size: 30))
                            .foregroundStyle(Color.black)
                        HStack{
                            Text("📄")
                                .font(.system(size: 15))
                            Text("🪨")
                                .font(.system(size: 15))
                            Text("✂️")
                                .font(.system(size: 15))
                        }
                    }
                    Button("Jogar") {
                        viewRouter.playGame()
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonStyle(.glassProminent)
                    .tint(.black)
                }
            }
            .navigationDestination(for: NameViews.self){
                destination in
                ViewManagar.viewForDestination(destination)
            }
        }
    }
}

#Preview {
    ContentView()
}
