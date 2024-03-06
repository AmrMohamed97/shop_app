import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_flutter/core/utiles/cach_helper/cache_helper.dart';
import 'package:project_flutter/core/utiles/functions/functions.dart';
import 'package:project_flutter/core/widgets/CustomFormField.dart';
import 'package:project_flutter/core/widgets/custom_button.dart';
import 'package:project_flutter/features/layout/presentation/pages/shop_layout.dart';
import 'package:project_flutter/features/register/cubit/register_cubit.dart';
import 'package:project_flutter/features/register/cubit/register_state.dart';

class ShopRegisterScreen extends StatelessWidget{
  ShopRegisterScreen({Key? key}):super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  final formKey =GlobalKey<FormState>();

  @override
  Widget build (BuildContext context){
    return BlocProvider(
      create:(context)=>ShopRegisterCubit() ,
      child: BlocConsumer<ShopRegisterCubit,ShopRegisterState>(
        listener: (context,state){
          if(state is ShopRegisterSuccessState){
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
        builder: (context,state){
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
                          'REGISTER',
                          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'register now to browse our hot offers',
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
                          label:'name' ,
                          prefix: Icons.person,
                          keyboardType: TextInputType.name,
                          controller: nameController,
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
                          isPassword: !ShopRegisterCubit.get(context).isShown,
                          prefix: Icons.lock,
                          suffix: ShopRegisterCubit.get(context).suffixIcon,
                          suffixPressed: (){
                            ShopRegisterCubit.get(context).passwordShow();
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
                          height:15,
                        ),
                        CustomFormField(
                          label:'phone' ,
                          prefix: Icons.phone,
                          keyboardType: TextInputType.phone,
                          controller: phoneController,
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
                        state is ShopRegisterLoadingState?
                        const Center(child: CircularProgressIndicator()):
                        CustomButton(
                          text: 'register',
                          radius: 10,
                          isUpperCase: true,
                          onPressed: (){
                            if(formKey.currentState!.validate()){
                              ShopRegisterCubit.get(context).userRegister(
                                email:emailController.text ,
                                password: passwordController.text,
                                name: nameController.text,
                                phone: phoneController.text,
                                lang: 'en',
                              );
                            }
                          },
                        ),
                       ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}