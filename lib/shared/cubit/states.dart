abstract class NewsStates{}

class NewsIntialState extends NewsStates{}

class NewsBottomNavigationState extends NewsStates{}

class NewsGetBusinessData extends NewsStates{}

class NewsGetBusinessDataError extends NewsStates{
  final String error;
  NewsGetBusinessDataError(this.error);
}

class NewsGetBusinessLoading extends NewsStates{}

class NewsGetSportsData extends NewsStates{}

class NewsGetSportsDataError extends NewsStates{
  final String error;
  NewsGetSportsDataError(this.error);
}

class NewsGetSportsLoading extends NewsStates{}

class NewsGetScienceData extends NewsStates{}

class NewsGetScienceDataError extends NewsStates{
  final String error;
  NewsGetScienceDataError(this.error);
}

class NewsGetScienceLoading extends NewsStates{}

class NewsGetSearchData extends NewsStates{}

class NewsGetSearchDataError extends NewsStates{
  final String error;
  NewsGetSearchDataError(this.error);
}

class NewsGetSearchLoading extends NewsStates{}

class NewsThemModeChange extends NewsStates{}
