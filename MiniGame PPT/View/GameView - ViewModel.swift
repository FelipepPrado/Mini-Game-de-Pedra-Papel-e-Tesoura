import Observation
import SwiftUI
import AVFoundation
internal import Combine

extension GameView {
    @Observable
    class ViewModel {
        var cameraManager = CameraManager()
        var botChoice: PPT = .noValue
        var winOrLose: String = ""
        var stopGame: Bool = false
        var botWins: Int = 0
        var startDate = Date.now
        var timeElapsed: Int = 3
    }
}
