 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_flutter/core/utiles/functions/functions.dart';
import 'package:project_flutter/core/widgets/CustomFormField.dart';
import 'package:project_flutter/features/search/cubit/search_cubit.dart';
import 'package:project_flutter/features/search/cubit/search_state.dart';
import 'package:project_flutter/features/search/presentation/pages/widgets/build_search_item.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
           return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                CustomFormField(
                  label: 'search',
                  controller: searchController,
                  onChanged: (text) {
                    SearchCubit.get(context).getSearchData(text: text);
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                if (state is SearchLoadingState)
                  const LinearProgressIndicator(),
                if(SearchCubit.get(context).searchModel !=null)
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => BuildSearchItem(
                        model: SearchCubit.get(context).searchModel!.searchResult!.products[index],
                        oldPrice: false,
                      ),
                      separatorBuilder: (context, index) => mySeparator(),
                      itemCount:SearchCubit.get(context).searchModel!.searchResult!.products.length,
                      physics:const BouncingScrollPhysics(),
                    ),
                  ),
              ]),
            ),
          );
        },
      ),
    );
  }

}
