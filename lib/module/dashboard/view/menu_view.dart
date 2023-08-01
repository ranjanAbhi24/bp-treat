import 'package:bp_treat/widget/common_list_tile.dart';
import 'package:bp_treat/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../account/view/about_us_screen.dart';
import '../../account/view/help_details.dart';
import '../../account/view/video_list.dart';


class MenuDialog {
    
  openMenuDialog(){
    return Get.generalDialog(pageBuilder: (_,__,___)
    {
      return SafeArea(
        child: Container(
          color: Colors.red[100],
          padding:  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 110.w,),
                Image.asset(
                    "assets/icons/app_logo2.png",
                    height: 150.h,
                    width: 100.w,

                ),
SizedBox(
  width: 60.w,
),

                Container(
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(100)
                  ),
                  child: IconButton(onPressed: (){
                    Get.back();
                  },
                      padding: const EdgeInsets.all(2),
                      icon: const Icon(Icons.close)
                  ),
                )
                ],
              ),

              BuildListTile(
                  title: "About BP Treat",
                  image: "assets/icons/about_us.png",
                  onTap: (){
                    Get.to(() => const AboutUsView());
                  }),
              SizedBox(height: 5.h,),
              BuildListTile(
                  title: "FAQ",
                  image: "assets/icons/help_icon.png",
                  onTap: (){
                    Get.to(() => const HelpView());
                  }),
              SizedBox(height: 5.h,),
              BuildListTile(
                  title: "Videos",
                  image: "assets/icons/video.png",
                  onTap: (){
                    Get.to(() => const VideoList());
                  }),
              SizedBox(height: 5.h,),
              BuildListTile(
                  title: "Privacy Policy",
                  image: "assets/icons/privacy.png",
                  onTap: (){
                    launchUrl(
                                  Uri.parse(
                                      'https://app.houstonepilepsy.com/privacy-policy'),
                                  mode: LaunchMode.platformDefault);
                  }),
              SizedBox(height: 5.h,),
              BuildListTile(
                  title: "Terms of Service",
                  image: "assets/icons/privacy.png",
                  onTap: (){

                  }),

            ],
          ),
        ),
      );
    }
    );
  }
}