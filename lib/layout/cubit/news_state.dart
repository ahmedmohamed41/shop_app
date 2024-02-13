part of 'news_cubit.dart';

abstract class NewsState {}

final class NewsInitialState extends NewsState {}

final class NewsBottomNavState extends NewsState {}

final class NewsGetDataBussinessSuccessState extends NewsState {}

final class NewsBussinessLoadingState extends NewsState {}

final class NewsBussinessErrorState extends NewsState {
  final String error;

  NewsBussinessErrorState(this.error);
}

final class NewsGetDataSportsSuccessState extends NewsState {}

final class NewsSportsLoadingState extends NewsState {}

final class NewsSportsErrorState extends NewsState {
  final String error;

  NewsSportsErrorState(this.error);
}

final class NewsGetDataScienceSuccessState extends NewsState {}

final class NewsScienceLoadingState extends NewsState {}

final class NewsScienceErrorState extends NewsState {
  final String error;

  NewsScienceErrorState(this.error);
}

final class NewsGetDataSearchSuccessState extends NewsState {}

final class NewsSearchLoadingState extends NewsState {}

final class NewsSearchErrorState extends NewsState {
  final String error;

  NewsSearchErrorState(this.error);
}

class NewsChngeModeState extends NewsState {}
