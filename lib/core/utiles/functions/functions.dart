import 'package:flutter/material.dart';
import 'package:project_flutter/core/utiles/cach_helper/cache_helper.dart';
import 'package:project_flutter/features/login/shop_login_screen.dart';

// Widget defaultFormField({
//   final IconData? prefix,
//   final IconData? suffix,
//   final Function()? suffixPressed,
//   bool isPassword =false,
//   final FormFieldSetter? onChanged,
//   final Function()? onTap,
//   final FormFieldSetter? onFieldSubmitted,
//   final TextInputType? keyboardType,
//   final FormFieldValidator? validator,
//   required String? label ,
//   bool isUpperCase =false,
//   bool enabled =true,
//   required TextEditingController controller,
// })=>TextFormField(
//
//   decoration: InputDecoration(
//
//     labelText: isUpperCase?label!.toUpperCase():label  ,
//
//     border:const OutlineInputBorder(),
//
//     prefix: SizedBox(
//       height: 15.0,
//       child: Icon(
//           prefix
//       ),
//     ),
//
//     suffix:  SizedBox(
//       height: 15.0,
//       child: IconButton(
//         onPressed: suffixPressed,
//         icon:Icon(suffix),
//
//       ),
//     ),
//
//   ),
//   enabled: enabled,
//   keyboardType: keyboardType,
//
//   obscureText: isPassword,
//
//   onTap: onTap,
//
//   onFieldSubmitted: onFieldSubmitted,
//
//   onChanged: onChanged,
//
//   controller:controller ,
//
//   validator:validator,
//
// );

//------------------------------------------------------------default_button----

// Widget defaultButton({
//   final Function()? onPressed,
//   required String text,
//   double radius = 0.0,
//   bool isUpperCase =true,
//   double width = double.infinity,
//   Color background = Colors.blue,
//   double height = 40.0,
// })=>Container(
//   width: width,
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(radius),
//     color: background,
//   ),
//   child: MaterialButton(
//     height: height,
//     onPressed: onPressed,
//     child: Text(
//       isUpperCase ? text.toUpperCase() : text ,
//       style: const TextStyle(
//         color: Colors.white,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//   ),
// );

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
