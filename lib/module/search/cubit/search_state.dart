part of 'search_cubit.dart';

abstract class SearchState {}

final class SearchInitialStates extends SearchState {}

final class SearchLoadingStates extends SearchState {}

final class SearchSuccessStates extends SearchState {}

final class SearchErrorStates extends SearchState {}
