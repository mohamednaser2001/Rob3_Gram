import 'package:flutter/material.dart';
import '../shared/components/default_app_bar.dart';
class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: DefaultAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'No pupil detected',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                fontSize: 20,
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
            IconButton(
              iconSize: 50,
              onPressed: (){
                Navigator.pop(context);
              },
              icon: const Icon(Icons.refresh, color: Colors.red, ),
            ),
          ],
        ),
      ), 
    );
  }
}
