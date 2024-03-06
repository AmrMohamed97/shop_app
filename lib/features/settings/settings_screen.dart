import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_flutter/core/utiles/functions/functions.dart';
import 'package:project_flutter/core/widgets/CustomFormField.dart';
import 'package:project_flutter/core/widgets/custom_button.dart';
import 'package:project_flutter/features/layout/presentation/manager/cubit.dart';
import 'package:project_flutter/features/layout/presentation/manager/states.dart';

class SettingsScreen extends StatelessWidget {
    SettingsScreen({super.key});
    final dynamic nameController=TextEditingController();
    final dynamic emailController=TextEditingController();
    final dynamic phoneController=TextEditingController();
  final formKey =GlobalKey<FormState>();
   @override
  Widget build(BuildContext context) {
     initFormField(context);
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){
        if(state is ShopSuccessProfileUpdateState){
          showSnackBar(
            context: context,
            text: '${ShopCubit.get(context).profileData!.message}',
            stateColor: SnackBarState.success,
          );
        }
      },
      builder: (context,state){
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    if(state is ShopLoadingProfileUpdateState)
                      const LinearProgressIndicator(),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                      label: 'name',
                      controller: nameController,
                      prefix: Icons.person,
                      keyboardType: TextInputType.name,
                      validator: (value){
                        if(value.isEmpty){
                          return 'this field is required';
                        }
                        return null;
                      }
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                        label: 'email',
                        controller: emailController,
                        prefix: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value){
                          if(value.isEmpty){
                            return 'this field is required';
                          }
                          return null;
                        }
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                        label: 'phone',
                        controller: phoneController,
                        prefix: Icons.phone,
                        keyboardType: TextInputType.phone,
                        validator: (value){
                          if(value.isEmpty){
                            return 'this field is required';
                          }
                          return null;
                        }
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomButton(
                      text:'UPDATE',
                      onPressed: (){
                        if(formKey.currentState!.validate()) {
                          ShopCubit.get(context).updateUserData(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                          );
                        }
                      },
                      radius: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      text:'LOGOUT',
                      onPressed: (){
                        signOut(context);
                      },
                      radius: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  void initFormField(context){
    nameController.text=ShopCubit.get(context).profileData!.data!.name;
    emailController.text=ShopCubit.get(context).profileData!.data!.email;
    phoneController.text=ShopCubit.get(context).profileData!.data!.phone;
  }
}