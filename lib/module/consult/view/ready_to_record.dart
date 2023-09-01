import 'package:bp_treat/module/dashboard/view/landing_page.dart';
import 'package:bp_treat/widget/common_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/app_theme.dart';
import '../../dashboard/controller/landing_controller.dart';


class ReadyToRecord extends StatelessWidget {
  const ReadyToRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          color: kBlackColor,
        ),
      ),
      body: Container(
         padding: const EdgeInsets.all(12),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(child: Image(image: AssetImage("assets/images/app_icon2.png"))),
            Center(
              child: Text("Ready to Record Blood Pressure",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1!
              ),
            ),
             const Image(
                 image: AssetImage("assets/images/welcome_one.png")),
            SizedBox(
              height: 20.h,
            ),
            Text("You are all set to start tracking!",
            style: Theme.of(context).textTheme!.bodyText1!.copyWith(
              color: kBlackColor,
              fontWeight: FontWeight.normal
            ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text("Please watch this video first:",
              style: Theme.of(context).textTheme!.bodyText1!.copyWith(
                  color: kBlackColor,
                  fontWeight: FontWeight.normal
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.video_camera_back_outlined,
                  color: kBlackColor,
                ),
                SizedBox(width: 10.w,),
                GestureDetector(
                  onTap: () async {
                    await launchUrl(Uri.parse(
                        "https://www.youtube.com/watch?v=0tGyRJxbYpQ"));
                  },
                  child: Text(
                    "How to take your blood pressure",

                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: const Color.fromRGBO(148, 38, 39, 1),
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline
                    ),
                  ),
                ),


              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            SizedBox(
              width: 200,
              height: 40,
              child: CommonElevatedButton(
                  onTap: (){
                    Get.find<LandingController>().getUserDetails();
                    Get.to(()=>const LandingPage());
                  },
                  title: "Record BP",
                  backgroundColor: kPrimaryColor,
                  textColor: kWhiteColor
              ),
            )
          ],
        ),
      ),
    );
  }
}
