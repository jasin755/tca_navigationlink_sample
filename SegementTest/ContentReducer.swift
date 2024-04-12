import ComposableArchitecture
import Foundation

struct ContentReducer: Reducer {

	struct State: Equatable {
		@PresentationState
		var page2: Page2Reducer.State?
	}

	@CasePathable
	enum Action: BindableAction {
		case navigationPage2Tap
		case page2(PresentationAction<Page2Reducer.Action>)
		case binding(BindingAction<State>)
	}

	var body: some ReducerOf<Self> {
		BindingReducer()
		Reduce { state, action in
			switch action {
			case .navigationPage2Tap:
				state.page2 = .init()
				return .none
			case .page2(.presented(.somePage2Action)):
				print("somePage2Action in ContentReducer")
				return .none
			case .page2(.presented(.page3(.presented(.somePage3Action)))):
				print("somePage3Action in ContentReducer")
				return .none
			case .page2(.dismiss):
				print("Page2 dismissed")
				return .none
			case .page2:
				return .none
			case .binding:
				return .none
			}
		}
		.ifLet(\.$page2, action: \.page2) {
			Page2Reducer()
		}
	}

}
