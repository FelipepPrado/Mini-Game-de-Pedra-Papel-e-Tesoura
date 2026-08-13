import SwiftData

@Observable
class Player: Identifiable{
    private var name: String = "Sem nome"
    var lastPose: PPT = .noValue
    var wins: Int = 0
    
    //Não é para ser items
    private var items: [Item: Int] = [:]
    
    func play(handPose: PPT, botChoice: PPT) -> String{
        lastPose = handPose
        print("handPose = \(handPose.rawValue) e botChoice = \(botChoice.rawValue)")
        
        switch handPose{
        case .pedra:
            if botChoice == PPT.tesoura{
                updateWins()
                print("Ganhou")
                return "Você ganhou"
            }
            else if botChoice == PPT.pedra{
                print("Empate")
                return "Empate"
            }
        case .papel:
            if botChoice == PPT.pedra{
                updateWins()
                print("Ganhou")
                return "Você ganhou"
            }
            else if botChoice == PPT.papel{
                print("Empate")
                return "Empate"
            }
        case .tesoura:
            if botChoice == PPT.papel{
                updateWins()
                print("Ganhou")
                return "Você ganhou"
            }
            else if botChoice == PPT.tesoura{
                print("Empate")
                return "Empate"
            }
        default:
            print("Perdeu")
        }
        
        return "Você perdeu"
    }
    
    func updateWins(wins: Int = 1){
        self.wins += wins
    }
}

class Item: Identifiable, Equatable, Hashable{
    private var name: String
    private var price: Int
    private var isConsumable: Bool = false
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.name == rhs.name ? true : false
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
