import 'package:flutter/material.dart';
import 'package:project_flutter/core/utiles/cach_helper/cache_helper.dart';
import 'package:project_flutter/features/login/shop_login_screen.dart';

//-------------------------------------------------------------Separator_builder
Widget mySeparator()=>Padding(
  padding: const EdgeInsetsDirectional.only(start: 20),
  child:   Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey,
  ),
);
//-------------------------------------------------------------------Navigate_to
void navigateTo(context , widget)=>Navigator.push(
    context,
    MaterialPageRoute(
        builder:(context)=> widget,
    ),
);
//-----------------------------------------------------------navigate_and_finish
void navigateAndFinish({required BuildContext context,required Widget route})=>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context)=> route,
      ),
      (route) => false,
);

//---------------------------------------------------------enum_with_switchCases
enum SnackBarState{ success,error,warning;}
Color snackColor(SnackBarState state){
  Color color;
  switch(state){
    case  SnackBarState.success:
      color= Colors.green;
      break;
    case SnackBarState.error:
      color= Colors.red;
      break;
    case SnackBarState.warning:
      color= Colors.amber;
      break;
  }
  return color;
}
//-----------------------------------------------------SnackBar_with_many_colors
void showSnackBar({
  required context ,
  required String text ,
  required SnackBarState stateColor,
})=> ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ) ,
        duration: const Duration(
          seconds: 3,
        ),
        backgroundColor: snackColor(stateColor),
      ),
    );
//----------------------------------------------------------------------Sign_out
void signOut(context){
  CacheHelper.removeData(
    key: 'token',
  ).then((value) {
    if(value){
      navigateAndFinish(context: context, route:ShopLoginScreen() ,
      );
    }
  });
}
