
import 'package:bp_treat/module/account/view/health_detail_view.dart';
import 'package:bp_treat/module/account/controller/account_controller.dart';
import 'package:bp_treat/module/account/view/basic_detail_page.dart';
import 'package:bp_treat/module/dashboard/view/add_reminder.dart';
import 'package:bp_treat/module/dashboard/view/menu_view.dart';
import 'package:bp_treat/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../widget/common_header.dart';
import '../../../widget/common_list_tile.dart';
import '../../medicine/view/medicine_view.dart';


class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(
        init: AccountController(),
        builder: (controller) {
          return controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFFDF1721)),
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding:  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CommonHeader(title: 'My Profile',),

                        SizedBox(height: 30.h,),
                        BuildListTile(
                            title: 'Personal Profile',
                            image: "assets/icons/basic_details.png",
                            onTap: () {
                              Get.to(() => const EditBasicDetails());
                            }),
                        SizedBox(height: 10.h,),

                        BuildListTile(
                            title: 'Health Profile',
                            image: "assets/icons/health_details_icon.png",
                            onTap: () {
                              Get.to(() => const HealthDetailView());
                            }),
                        SizedBox(height: 10.h,),
                        BuildListTile(title: "Reminder",
                            image:"assets/icons/help_icon.png" ,
                            onTap: (){
                              Get.to(()=> const ReminderScreen());
                            }),
                        SizedBox(height: 10.h,),
                        BuildListTile(
                            title: 'Blood Pressure Prescriptions',
                            image: "assets/icons/about_us.png",
                            onTap: () {
Get.to(()=>const MedicineView());
                            }),
                        SizedBox(height: 10.h,),
                        BuildListTile(
                            title: 'Doctor',
                            image: "assets/icons/help_icon.png",
                            onTap: () {
                             // Get.to(() => const HelpView());
                            }),

                        SizedBox(height: 10.h,),
                        BuildListTile(
                            title: 'Logout',
                            image: "assets/icons/logout.png",
                            onTap: () async {
                              EasyLoading.show();
                              await controller.logout();
                              EasyLoading.dismiss();
                            }),

                      ],
                    ),
                  ),
                );
        });
  }


}
