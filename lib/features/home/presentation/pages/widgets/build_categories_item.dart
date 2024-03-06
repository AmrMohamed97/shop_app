import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter/features/categories/data/model/categories_model.dart';

class BuildCategoriesItem extends StatelessWidget {
  const BuildCategoriesItem({super.key, required this.categoryModel});
  final BuildDataModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment:AlignmentDirectional.bottomCenter ,
      children: [
        Image(
          image:CachedNetworkImageProvider(
            '${categoryModel.image}',
          ) ,
          fit: BoxFit.cover,
          width: 100,
          height: 100,
        ),
        Container(
          color: Colors.black.withOpacity(.6),
          width: 100,
          child: Text(
            '${categoryModel.name}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
