import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({super.key, this.prefix,this.suffix, this.suffixPressed, this.onChanged, this.onTap, this.onFieldSubmitted, this.keyboardType, this.validator, this.label, required this.controller, this.isPassword=false, this.isUpperCase=false, this.enabled=true});
  final IconData? prefix;
  final IconData? suffix;
  final Function()? suffixPressed;
  final bool isPassword  ;
  final FormFieldSetter? onChanged;
  final Function()? onTap;
  final FormFieldSetter? onFieldSubmitted;
  final TextInputType? keyboardType;
  final FormFieldValidator? validator;
  final String? label ;
  final bool isUpperCase ;
  final bool enabled  ;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      decoration: InputDecoration(

        labelText: isUpperCase?label!.toUpperCase():label  ,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),

        prefixIcon: Icon(prefix),
        suffixIcon:  IconButton(
          padding: EdgeInsets.zero,
          onPressed: suffixPressed,
          icon:Icon(suffix),

        ),
        isDense: true,
      ),
      enabled: enabled,
      keyboardType: keyboardType,

      obscureText: isPassword,

      onTap: onTap,

      onFieldSubmitted: onFieldSubmitted,

      onChanged: onChanged,

      controller:controller ,

      validator:validator,

    );
  }
}
