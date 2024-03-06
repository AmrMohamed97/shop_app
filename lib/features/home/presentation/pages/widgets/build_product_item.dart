import 'package:flutter/material.dart';
import 'package:project_flutter/core/constants/constants.dart';
import 'package:project_flutter/features/home/data/model/home_model.dart';
import 'package:project_flutter/features/layout/presentation/manager/cubit.dart';

class BuildProductItem extends StatelessWidget {
  const BuildProductItem({super.key, required this.model});
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image:NetworkImage(
                  '${model.image}',
                ),
                width: double.infinity,
                height: 200,
                fit: BoxFit.contain,
              ),
              if(model.discount != 0)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  color: Colors.red,
                  child: const Text(
                    'DISCOUNT',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.name}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    height: 1.2,
                    fontSize: 14,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '${model.price}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.indigo,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    if(model.discount != 0)
                      Text(
                        '${model.oldPrice}',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    const Spacer(),
                    IconButton(
                      onPressed:() {
                        ShopCubit.get(context).changeFavoriteData(
                          id: model.id,
                          token: token,
                          lang: 'en',
                        );
                      } ,
                      icon:  CircleAvatar(
                        radius: 16,
                        backgroundColor: ShopCubit.get(context).favorite[model.id]==false?Colors.grey [400]:Colors.blue,
                        child:const Icon(
                          color: Colors.white,
                          Icons.favorite_border,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
