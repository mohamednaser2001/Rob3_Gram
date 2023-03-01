
import 'package:flutter/material.dart';
import 'package:rob3_gram/shared/components/custom_button.dart';


Future<dynamic> errorDialog({
  required context,
  required String text,
  required Function function,
}) => showDialog(
  context: context,
  builder: (context){
    return AlertDialog(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      contentPadding: const EdgeInsets.all(20.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style:const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20,),
          CustomButton(
              text: 'OK',
              function: (){function();},
          ),
        ],
      ),
    );
  },
);