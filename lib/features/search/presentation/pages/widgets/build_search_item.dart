import 'package:flutter/material.dart';
import 'package:project_flutter/core/constants/constants.dart';
import 'package:project_flutter/features/layout/presentation/manager/cubit.dart';
import 'package:project_flutter/features/search/cubit/search_cubit.dart';
import 'package:project_flutter/features/search/data/model/search_model.dart';

class BuildSearchItem extends StatelessWidget {
  const BuildSearchItem({super.key, this.model, this.context, this.oldPrice=true});
  final SearchData? model, context;
  final bool oldPrice;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage(
                    '${model!.image}',
                  ),
                  width: 120,
                  height: 120,
                  // fit: BoxFit.fill,
                ),
                if (model?.discount != 0 && oldPrice==true)
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
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model?.name}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      height: 1.2,
                      fontSize: 14,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        '${model?.price}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.indigo,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      if (model?.discount != 0 && oldPrice==true)
                        Text(
                          '${model?.oldPrice}',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          ShopCubit.get(context).changeFavoriteData(
                            id: model?.id,
                            token: token,
                            lang: 'en',
                          );
                          SearchCubit.get(context).changeFavorite(model?.id);
                          //   try{
                          //     ShopCubit.get(context).changeFavoriteData(
                          //       id: model.id,
                          //       token: token,
                          //       lang: 'en',
                          //     );
                          //     SearchCubit.get(context).changeFavorite(model.id);
                          //   }catch(exception){
                          //     print(exception);
                          //   }
                        },
                        icon: CircleAvatar(
                          radius: 16,
                          backgroundColor: SearchCubit.get(context).favorite[model?.id]== false ? Colors.grey[400] : Colors.blue,
                          child: const Icon(
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
      ),
    );
  }
}
