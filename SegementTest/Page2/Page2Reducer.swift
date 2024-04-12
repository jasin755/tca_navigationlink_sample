import ComposableArchitecture
import Foundation

struct Page2Reducer: Reducer {

	struct State: Equatable {
		@PresentationState
		var page3: Page3Reducer.State?
	}

	@CasePathable
	enum Action {
		case somePage2Action
		case navigateToPage3Tap
		case page3(PresentationAction<Page3Reducer.Action>)
	}

	var body: some ReducerOf<Self> {
		Reduce { state, action in
			switch action {
			case .navigateToPage3Tap:
				state.page3 = .init()
				return .none
			case .page3(.presented(.somePage3Action)):
				print("somePage3Action in Page2Reducer")
				return .none
			case .page3(.dismiss):
				print("Page3 dismissed")
				return .none
			case .somePage2Action:
				print("somePage2Action in Page2Reducer")
				return .none
			}
		}
		.ifLet(\.$page3, action: \.page3) {
			Page3Reducer()
		}
	}

}
