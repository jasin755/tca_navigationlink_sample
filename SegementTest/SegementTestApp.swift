import SwiftUI

@main
struct SegementTestApp: App {
	var body: some Scene {
		WindowGroup {
			ContentView(store: .init(initialState: .init(), reducer: { ContentReducer() }))
		}
	}
}
