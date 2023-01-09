import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';
//import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../contest/AppColors.dart';

class RatingPage extends StatefulWidget{

  const RatingPage({Key? key}) : super(key: key);
  @override
  _RatingPageState createState() => _RatingPageState();
}
class _RatingPageState extends State<RatingPage>
{
  final RateMyApp rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 0,
    minLaunches: 0,
    remindLaunches: 2, //0,
    remindDays: 0,
    //googlePlayIdentifier: "com.googlechrome",
    googlePlayIdentifier: "com.example.third_year_project",
  );
  @override
  void initState(){
    rateMyApp.init().then((_){
      rateMyApp.conditions.forEach((condition){
        if(condition is DebuggableCondition){
          print(condition.valuesAsString);
        }
      });


      if(rateMyApp.shouldOpenDialog) {
        rateMyApp.showStarRateDialog(

          context,
          title: 'Rate this app',
          message:'you like this app? Then take a little bit of your time to leave a rating',

          actionsBuilder: (context, stars){
            return[
              TextButton(
                child: const Text('ok'),
                onPressed: () async {
                  stars = stars?? 0;
                  print("Thank you for the: ${stars.toString()} stars rating");

                  if(stars!<4){
                    print("would you like to leave feedback");

                  }
                  else{
                    Navigator.pop<RateMyAppDialogButton>(context, RateMyAppDialogButton.rate);
                    await rateMyApp.callEvent(RateMyAppEventType.rateButtonPressed);
                    if((await rateMyApp.isNativeReviewDialogSupported) ??
                        false){
                      await rateMyApp.launchNativeReviewDialog();
                    }
                    rateMyApp.launchStore();

                  }
                },
              ),

            ];
          },
          ignoreNativeDialog: true,
          dialogStyle: const DialogStyle(
            titleAlign: TextAlign.center,
            messageAlign: TextAlign.center,
            messagePadding: EdgeInsets.only(bottom: 20),
          ),

          starRatingOptions:
          const StarRatingOptions(),
          onDismissed: ()  => rateMyApp.callEvent(RateMyAppEventType
              .laterButtonPressed),
        );
      }
    });

    super.initState();
//   }
  }


  //   rateMyApp.showRateDialog(
  //     context,
  //     title: 'Rate this app',
  //     message: 'If you like this app, please take a little bit',
  //     rateButton: 'Rate',
  //     noButton: 'NO THANKS',
  //     laterButton: 'MAYBE LATER',
  //     dialogStyle: const DialogStyle(
  //       titleStyle:
  //         TextStyle(color: Colors.redAccent)),
  //
  //     listener:(button){
  //       switch(button){
  //         case RateMyAppDialogButton.rate:
  //           print('Clicked on "Rate".');
  //           break;
  //         case RateMyAppDialogButton.later:
  //           print('Clicked on "Later".');
  //           break;
  //         case RateMyAppDialogButton.no:
  //           print('Clicked on "No".');
  //           break;
  //
  //       }
  //
  //       return true,




  //       ignoreNativeDialog: Platform.isAndroid,
  //       //ignoreNativeDialog: true,
  //       onDismissed: () =>
  //           rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed),
  //     );
//        }
//      });
//
//     super.initState();
//   }



  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Rate my app",
        ),
        backgroundColor: AppColors.deep_orange,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),);
  }
}