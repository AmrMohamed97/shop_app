 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_flutter/core/utiles/functions/functions.dart';
import 'package:project_flutter/features/home/presentation/pages/widgets/product_builder.dart';
import 'package:project_flutter/features/layout/presentation/manager/cubit.dart';
import 'package:project_flutter/features/layout/presentation/manager/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener:(context,state){
        if(state is ShopSuccessChangeFavoritesState){
          if(ShopCubit.get(context).changeFavorite!.status==false){
            showSnackBar(
              context: context,
              text: '${ShopCubit.get(context).changeFavorite!.message}',
              stateColor: SnackBarState.error,
            );
          }

        }
      } ,
      builder: (context,state){
        return ((ShopCubit.get(context).homeModel !=null) && (ShopCubit.get(context).categoriesModel !=null))?
        ProductBuilder(homeModel:ShopCubit.get(context).homeModel,categoriesModel:ShopCubit.get(context).categoriesModel):
        const Center(child: CircularProgressIndicator());
      },
    );
  }
}
