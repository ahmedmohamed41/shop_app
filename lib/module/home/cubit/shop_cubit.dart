import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/model/categories_model.dart';
import 'package:shop_app/model/change_favorite_model.dart';
import 'package:shop_app/model/favorite_model.dart';
import 'package:shop_app/model/home_model.dart';
import 'package:shop_app/model/shop_login_model.dart';
import 'package:shop_app/module/home/categoeies_screen.dart';
import 'package:shop_app/module/home/favorites_screen.dart';
import 'package:shop_app/module/home/home_screen.dart';
import 'package:shop_app/module/home/settings_screen.dart';
import 'package:shop_app/shared/components/constaints.dart';
import 'package:shop_app/shared/network/endpoints/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialStates());

  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> listScreen = const [
    HomeScreen(),
    CategoeiesScreen(),
    FavoritesScreen(),
    SettingsScreeen(),
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(ShopChangeIndexStates());
  }

  HomeModel? homeModel;

  Map<int, bool> favorites = {};
  void getHomeData() {
    emit(ShopLoadingStates());
    DioHelper.getData(
      url: home,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      for (var element in homeModel!.data!.products) {
        favorites.addAll({
          element.id!: element.inFavorites!,
        });
      }
      emit(ShopSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorStates());
    });
  }

  ShopCategoriesModel? categoriesModel;

  void getCategoriesHomeData() {
    emit(ShopLoadingCategoriesStates());
    DioHelper.getData(
      url: categories,
    ).then((value) {
      categoriesModel = ShopCategoriesModel.fromJson(value.data);
      print(categoriesModel!.status);
      emit(ShopSuccessCategoriesStates());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCategoriesStates());
    });
  }

  ChangeFavoriteModel? changeFavoriteModel;

  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId]!;
    emit(ShopSuccessFavoritesStates());

    DioHelper.postData(
      url: getFavorites,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      changeFavoriteModel = ChangeFavoriteModel.fromJson(value.data);
      if (!changeFavoriteModel!.status!) {
        favorites[productId] = !favorites[productId]!;
      } else {
        getFavorite();
      }
      emit(ShopSuccessFavoritesStates());
    }).catchError((error) {
      emit(ShopErrorFavoritesStates());
    });
  }

  FavoritesModel? favoriteModel;

  void getFavorite() {
    emit(ShopLoadingGetFavoritesStates());
    DioHelper.getData(
      url: getFavorites,
      token: token,
    ).then((value) {
      favoriteModel = FavoritesModel.fromJson(value.data);

      emit(ShopSuccessGetFavoritesStates());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetFavoritesStates());
    });
  }

  ShopLoginModel? userDataModel;

  void getUserData() {
    emit(ShopLoadingGetSettingsStates());
    DioHelper.getData(
      url: getProfile,
      token: token,
    ).then((value) {
      userDataModel = ShopLoginModel.fromJson(value.data);
      print(userDataModel!.data!.name);
      print(userDataModel!.data!.phone);
      emit(ShopSuccessGetSettingsStates());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetSettingsStates());
    });
  }
}
