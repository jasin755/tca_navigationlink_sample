import ComposableArchitecture
import SwiftUI

struct ContentView: View {

	private let store: StoreOf<ContentReducer>

	init(store: StoreOf<ContentReducer>) {
		self.store = store
	}

	var body: some View {
		NavigationView(content: {
			NavigationLinkStore(store.scope(state: \.$page2, action: \.page2)) {
				store.send(.navigationPage2Tap)
			} destination: { store in
				Page2View(store: store)
			} label: {
				Text("Go to page2")
			}
		})
	}
}

#Preview {
	ContentView(store: .init(initialState: .init(), reducer: { ContentReducer() }))
}
