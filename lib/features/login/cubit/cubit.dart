 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_flutter/core/constants/end_points.dart';
import 'package:project_flutter/core/utiles/dio/dio_shop_helper.dart';
import 'package:project_flutter/features/login/cubit/states.dart';
import 'package:project_flutter/features/login/data/model/shop_login_model.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>{
  ShopLoginCubit():super(ShopLoginInitialState());
  static ShopLoginCubit get(context)=>BlocProvider.of(context);
  ShopLoginModel? loginModel ;

  bool isShown = false;
  IconData suffixIcon = Icons.visibility_off;
  void passwordShow(){
       isShown =  !isShown ;
      suffixIcon =isShown? Icons.visibility : Icons.visibility_off;
      emit(ShopLoginPasswordShowState());
  }

  void userLogin({
    required String email,
    required String password,
    String? lang,
})async{
    emit(ShopLoginLoadingState());
    await DioShopHelper.postData(
      url: login,
      data: {
        'email':email,
        'password':password,
      },
      lang: lang,
    ).then((value) {
       loginModel = ShopLoginModel.fromJson(value.data);
      emit(ShopLoginSuccessState(loginModel: loginModel));
    }).catchError((error){
      emit(ShopLoginErrorState(error: error));
    });
  }
}