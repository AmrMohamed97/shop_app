import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_flutter/core/utiles/cach_helper/cache_helper.dart';
import 'package:project_flutter/core/utiles/functions/functions.dart';
import 'package:project_flutter/core/widgets/CustomFormField.dart';
import 'package:project_flutter/core/widgets/custom_button.dart';
import 'package:project_flutter/features/layout/presentation/pages/shop_layout.dart';
import 'package:project_flutter/features/login/cubit/cubit.dart';
import 'package:project_flutter/features/login/cubit/states.dart';
import 'package:project_flutter/features/register/shop_register_screen.dart';

class ShopLoginScreen extends StatelessWidget {
  ShopLoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey =GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
        listener: (context,state) {
          if(state is ShopLoginSuccessState){
             if(state.loginModel!.status ==true){
                CacheHelper.saveData(
                 key: 'token',
                 value: state.loginModel!.data!.token,
               ).then((value) {
                  showSnackBar(
                    context: context,
                    text: '${state.loginModel!.message}', 
                    stateColor: SnackBarState.success ,
                  );
                });
               navigateAndFinish(
                 context: context,
                 route:const ShopLayout() ,
               );

            }
             else{
               showSnackBar(
                 context: context,
                 text: '${state.loginModel!.message}',
                 stateColor: SnackBarState.error ,
               );
            }
          }
        },
        builder: (context,state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'login now to browse our hot offers',
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomFormField(
                          label:'Email' ,
                          prefix: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          validator: (value){
                            if(value.isEmpty){
                              return 'This Field Is Required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomFormField(
                          label:'Password' ,
                          keyboardType: TextInputType.visiblePassword,
                          isPassword: !ShopLoginCubit.get(context).isShown,
                          prefix: Icons.lock,
                          suffix: ShopLoginCubit.get(context).suffixIcon,
                          suffixPressed: (){
                            ShopLoginCubit.get(context).passwordShow();
                          },
                          controller: passwordController ,
                          validator: (value){
                            if(value.isEmpty){
                              return 'This Field Is Required';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        state is ShopLoginLoadingState?
                        const Center(child: CircularProgressIndicator()):
                        CustomButton(
                          text: 'login',
                          isUpperCase: true,
                          onPressed: (){
                            if(formKey.currentState!.validate()){
                              ShopLoginCubit.get(context).userLogin(
                                email:emailController.text ,
                                password: passwordController.text,
                                lang: 'ar',
                              );
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account ?' ,
                              // style:Theme.of(context).textTheme.bodySmall,
                            ),
                            TextButton(
                              onPressed: (){
                                navigateTo(
                                    context,
                                    ShopRegisterScreen(),
                                );
                              },
                              child:const Text(
                                'REGISTER',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}