import SwiftUI

@main
struct MiniGame_PPTApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()

        }
        .environment(Player())
        .environment(ViewRouter())
    }
}
