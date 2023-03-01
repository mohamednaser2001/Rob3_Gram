import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:rob3_gram/models/result_model.dart';
import 'dart:math' as math;
import '../shared/components/default_app_bar.dart';


class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key, required this.model}) : super(key: key);
  ResultModel model;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: DefaultAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: IconButton(
                iconSize: 50,
                onPressed: (){
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.refresh, color: Colors.grey.withOpacity(0.2),),
              ),
            ),

            CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 17.0,
              percent: int.parse(model.horizontalDiameter.toString())/100,
              backgroundColor: Colors.transparent,
              circularStrokeCap: CircularStrokeCap.round,
              center: Text(
                '${model.horizontalDiameter!}%',
              style: TextStyle(
                color:model.status=='normal'? Colors.blue :Colors.red,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              ),
              progressColor: model.status=='normal'? Colors.blue :Colors.red,
            ),

            Text(
              model.status!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: model.status=='normal'? Colors.blue :Colors.red,
                fontWeight: FontWeight.w400,
                fontSize: 34,
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height*0.07,),
            Text(
              'The result may differ depend on the distance between the camera and the eye',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height*0.15,),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: MaterialButton(onPressed: (){},
              color: Colors.transparent,
                elevation: 0.0,
                child: Column(
                  children: [
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child:const Icon(
                        Icons.reply_all_rounded,
                        color: const Color(0xff2381C1),
                        size: 25,
                      ),
                    ),
                    SizedBox(height: 4,),
                    const Text(
                      'Share Result',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
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
