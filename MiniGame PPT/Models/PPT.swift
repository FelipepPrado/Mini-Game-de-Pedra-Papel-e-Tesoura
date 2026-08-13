enum PPT: String, CaseIterable {
    case papel
    case pedra
    case tesoura
    case noValue
    
    var rawValue: String {
        switch self {
        case .papel: return "📄"
        case .pedra: return "🪨"
        case .tesoura: return "✂️"
        case .noValue: return "cadê suas mãos? 🤔"
        }
    }
}
