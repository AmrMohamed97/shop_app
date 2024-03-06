 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_flutter/features/categories/presentation/pages/widgets/category_builder.dart';
import 'package:project_flutter/features/layout/presentation/manager/cubit.dart';
import 'package:project_flutter/features/layout/presentation/manager/states.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener:(context,state){},
      builder: (context,state){
        return ListView.separated(
          itemBuilder: (context,index)=>CategoryBuilder(model:ShopCubit.get(context).categoriesModel!.data!.data[index]),
          separatorBuilder:(context,index)=> Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[300],
          ),
          itemCount:ShopCubit.get(context).categoriesModel!.data!.data.length ,
        );
      },
    );
  }
}
