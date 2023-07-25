import 'package:bp_treat/module/dashboard/controller/landing_controller.dart';
import 'package:bp_treat/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<LandingController>(
          init: LandingController(),
          builder: (controller) => Scaffold(
            backgroundColor: kWhiteColor,
                body: controller.getPage(controller.tabIndex),
                bottomNavigationBar:
                    buildBottomNavigationMenu(context, controller),
              )),
    );
  }

  buildBottomNavigationMenu(context, LandingController controller) {
    // return GetPlatform.isAndroid
    //     ? BottomNavigationBar(
    //         unselectedItemColor: Colors.white.withOpacity(0.6),
    //         selectedItemColor: Colors.white,
    //         backgroundColor: kGreyColor,
    //         currentIndex: controller.tabIndex,
    //         onTap: controller.changeTabIndex,
    //         type: BottomNavigationBarType.fixed,
    //         items: const [
    //           BottomNavigationBarItem(
    //             backgroundColor: Colors.red,
    //             label: "Record BP",
    //             icon: Icon(Icons.add),
    //           ),
    //           BottomNavigationBarItem(
    //             label: "View BP History",
    //             backgroundColor: Colors.red,
    //             icon: Icon(Icons.search),
    //           ),
    //           BottomNavigationBarItem(
    //             label: "Contact Doctor",
    //             backgroundColor: Colors.red,
    //             icon: Icon(Icons.chat),
    //           ),
    //           BottomNavigationBarItem(
    //             label: "View Profile",
    //             backgroundColor: Colors.red,
    //             icon: Icon(Icons.account_box),
    //           ),
    //         ],
    //       )
    //     : CupertinoTabScaffold(
    //         backgroundColor: kWhiteColor,
    //         tabBar: CupertinoTabBar(
    //             height: 54,
    //             activeColor: kWhiteColor,
    //             inactiveColor: kWhiteColor!.withOpacity(0.6),
    //             backgroundColor: kPrimaryColor,
    //             onTap: controller.changeTabIndex,
    //             currentIndex: controller.tabIndex,
    //             items: const [
    //               BottomNavigationBarItem(
    //                 label: "Record BP",//Dashboard
    //                 icon: Icon(Icons.add),
    //               ),
    //               BottomNavigationBarItem(
    //                 label: "View BP History",
    //                 icon: Icon(Icons.medication),
    //               ),
    //               BottomNavigationBarItem(
    //                 label: "Contact Doctor",
    //                 icon: Icon(Icons.chat),
    //               ),
    //               BottomNavigationBarItem(
    //                 label: "View Profile",
    //                 icon: Icon(Icons.account_box),
    //               ),
    //             ]),
    //         tabBuilder: ((context, index) {
    //           return CupertinoTabView(
    //             builder: (context) {
    //               return controller.getPage(index);
    //             },
    //           );
    //         }));
    return Container(
      height: 90.h,
      decoration: BoxDecoration(
        color: kGreyColor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            onTap: (){
              controller.changeTabIndex(0);
            },
            child: Container(
              height: 80.h,
              width: 90.w,
              decoration: BoxDecoration(
                  color: controller.tabIndex==0?kPrimaryColor:kGreyColor,
                  borderRadius: BorderRadius.circular(9)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Icon(Icons.add,color: controller.tabIndex==0?kWhiteColor:kBlackColor,),
                  Text("Record\nBP",
                  textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle2!.
                      copyWith(color: controller.tabIndex==0?kWhiteColor:kBlackColor)
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              controller.changeTabIndex(1);
            },
            child: Container(
              height: 80.h,
              width: 90.w,
              decoration: BoxDecoration(
                  color: controller.tabIndex==1?kPrimaryColor:kGreyColor,
                  borderRadius: BorderRadius.circular(10)
              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Icon(Icons.search,color: controller.tabIndex==1?kWhiteColor:kBlackColor,),
                  Text("View BP\nHistory",
                    textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(color: controller.tabIndex==1?kWhiteColor:kBlackColor)
                  )

                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              controller.changeTabIndex(2);
            },
            child: Container(
              height: 80.h,
              width: 90.w,
              decoration: BoxDecoration(
                  color: controller.tabIndex==2?kPrimaryColor:kGreyColor,
                  borderRadius: BorderRadius.circular(10)
              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
    Icon(Icons.chat,color: controller.tabIndex==2?kWhiteColor:kBlackColor),
                  Text("Contact\nDoctor",
                  textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(color: controller.tabIndex==2?kWhiteColor:kBlackColor)
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              controller.changeTabIndex(3);
            },
            child: Container(

              height: 80.h,
              width: 90.w,
              decoration: BoxDecoration(
                  color: controller.tabIndex==3?kPrimaryColor:kGreyColor,
                borderRadius: BorderRadius.circular(10)
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person,
                      color: controller.tabIndex==3?kWhiteColor:kBlackColor
                  ),
                  Text("View\nProfile",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(color: controller.tabIndex==3?kWhiteColor:kBlackColor)
                      )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
