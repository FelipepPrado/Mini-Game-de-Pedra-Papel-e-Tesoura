import SwiftUI

struct WinOrLoseView: View {
    let winOrLose: String
    let playerPose: String
    let botChoice: String
    let playerWins: Int
    let botWins: Int
    
    var body: some View {
        VStack{
            Text("\(winOrLose)")
                .font(.system(size: 50))
                .shadow(color: winOrLose == "Você ganhou" ? .green : winOrLose == "Você perdeu" ? .red : .blue, radius: 5)
            HStack{
                VStack{
                    Text("Sua escolha")
                        .font(.system(size: 10))
                    Text(playerPose)
                        .font(.system(size: 20))
                    Text("\(playerWins)")
                }
                Text("X")
                    .font(.system(size: 15))
                VStack{
                    Text("Escolha do bot")
                        .font(.system(size: 10))
                    Text(botChoice)
                        .font(.system(size: 20))
                    Text("\(botWins)")
                }
            }
            .padding()
            .background(.ultraThickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

//#Preview {
//    WinOrLoseView()
//}
