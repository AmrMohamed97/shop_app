import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_flutter/core/utiles/functions/functions.dart';
import 'package:project_flutter/features/layout/presentation/manager/cubit.dart';
import 'package:project_flutter/features/layout/presentation/manager/states.dart';
import 'package:project_flutter/features/search/search_screen.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder:(context,state){
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Salla',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            actions: [
              IconButton(
                onPressed: (){
                  navigateTo(context, SearchScreen());
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed ,
             currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNav(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon:Icon(Icons.home),
                label:'Home' ,
              ),
              BottomNavigationBarItem(
                icon:Icon(
                  Icons.apps,
                ),
                label:'Categories' ,
              ),
              BottomNavigationBarItem(
                icon:Icon(Icons.favorite),
                label:'Favorites' ,
              ),
              BottomNavigationBarItem(
                icon:Icon(Icons.settings),
                label:'Settings' ,
              ),
            ],
          ),
        );
      } ,
    );
  }
}
