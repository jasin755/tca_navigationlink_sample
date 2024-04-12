import ComposableArchitecture
import Foundation

struct Page3Reducer: Reducer {
	struct State: Equatable {}

	enum Action {
		case somePage3Action
	}

	var body: some ReducerOf<Self> {
		Reduce { _, action in
			switch action {
			case .somePage3Action:
				print("somePage3Action in Page3Reducer")
				return .none
			}
		}
	}
}
