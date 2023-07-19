import 'package:bp_treat/module/auth/controller/add_health_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/size.dart';
import '../../doctor/view/doctor_selection_screen.dart';
import '../widget/common_elevated_button.dart';


class ProfileComplete extends StatelessWidget {
  const ProfileComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
       Scaffold(
          body: Container(
            padding: const EdgeInsets.all(32),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Image.asset(
                    "assets/images/app_icon2.png",
                      height: 90.h,
                      width: 100.w
                  ),
                  Text("Profile Complete",
                    style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 25.sp
                    ),
                  ),
                  Image.asset(
                    "assets/images/welcome_three.png",
                  ),
                   Text("Now that you have created a profile.\nyou will need to:",
                   style: Theme.of(context).textTheme.bodyText2!.copyWith(
                     color: Colors.black,
                     fontWeight: FontWeight.w600
                   ),
                   ),
                  SizedBox(
                    height: 20.h,
                  ),

              SizedBox(
                width: 260.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children:  [
                        const Text("\u2022   "),
                        SizedBox(
                          width: 240.w,
                          child: Text(
                              "Purchase a blood pressure cuff",
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  color: Colors.black
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(

                      children:  [
                        const Text("\u2022   "),
                        SizedBox(
                          width: 240.w,
                          child: Text(
                              "Schedule a virtual visit with a doctor",
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  color: Colors.black
                              )),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    GestureDetector(
                        onTap: () async {
                          await launchUrl(Uri.parse(
                              "https://www.youtube.com/watch?v=0tGyRJxbYpQ"));
                        },
                        child: Row(
                          children: [
                            const Text("\u2022   "),
                            SizedBox(
                              width: 240.w,
                              child: Text(
                                  "Watch a video on how to take your blood pressure",
                                  overflow: TextOverflow.visible,
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline,

                                  )),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    width: 150.w,
                    child: CommonElevatedButton(
                      title: 'Choose Doctor',
                      onTap: ()  {
                        Get.to(()=> const DoctorSelectionScreen(),
                        );
                      }, backgroundColor: kPrimaryColor, textColor: kWhiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )

    );
  }
}
