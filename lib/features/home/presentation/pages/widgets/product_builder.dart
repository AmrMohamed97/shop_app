import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_flutter/features/categories/data/model/categories_model.dart';
import 'package:project_flutter/features/home/data/model/home_model.dart';
import 'package:project_flutter/features/home/presentation/pages/widgets/build_categories_item.dart';
import 'package:project_flutter/features/home/presentation/pages/widgets/build_product_item.dart';

class ProductBuilder extends StatelessWidget {
  const ProductBuilder({super.key, this.homeModel, this.categoriesModel});
  final HomeModel? homeModel;
  final CategoriesModel? categoriesModel;
   @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: homeModel!.data!.banners.map((e) =>Image(
              image:CachedNetworkImageProvider('${e.image}') ,
              width: double.infinity,
              fit: BoxFit.cover,
            )).toList(),
            options: CarouselOptions(
              height: 250,
              initialPage: 0,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const SizedBox(
            height:15 ,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal:12 ,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    itemBuilder: (context,index)=>BuildCategoriesItem(categoryModel:categoriesModel!.data!.data[index]),
                    separatorBuilder:(context,index)=>const SizedBox(width: 10,) ,
                    itemCount: categoriesModel!.data!.data.length,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'New Products',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey[300],
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount:2 ,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              childAspectRatio: 1/1.57,
              children: List.generate(
                homeModel!.data!.products.length,
                    (index) => BuildProductItem(model:homeModel!.data!.products[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
