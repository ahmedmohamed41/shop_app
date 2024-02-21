import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/model/search_model.dart';
import 'package:shop_app/shared/components/constaints.dart';
import 'package:shop_app/shared/network/endpoints/end_points.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialStates());

  static SearchCubit get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();
  var searchController = TextEditingController();

  SearchModel? searchModel;

  void getSearch({
    required String text,
  }) {
      emit(SearchLoadingStates());
    if(text.isEmpty){
      const CircularProgressIndicator();
    }else{
      DioHelper.postData(
      url: search,
      data: {'text': text},
      token: token,
      lang: 'en'
    ).then((value) {
      searchModel = SearchModel.fromJson(value.data);

      emit(SearchSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(SearchErrorStates());
    });
    }
  
    
  }
}
