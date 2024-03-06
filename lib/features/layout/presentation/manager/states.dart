abstract class ShopStates{}
class ShopInitialStates extends ShopStates{}
class ShopChangeBottomNavState extends ShopStates{}

class ShopLoadingHomeDataState extends ShopStates{}
class ShopSuccessHomeDataState extends ShopStates{}
class ShopErrorHomeDataState extends ShopStates{
  final String error;
  ShopErrorHomeDataState({required this.error});
}
class ShopLoadingCategoriesState extends ShopStates{}
class ShopSuccessCategoriesState extends ShopStates{}
class ShopErrorCategoriesState extends ShopStates{
  final String error;
  ShopErrorCategoriesState({required this.error});
}
class ShopLoadingChangeFavoritesState extends ShopStates{}
class ShopSuccessChangeFavoritesState extends ShopStates{}
class ShopErrorChangeFavoritesState extends ShopStates{
  final String error;
  ShopErrorChangeFavoritesState({required this.error});
}
class ShopLoadingGetFavoritesState extends ShopStates{}
class ShopSuccessGetFavoritesState extends ShopStates{}
class ShopErrorGetFavoritesState extends ShopStates{
  final String error;
  ShopErrorGetFavoritesState({required this.error});
}
class ShopLoadingProfileState extends ShopStates{}
class ShopSuccessGetProfileState extends ShopStates{}
class ShopErrorGetProfileState extends ShopStates{
  final String error;
  ShopErrorGetProfileState({required this.error});
}
class ShopLoadingProfileUpdateState extends ShopStates{}
class ShopSuccessProfileUpdateState extends ShopStates{}
class ShopErrorProfileUpdateState extends ShopStates{
  final String error;
  ShopErrorProfileUpdateState({required this.error});
}