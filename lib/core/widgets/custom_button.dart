import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.text, this.width= double.infinity, this.isUpperCase =true, this.background= Colors.blue, this.height= 40.0, this.radius= 0.0});
  final Function()? onPressed;
  final String text;
  final double radius ;
  final bool isUpperCase;
  final double width ;
  final Color background ;
  final double height ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        height: height,
        onPressed: onPressed,
        child: Text(
          isUpperCase ? text.toUpperCase() : text ,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
