import ComposableArchitecture
import Foundation
import SwiftUI

struct Page3View: View {

	private let store: StoreOf<Page3Reducer>

	init(store: StoreOf<Page3Reducer>) {
		self.store = store
	}

	var body: some View {
		Button("SomePage3Action") {
			store.send(.somePage3Action)
		}
	}
}
