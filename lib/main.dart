import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rob3_gram/modules/error_screen.dart';
import 'package:rob3_gram/modules/splash_screen.dart';
import 'package:rob3_gram/shared/app_cubit/cubit.dart';

import 'modules/gender_screen.dart';
import 'modules/result_screen.dart';
import 'modules/uploading_image_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> AppCubit(),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
        ),
        debugShowCheckedModeBanner: false,
        title: 'Rob3 Gram',
        home:  SplashScreen(),
      ),
    );
  }
}




