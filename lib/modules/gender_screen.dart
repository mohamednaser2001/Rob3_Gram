import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rob3_gram/modules/uploading_image_screen.dart';
import 'package:rob3_gram/shared/app_cubit/cubit.dart';
import 'package:rob3_gram/shared/app_cubit/states.dart';
import '../shared/components/default_app_bar.dart';
import 'package:rob3_gram/shared/methods/navigation_method.dart';
import '../shared/components/custom_button.dart';

class GenderScreen extends StatelessWidget {
  GenderScreen({Key? key}) : super(key: key);
  List<String> genders=['Gender', 'Male','Female'];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: DefaultAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 14,),
            Text(
              'Please fill in the details below, so that we can get the correct result',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[300],
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),

            SizedBox(height: size.height*0.1,),
            BlocConsumer<AppCubit, AppStates>(
              listener: (context, state){},
              builder: (context, state)=> Container(
                width: double.infinity,
                height: 36,
                padding: const EdgeInsets.symmetric(horizontal: 12.0,),
                color: Colors.grey[800],
                child: DropdownButton(
                  underline:const SizedBox(),
                  isExpanded: true,
                  value: AppCubit.get(context).age,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[400],
                  ),
                  hint: Text(
                    'Age',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[400],
                    ),
                  ),
                  // Down Arrow Icon
                  icon: Icon(Icons.arrow_drop_down,size: 30, color: Colors.grey[400],),
                  items: List.generate(
                    70,
                        (index) => DropdownMenuItem(
                      value: index + 1,
                      child: Text(
                        '${20 + index}',
                      ),
                    ),
                  ),
                  onChanged: (newValue) {
                    AppCubit.get(context).changeAge(int.parse(newValue.toString()));
                  },
                ),
              ),
            ),

            SizedBox(height: size.height*0.07,),
            BlocConsumer<AppCubit, AppStates>(
            listener: (context, state){},
            builder: (context, state)=> Container(
              width: double.infinity,
              height: 36,
              padding: const EdgeInsets.symmetric(horizontal: 12.0,),
              color: Colors.grey[800],
              child: DropdownButton(
                underline:const SizedBox(),
                isExpanded: true,
                value: AppCubit.get(context).gender,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[400],
                ),
                hint: Text(
                  'Gender',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[400],
                  ),
                ),
                // Down Arrow Icon
                icon: Icon(Icons.arrow_drop_down,size: 30, color: Colors.grey[400],),
                items: const [
                  DropdownMenuItem(
                    value: 1,
                    child: Text(
                      "Male",
                    ),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text(
                      "Female",
                    ),
                  )
                ],
                onChanged: (newValue) {
                  AppCubit.get(context).changeGender(int.parse(newValue.toString()));
                },
              ),
            ),
          ),

            SizedBox(height: size.height*0.3,),
            CustomButton(
              text: 'Next',
              function: (){
                if(AppCubit.get(context).gender!=null && AppCubit.get(context).age!=null){
                  navigateTo(context, const UploadingImageScreen());
                }
                },
            ),
          ],
        ),
      ),
    );
  }
}
