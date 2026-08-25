import SwiftUI

struct HomeView: View {
    @Environment(ViewRouter.self) var viewRouter
    
    var body: some View {
        @Bindable var path = viewRouter
        NavigationStack(path: $path.path){
            ZStack{
                Color.white.ignoresSafeArea()
                VStack(spacing: 20){
                    VStack(spacing: 10){
                        Text("Pedra Papel e Tesoura")
                            .bold()
                            .font(.system(size: 30))
                            .foregroundStyle(Color.black)
                        HStack{
                            Text("📄")
                                .font(.system(size: 28))
                            Text("🪨")
                                .font(.system(size: 28))
                            Text("✂️")
                                .font(.system(size: 28))
                        }
                    }
                    Button {
                        viewRouter.playGame()
                    } label: {
                        Text("Jogar")
                        .frame(width: 50, height: 25)
                        .font(Font.system(size: 16))
                    }
                    .buttonStyle(.borderedProminent)
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
    HomeView()
}
