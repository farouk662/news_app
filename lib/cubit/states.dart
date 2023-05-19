abstract class NewsStates{}

class InitialState extends NewsStates {}

class NewsGetLoadingState extends NewsStates{}

class NewsGetSuccessState extends NewsStates{}

class NewsGetErrorState extends NewsStates{
   String? error;
  NewsGetErrorState(this.error);
}

class ChangeDarkModeState extends NewsStates{}
class ChangeCategoryState extends NewsStates{}
class SearchLoadingState extends NewsStates{}

class SearchSuccessState extends NewsStates{}

class SearchErrorState extends NewsStates {
  String? error;

  SearchErrorState(this.error);
}