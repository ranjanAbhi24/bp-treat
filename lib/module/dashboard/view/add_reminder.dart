import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_theme.dart';


class Reminder extends StatelessWidget {
  const Reminder({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.all(30),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                      "assets/images/app_icon2.png",
                      height: 90.h,
                      width: 100.w
                  ),
                  Text("Reminders",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 25.sp
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text("Let's set a reminder for when you are past due for taking your blood pressure.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: kBlackColor?.withOpacity(0.8)
                    ),
                  ),
                  Text("How often does your doctor advise you to take your blood pressure?",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: kBlackColor
                  ),
                  ),

                  Text("At what time would you like to be reminded if you haven't yet ")
                ],
              ),
            ),
          ),
        )
    );
  }
}
