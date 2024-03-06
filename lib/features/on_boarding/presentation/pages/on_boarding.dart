
import 'package:flutter/material.dart';
import 'package:project_flutter/core/utiles/cach_helper/cache_helper.dart';
import 'package:project_flutter/core/utiles/functions/functions.dart';
import 'package:project_flutter/features/login/shop_login_screen.dart';
import 'package:project_flutter/features/on_boarding/presentation/pages/widgets/build_board_item.dart';
 import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel{
  final String image;
  final String title;
  final String body;
  BoardingModel({required this.image, required this.body, required this.title});
}

class OnBoarding extends StatefulWidget {
    const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final List<BoardingModel> boarding =[
    BoardingModel(
      image: 'assets/images/onboard_1.jpg',
      title: 'On Board 1 Title',
      body:'On Board 1 Body' ),
    BoardingModel(
      image: 'assets/images/onboard_2.jpg',
      title: 'On Board 2 Title',
      body:'On Board 2 Body' ),
    BoardingModel(
      image: 'assets/images/onboard_3.jpg',
      title: 'On Board 3 Title',
      body:'On Board 3 Body' ),
  ];

  final boardingController = PageController();

  bool isLast =false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed:(){
              submit(context);
            } ,
            child:const Text(
              'Skip',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ) ,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context,index)=>BuildBoardItem(board: boarding[index]) ,
                itemCount: boarding.length,
                physics: const BouncingScrollPhysics(),
                controller: boardingController,
                onPageChanged: (index){
                  if(index==boarding.length-1){
                    isLast=true;
                  }
                  else{
                    isLast=false;
                  }
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
             Row(
              children: [
                SmoothPageIndicator(
                  controller:boardingController ,
                  count:boarding.length ,
                  effect: const ExpandingDotsEffect(
                    dotWidth: 15,
                    expansionFactor: 4,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed:(){
                    if(isLast){
                      submit(context);
                     }
                    else{
                    boardingController.nextPage(
                      duration:const Duration(
                        milliseconds: 1800,
                      ) ,
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                    }
                  } ,
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ) ,

    );
  }


  void submit(BuildContext context){
    CacheHelper.saveData(
      key:'onBoarding' ,
      value: true,
    ).then((value) {
      navigateAndFinish(context: context, route: ShopLoginScreen(),);
    });
  }
}
