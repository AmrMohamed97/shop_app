import 'package:flutter/material.dart';

class NewsBuilder extends StatelessWidget {
  const NewsBuilder({super.key, required this.context, required this.category});
  final BuildContext context ;
  final Map<String,dynamic> category;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child:   Padding(

        padding: const EdgeInsets.all(20.0),

        child: Row(

          children: [

            Container(

              width: 120,

              height: 120,

              decoration:  BoxDecoration(

                borderRadius:BorderRadius.circular(10.0) ,

                image:   DecorationImage(

                    image: NetworkImage(

                      '${category['urlToImage']}',

                    ),

                    fit: BoxFit.cover

                ),

              ),

            ),

            const SizedBox(

              width: 13,

            ),

            Expanded(

              child: SizedBox(

                height: 120,

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Expanded(

                      child: Text(

                        '${category['title']}',

                        maxLines: 3,

                        overflow: TextOverflow.ellipsis,

                        style:Theme.of(context).textTheme.bodyLarge,

                      ),

                    ),

                    Text(

                      '${category['publishedAt']}',

                      style:const TextStyle(

                        color: Colors.grey,

                      ),

                    ),

                  ],

                ),

              ),

            ),

          ],

        ),

      ),
    );
  }
}
