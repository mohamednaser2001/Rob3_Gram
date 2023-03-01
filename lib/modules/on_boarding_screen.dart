import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rob3_gram/modules/gender_screen.dart';
import 'package:rob3_gram/shared/app_cubit/cubit.dart';
import 'package:rob3_gram/shared/app_cubit/states.dart';
import '../shared/components/default_app_bar.dart';
import 'package:rob3_gram/shared/components/custom_button.dart';
import 'package:rob3_gram/shared/constants.dart';
import 'package:rob3_gram/shared/methods/navigation_method.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/on_boarding_model.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  PageController onBoardController= PageController();

  List<OnBoardingModel> items=[
    OnBoardingModel(title: '1/4 GRAM..' , text: 'Your gate for drug detection world', image: 'intro1'),
    OnBoardingModel(title: '' , text: 'Keep adjusting the camera for around 15 cm and use a light of the intensity of 100 cd/m2 from a single eye then tap RESULT button to see if a person is a drug addict or not.', image: 'intro2')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PageView.builder(

                  itemBuilder: (context,index) => OnBoardingItem(model: items[index]),
                  onPageChanged: (index){
                    AppCubit.get(context).changeOnBoardingIndex(index);
                  },
                  physics:const BouncingScrollPhysics(),
                  itemCount: 2,
                  controller: onBoardController,
                ),
              ),

              SmoothPageIndicator(
                controller: onBoardController,
                count: items.length,
                effect: WormEffect(
                  activeDotColor: Colors.white,
                  dotColor: Colors.grey.withOpacity(0.5),
                  dotHeight: 10.0,
                  dotWidth: 10,
                  spacing: 10.0,
                ),
              ),
              const SizedBox(height: 40,),
              BlocConsumer<AppCubit, AppStates>(
                listener: (context, state){},
                builder: (context, state)=> CustomButton(
                  text: AppCubit.get(context).onBoardingIndex==0? 'Next' : 'Start',
                  function: (){
                    if(AppCubit.get(context).onBoardingIndex==0){
                      onBoardController.nextPage(duration: const Duration(seconds: 100), curve: Curves.bounceInOut);
                    }else{
                      navigateTo(context, GenderScreen());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoardingItem extends StatelessWidget {
  OnBoardingItem({Key? key, required this.model}) : super(key: key);
  OnBoardingModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('$imagePath/${model.image}.png'),
        const SizedBox(height: 20,),
        if(model.title.isNotEmpty)
          Text(
          model.title,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 20,
              height: 2
          ),
        ),
        const SizedBox(height: 14,),
        Text(
          model.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[400],
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),


      ],
    );
  }
}
