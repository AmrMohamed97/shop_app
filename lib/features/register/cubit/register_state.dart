
import 'package:project_flutter/features/register/data/model/shop_register_model.dart';

abstract class ShopRegisterState {}
class ShopRegisterInitialState extends ShopRegisterState{}
class ShopRegisterPasswordShowState extends ShopRegisterState{}
class ShopRegisterLoadingState extends ShopRegisterState{}
class ShopRegisterSuccessState extends ShopRegisterState{
  final ShopRegisterModel? loginModel;
  ShopRegisterSuccessState({ required this.loginModel});
}
class ShopRegisterErrorState extends ShopRegisterState{
  final String error;
  ShopRegisterErrorState({required this.error});
}