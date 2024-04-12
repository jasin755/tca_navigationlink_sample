import ComposableArchitecture
import Foundation
import SwiftUI

struct Page2View: View {

	private let store: StoreOf<Page2Reducer>

	init(store: StoreOf<Page2Reducer>) {
		self.store = store
	}

	var body: some View {
		VStack {
			Button("Some page2 action") {
				store.send(.somePage2Action)
			}

			NavigationLinkStore(store.scope(state: \.$page3, action: \.page3)) {
				store.send(.navigateToPage3Tap)
			} destination: { store in
				Page3View(store: store)
			} label: {
				Text("Go to page3")
			}
		}
	}
}
