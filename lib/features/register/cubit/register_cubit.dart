 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_flutter/core/constants/end_points.dart';
import 'package:project_flutter/core/utiles/dio/dio_shop_helper.dart';
import 'package:project_flutter/features/register/cubit/register_state.dart';
import 'package:project_flutter/features/register/data/model/shop_register_model.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterState>{
  ShopRegisterCubit():super(ShopRegisterInitialState());
  static ShopRegisterCubit get(context)=>BlocProvider.of(context);
  ShopRegisterModel? registerModel ;

  bool isShown = false;
  IconData suffixIcon = Icons.visibility_off;
  void passwordShow(){
    isShown =  !isShown ;
    suffixIcon =isShown? Icons.visibility : Icons.visibility_off;
    emit(ShopRegisterPasswordShowState());
  }

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
    String? lang,
  })async{
    emit(ShopRegisterLoadingState());
    await DioShopHelper.postData(
      url: register,
      data: {
        'name': name,
        'email':email,
        'password':password,
        'phone':phone,
      },
      lang: lang,
    ).then((value) {
      registerModel = ShopRegisterModel.fromJson(value.data);
      emit(ShopRegisterSuccessState(loginModel: registerModel));
    }).catchError((error){
      emit(ShopRegisterErrorState(error: error));
    });
  }
}