import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rob3_gram/models/result_model.dart';
import 'package:rob3_gram/modules/result_screen.dart';
import 'package:rob3_gram/shared/app_cubit/cubit.dart';
import 'package:rob3_gram/shared/app_cubit/states.dart';
import 'package:rob3_gram/shared/components/alert_dialog.dart';
import 'package:rob3_gram/shared/components/custom_button.dart';
import 'package:rob3_gram/shared/constants.dart';
import 'package:rob3_gram/shared/methods/navigation_method.dart';

import '../shared/components/default_app_bar.dart';
import 'error_screen.dart';

class UploadingImageScreen extends StatelessWidget {
  const UploadingImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      resizeToAvoidBottomInset: false,
      appBar: DefaultAppBar(),
      body: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state){
          if(state is UploadImageSuccessState){
            if(AppCubit.get(context).isResultNull){
              navigateTo(context, ErrorScreen());
            }else{
              navigateTo(context, ResultScreen(model: AppCubit.get(context).resultModel!));
            }
          }else if(state is UploadImageErrorState){
            errorDialog(
                context: context,
                text: 'There is an error, please try again later.',
                function: (){
              Navigator.pop(context);
            });
          }else if(state is UploadImageInvalidDataState){
            errorDialog(
                context: context,
                text: 'chose the valid image.',
                function: (){
                  Navigator.pop(context);
                });
          }
        },
        builder: (context, state)=> Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.5,
              color: Colors.black,
              padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.16),
              child: AppCubit.get(context).eyeImage==null ? Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.grey,
              ) : Image.file(AppCubit.get(context).eyeImage!),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: MaterialButton(
                      color: Colors.grey[800],
                      height: 52,
                      minWidth: 50,
                      child: Icon(Icons.camera, color: Colors.grey[400], size: 32,),
                      onPressed: (){
                        AppCubit.get(context).pickEyeImage(context);
                      },
                    ),
                  ),

                  const SizedBox(height: 24,),
                  Text(
                    'The result may differ depend on the distance between the camera and the eye',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 26,),

                  if(state is UploadImageLoadingState)
                    const CircularProgressIndicator(),
                  CustomButton(
                    text: 'Result',
                    function: (){
                      if(AppCubit.get(context).eyeImage!=null){
                        AppCubit.get(context).upload(AppCubit.get(context).eyeImage!, AppCubit.get(context).age!);
                      }
                      // ResultModel m=ResultModel(horizontalDiameter: '30',status: 'upnormal');
                      // navigateTo(context, ResultScreen(model: m));

                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
