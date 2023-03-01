import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key, required this.text, required this.function}) : super(key: key);
  String text;
  Function function;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      child: Text(
        text,
        style:const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      onPressed: (){
        function();
      },
    );
  }
}
