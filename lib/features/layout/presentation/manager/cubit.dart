import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_flutter/core/constants/constants.dart';
import 'package:project_flutter/core/constants/end_points.dart';
import 'package:project_flutter/core/models/change_favorite_model.dart';
import 'package:project_flutter/core/utiles/dio/dio_shop_helper.dart';
import 'package:project_flutter/features/categories/data/model/categories_model.dart';
import 'package:project_flutter/features/categories/presentation/pages/categories_screen.dart';
import 'package:project_flutter/features/favorites/data/model/favorite_model.dart';
import 'package:project_flutter/features/favorites/presentation/pages/favorites_screen.dart';
import 'package:project_flutter/features/home/data/model/home_model.dart';
import 'package:project_flutter/features/home/presentation/pages/home_screen.dart';
import 'package:project_flutter/features/layout/presentation/manager/states.dart';
import 'package:project_flutter/features/login/data/model/shop_login_model.dart';
import 'package:project_flutter/features/settings/settings_screen.dart';

class ShopCubit extends Cubit<ShopStates>{
  ShopCubit():super(ShopInitialStates());
  static ShopCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;
  List<Widget> bottomScreens=[
    const HomeScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    SettingsScreen(),
  ];
  void changeBottomNav(int index){
    currentIndex =index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel? homeModel;
  Map favorite={};
  void getHomeData()async{
    emit(ShopLoadingHomeDataState());
    await DioShopHelper.getData(
      url: home,
      token: token,
      lang: 'en',
    ).then((value) {
      homeModel=HomeModel.fromJson(value.data);
      homeModel!.data!.products.forEach((element) {
        favorite.addAll({
          element.id:element.inFavorites
        });
      });
       emit(ShopSuccessHomeDataState());
    }).catchError((error){
      emit(ShopErrorHomeDataState(error:error.toString()));
    });
  }

  CategoriesModel? categoriesModel;
  void  getCategoryData()async{
    emit(ShopLoadingCategoriesState());
    await DioShopHelper.getData(
      url: 'categories',
      lang: 'en'
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
       emit(ShopSuccessCategoriesState());
    }).catchError((error){
      emit(ShopErrorCategoriesState(error: error));
    });
  }
  ChangeFavoriteModel? changeFavorite;
  void changeFavoriteData({required dynamic id,required String token,String lang='ar'})async{
    favorite[id]= !(favorite[id]);
    emit(ShopLoadingChangeFavoritesState());
    await DioShopHelper.postData(
      url:favorites ,
      data: {
        'product_id':id
      },
      lang: lang,
      token: token,
    ).then((value) {
      changeFavorite=ChangeFavoriteModel.fromJson(value.data);
      if(!changeFavorite!.status!) {
        favorite[id]= !favorite[id]!;
      }
      else{
        getFavoriteData();
      }
      emit(ShopSuccessChangeFavoritesState());
    }).catchError((error){
      favorite[id]= !(favorite[id]);
      emit(ShopErrorChangeFavoritesState(error: error));
    });
  }
  GetFavoriteModel? favoriteModel;
  void getFavoriteData()async{
    emit(ShopLoadingGetFavoritesState());
    await DioShopHelper.getData(
      url: favorites,
      lang: 'en',
      token: token,
    ).then((value) {
      favoriteModel=GetFavoriteModel.fromJson(value.data);
       emit(ShopSuccessGetFavoritesState());
    }).catchError((error){
       emit(ShopErrorGetFavoritesState(error: error));
    });
  }
  ShopLoginModel? profileData;
  void getProfileData()async{
    emit(ShopLoadingProfileState());
    await DioShopHelper.getData(
      url: profile ,
      lang: 'en',
      token: token,
    ).then((value) {
      profileData =ShopLoginModel.fromJson(value.data);
       emit(ShopSuccessGetProfileState());
    }).catchError((error){
      emit(ShopErrorGetProfileState(error: error));
    });
  }
  void updateUserData({
    required String name,
    required String email,
    required String phone,
})async{
    emit(ShopLoadingProfileUpdateState());
    await DioShopHelper.putData(
       url: updateProfile,
       data: {
         'name':name,
         'email':email,
         'phone':phone,
       },
      token: token,
      lang: 'en',
     ).then((value) {
      profileData =ShopLoginModel.fromJson(value.data);
      emit(ShopSuccessProfileUpdateState());
    }).catchError((error){
      emit(ShopErrorProfileUpdateState(error: error));
    });
}
}
