
import 'package:project_flutter/features/login/data/model/shop_login_model.dart';

abstract class ShopLoginStates{}
class ShopLoginInitialState extends ShopLoginStates{}
class ShopLoginPasswordShowState extends ShopLoginStates{}
class ShopLoginLoadingState extends ShopLoginStates{}
class ShopLoginSuccessState extends ShopLoginStates{
    final ShopLoginModel? loginModel;
    ShopLoginSuccessState({ required this.loginModel});
}
class ShopLoginErrorState extends ShopLoginStates{
  final String error;
  ShopLoginErrorState({required this.error});
}