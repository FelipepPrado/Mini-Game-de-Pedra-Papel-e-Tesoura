import SwiftUI

@main
struct MiniGame_PPTApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()

        }
        .environment(Player())
        .environment(ViewRouter())
    }
}
