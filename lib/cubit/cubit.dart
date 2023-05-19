
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_news_app/cubit/states.dart';
import 'package:youtube_news_app/models/models.dart';

import '../network/local/cache_helper.dart';
import '../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<String> categories=['general','sports','health','entertainment','business','technology','science'];

List<ArticleModel> articleModels=[];
List<List<ArticleModel>> categoriesList=[[],[],[],[],[],[],[]];

  void getNews() {
    articleModels=[];
    emit(NewsGetLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': categories[currentIndex],
      'apiKey': '9e82f3fbe7ff4e488d2911f662907dd2'
    })
        .then((value)  {
         List data = value.data['articles'];
         for (var article in data) {
      articleModels.add(ArticleModel.fromJson(article));
    }
         categoriesList[currentIndex]=articleModels;

      emit(NewsGetSuccessState());
    })
        .catchError((onError) {
      emit(NewsGetErrorState(onError.toString()));
    });
  }
  List<ArticleModel> searchList=[];

  void search(String value) {
    searchList=[];
    emit(SearchLoadingState());
    if(value!=''){

    DioHelper.getData(url: 'v2/everything', query: {
      'lanague': 'eg',
      //'category': '${categories[currentIndex]}',
      'q':value,
      'apiKey': '9e82f3fbe7ff4e488d2911f662907dd2'
    })
        .then((value)  {
      List data = value.data['articles'];
      for (var article in data) {
        searchList.add(ArticleModel.fromJson(article));
      }
      //categoriesList[currentIndex]=articleModels;

      emit(SearchSuccessState());
    })
        .catchError((onError) {
      emit(SearchErrorState(onError.toString()));
    });
  }
  }



void changeCategory(int index
    ){
    currentIndex=index;
     if(categoriesList[currentIndex].isEmpty){
     getNews();
    // emit(ChangeCategoryState());
     }
    emit(ChangeCategoryState());
}

  bool isDark = false;
  void changeToDarkMode({bool? cacheIsDark}) {
    if (cacheIsDark != null) {
      isDark = cacheIsDark;
    } else {
      isDark = !isDark;
      CacheHelper.putData(key1: 'isDark', value2: isDark).then((value) {
        emit(ChangeDarkModeState());
      });
    }
  }
}