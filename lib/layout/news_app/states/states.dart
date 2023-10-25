abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomSheetState extends NewsStates {}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErrorsState extends NewsStates {
  final String error;
  NewsGetBusinessErrorsState(this.error);
}

class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsErrorsState extends NewsStates {
  final String error;
  NewsGetSportsErrorsState(this.error);
}

class NewsGetScienceLoadingState extends NewsStates {}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceErrorsState extends NewsStates {
  final String error;
  NewsGetScienceErrorsState(this.error);
}