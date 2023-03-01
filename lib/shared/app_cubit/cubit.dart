import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rob3_gram/models/result_model.dart';
import 'package:rob3_gram/models/validation_model.dart';
import 'package:rob3_gram/shared/app_cubit/states.dart';
import 'package:rob3_gram/shared/http_crud.dart';
import 'package:async/async.dart';
import 'package:path/path.dart';

import '../components/alert_dialog.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit():super(AppInitialState());
  static AppCubit get(context)=>BlocProvider.of(context);


  int onBoardingIndex=0;
  void changeOnBoardingIndex(int index){
    onBoardingIndex= index;
    emit(ChangeOnBoardingIndexState());
  }

  int? gender;
  int? age;
  void changeGender(int value){
    gender= value;
    emit(ChangeGenderState());
  }

  void changeAge(int value){
    age= value;
    emit(ChangeAgeState());
  }


  File? eyeImage;
  var picker = ImagePicker();
//  XFile? pickedFile;
  void pickEyeImage(context) async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      eyeImage = File(pickedFile.path);
      emit(UserImagePickedSuccess());
    } else {
      emit(UserImagePickedError());
    }

  }

  ResultModel? resultModel;
  ValidationModel? validationModel;
  bool isResultNull=false;

  Future<String> upload(File imageFile, int age) async {
    emit(UploadImageLoadingState());
    var stream = http.ByteStream(DelegatingStream(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse("https://eye-ai.herokuapp.com/upload/?age=$age");
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "multipart/form-data"
    };
    var request = http.MultipartRequest("POST", uri);
    var multipartFile = http.MultipartFile('file', stream, length,
        filename: basename(imageFile.path));
    request.files.add(multipartFile);
    request.headers.addAll(headers);

    http.Response response =
    await http.Response.fromStream(await request.send());
    if (response.body != null) {
      if(response.statusCode==200){

        if(response.body=='null'){
          isResultNull=true;
          print(isResultNull);
        }else{
          resultModel= ResultModel.fromJson(jsonDecode(response.body));
        }

        emit(UploadImageSuccessState());
      }else{
        //validationModel= ValidationModel.fromJson(jsonDecode(response.body));
        // Map res=jsonDecode(response.body);
        // if(res.containsKey('error'))
        //   print(res.toString());
        // else
        if(response.body.contains('!DOCTYPE html')){
          print(response.body);
          emit(UploadImageErrorState());
        }else{
          validationModel= ValidationModel.fromJson(jsonDecode(response.body));
          emit(UploadImageInvalidDataState());
        }
      }
    }
    return response.body;
  }








}

