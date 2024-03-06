import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_flutter/core/utiles/functions/functions.dart';
import 'package:project_flutter/features/favorites/presentation/pages/widgets/build_favorite_item.dart';
import 'package:project_flutter/features/layout/presentation/manager/cubit.dart';
import 'package:project_flutter/features/layout/presentation/manager/states.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder:(context,state){
        return state is ShopLoadingGetFavoritesState || state is ShopSuccessChangeFavoritesState?
        const Center(child: CircularProgressIndicator()):
        ListView.separated(
          itemBuilder: (context,index)=> BuildFavoriteItem(
              model: ShopCubit.get(context).favoriteModel!.favData!.data[index].product ),
          separatorBuilder:(context,index)=>mySeparator() ,
          itemCount: ShopCubit.get(context).favoriteModel!.favData!.data.length,
        );
      } ,
    );

  }
 }
