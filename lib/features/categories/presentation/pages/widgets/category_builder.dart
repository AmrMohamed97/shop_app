import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter/features/categories/data/model/categories_model.dart';

class CategoryBuilder extends StatelessWidget {
  const CategoryBuilder({super.key, required this.model});
  final BuildDataModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Image(
            image:CachedNetworkImageProvider(
              '${model.image}',
            ) ,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            '${model.name}',
            style:const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize:15
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed:(){} ,
            icon:const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
        ],
      ),
    );
  }
}
