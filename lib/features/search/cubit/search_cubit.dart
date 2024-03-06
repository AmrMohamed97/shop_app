import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_flutter/core/constants/constants.dart';
import 'package:project_flutter/core/constants/end_points.dart';
import 'package:project_flutter/core/utiles/dio/dio_shop_helper.dart';
import 'package:project_flutter/features/search/cubit/search_state.dart';
import 'package:project_flutter/features/search/data/model/search_model.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit():super(SearchInitialState());
  static SearchCubit get(context)=>BlocProvider.of(context);

  GetSearchModel? searchModel;
  Map favorite ={};
  void getSearchData({required String text})async{
    emit(SearchLoadingState());
    await DioShopHelper.postData(
      url: productsSearch,
      data:{
        'text':text,
      },
      lang: 'en',
      token: token,
    ).then((value) {
      searchModel =GetSearchModel.fromJson(value.data);
      print('${searchModel!.searchResult!.products.length}.............................................................');
      searchModel!.searchResult!.products.forEach((element)=>favorite.addAll({
        element.id:element.inFavorite
      }));
        emit(SearchSuccessState());
    }).catchError((error){
      emit(SearchErrorState());
    });
  }

  bool changeFavorite(id){
    favorite[id]=!favorite[id];
    emit(SearchGetFavoriteState());
    return favorite[id];
  }

 }