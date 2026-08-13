import SwiftUI
import AVFoundation
internal import Combine

struct GameView: View {
    @Environment(Player.self) var player
    @State private var viewModel = ViewModel()
    @State private var cameraManager = CameraManager()
    
    //Ele ta pegando os clock de tempo para fazer o temporizador
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Group{
            if let frame = viewModel.cameraManager.currentFrame {
                ZStack{
                    Image(frame, scale: 1, orientation: .up, label: Text("Camera Feed"))
                        .resizable()
                        .scaledToFit()
                        .edgesIgnoringSafeArea(.all)
                        //Só pra inverter a imagem da câmera
                        .scaleEffect(x: -1, y: 1)
                    if viewModel.stopGame{
                        WinOrLoseView(winOrLose: viewModel.winOrLose, playerPose: player.lastPose.rawValue, botChoice: viewModel.botChoice.rawValue, playerWins: player.wins, botWins: viewModel.botWins)
                            .transition(.opacity)
                    }
                    else{
                        Text("\(viewModel.timeElapsed)")
                            .font(.system(size: 100))
                    }
                }
            }
            else {
                ProgressView("Ligando câmera...")
            }
        }
        .onReceive(timer) { firedDate in
            if !viewModel.stopGame{
                //Para o jogo na transição de 1 para 0
                if viewModel.timeElapsed == 1 {
                    let poses = [PPT.papel, PPT.tesoura, PPT.pedra]
                    viewModel.botChoice = poses[Int.random(in: 0...2)]
                    viewModel.winOrLose = player.play(handPose: cameraManager.handAnalyzer.detectedPose, botChoice: viewModel.botChoice)
                    if viewModel.winOrLose == "Você perdeu"{
                        viewModel.botWins += 1
                    }
                    viewModel.stopGame = true
                }
            }
            if viewModel.timeElapsed == -1{
                viewModel.stopGame = false
            }
            //Ele ta indo até -1 (mas conta ate -2 na lógica), porque são 2 segundos para ele jogar novamente!
            viewModel.timeElapsed = viewModel.timeElapsed == -1 ? 2 : viewModel.timeElapsed - 1
        }
        .onAppear {
            viewModel.cameraManager.player = player
        }
//        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    GameView()
}
