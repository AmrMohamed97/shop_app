import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_flutter/core/utiles/cach_helper/cache_helper.dart';
import 'package:project_flutter/core/utiles/dio/dio_shop_helper.dart';
import 'package:project_flutter/core/utiles/observer/my_observer.dart';
import 'package:project_flutter/features/layout/presentation/manager/cubit.dart';
import 'package:project_flutter/features/layout/presentation/pages/shop_layout.dart';
import 'package:project_flutter/features/login/shop_login_screen.dart';
import 'package:project_flutter/features/on_boarding/presentation/pages/on_boarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyObserver();
   DioShopHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Widget widget;
    if(CacheHelper.getData(key: 'token') != null){
      widget = const ShopLayout();
    }
    else if(CacheHelper.getData(key: 'onBoarding') != null){
      widget = ShopLoginScreen();
    }
    else{
      widget = const OnBoarding();
    }
    return MultiBlocProvider(
      providers:[
         BlocProvider(
          create:(context)=>ShopCubit()..getHomeData()..getCategoryData()..getFavoriteData()..getProfileData() ,
        ),
      ] ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:   widget,
      ),
    );

  }
}
