part of 'news_cubit.dart';

abstract class ShopState {}

final class NewsInitialState extends ShopState {}

final class NewsBottomNavState extends ShopState {}

final class NewsGetDataBussinessSuccessState extends ShopState {}

final class NewsBussinessLoadingState extends ShopState {}

final class NewsBussinessErrorState extends ShopState {
  final String error;

  NewsBussinessErrorState(this.error);
}

final class NewsGetDataSportsSuccessState extends ShopState {}

final class NewsSportsLoadingState extends ShopState {}

final class NewsSportsErrorState extends ShopState {
  final String error;

  NewsSportsErrorState(this.error);
}

final class NewsGetDataScienceSuccessState extends ShopState {}

final class NewsScienceLoadingState extends ShopState {}

final class NewsScienceErrorState extends ShopState {
  final String error;

  NewsScienceErrorState(this.error);
}

final class NewsGetDataSearchSuccessState extends ShopState {}

final class NewsSearchLoadingState extends ShopState {}

final class NewsSearchErrorState extends ShopState {
  final String error;

  NewsSearchErrorState(this.error);
}

class NewsChngeModeState extends ShopState {}
