import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

// create object from NewsCubit
  static NewsCubit get(context) => BlocProvider.of(context);
  // int currentIndex = 0;
  // String url = 'v2/top-headlines';
  // String apiKey = 'fe0764dd1dab457d99ba4899405c6bc8';
  // String country = 'us';

  // void getIndex(int index) {
  //   currentIndex = index;
  //   if (index == 1)
  //     getSports();
  //   else if (index == 2) getScience();

  //   emit(NewsBottomNavState());
  // }

  // List<Widget> listScreen = [
  //   const BusinessScreen(),
  //   const SportsScreen(),
  //   const ScienceScreen(),
  //   const SettingsScreen(),
  // ];
  // List<String> appBarListScreen = [
  //   'Business Screen',
  //   'Sports Screen',
  //   'Science Screen',
  //   'Settings Screen',
  // ];

  // List<BottomNavigationBarItem> itemsList = [
  //   customBottomNavigationBarItem(icon: Icons.business, label: 'Business'),
  //   customBottomNavigationBarItem(icon: Icons.sports_soccer, label: 'Sports'),
  //   customBottomNavigationBarItem(icon: Icons.science, label: 'Science'),
  //   customBottomNavigationBarItem(icon: Icons.settings, label: 'Settings'),
  // ];

  // List<dynamic> business = [];
  // List<dynamic> sports = [];
  // List<dynamic> science = [];
  // List<dynamic> search = [];

  // void getBusiness() {
  //   emit(NewsBussinessLoadingState());
  //   DioHelper.getData(url: url, query: {
  //     'country': country,
  //     'category': 'business',
  //     'apiKey': apiKey,
  //   }).then((value) {
  //     business = value.data['articles'];

  //     emit(NewsGetDataBussinessSuccessState());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(NewsBussinessErrorState(error.toString()));
  //   });
  // }

  // void getSports() {
  //   if (sports.isEmpty) {
  //     DioHelper.getData(url: url, query: {
  //       'country': country,
  //       'category': 'sports',
  //       'apiKey': apiKey,
  //     }).then((value) {
  //       sports = value.data['articles'];
  //       emit(NewsGetDataSportsSuccessState());
  //     }).catchError((error) {
  //       print(error.toString());
  //       emit(NewsSportsErrorState(error.toString()));
  //     });
  //   } else {
  //     emit(NewsGetDataSportsSuccessState());
  //   }
  // }

  // void getScience() {
  //   if (science.isEmpty) {
  //     DioHelper.getData(url: url, query: {
  //       'country': country,
  //       'category': 'science',
  //       'apiKey': apiKey,
  //     }).then((value) {
  //       science = value.data['articles'];
  //       emit(NewsGetDataScienceSuccessState());
  //     }).catchError((error) {
  //       print(error.toString());
  //       emit(NewsScienceErrorState(error.toString()));
  //     });
  //   } else {
  //     emit(NewsGetDataScienceSuccessState());
  //   }
  // }

  // void getSearch(String value) {
  //   if (value.isEmpty) {
  //     const CircularProgressIndicator();
  //   } else {
  //     DioHelper.getData(url: 'v2/everything', query: {
  //       'q': value,
  //       'apiKey': apiKey,
  //     }).then((value) {
  //       search = value.data['articles'];
  //       emit(NewsGetDataSearchSuccessState());
  //     }).catchError((error) {
  //       print(error.toString());
  //       emit(NewsSearchErrorState(error.toString()));
  //     });
  //   }
  // }

  bool isDark = false;
  //

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsChngeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(NewsChngeModeState());
      });
    }
  }
}
