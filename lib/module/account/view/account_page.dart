
import 'package:bp_treat/module/account/view/health_detail_view.dart';
import 'package:bp_treat/module/account/controller/account_controller.dart';
import 'package:bp_treat/module/account/view/basic_detail_page.dart';
import 'package:bp_treat/module/dashboard/view/menu_view.dart';
import 'package:bp_treat/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../dashboard/widget/common_list_tile.dart';


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
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                        //  crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 250.w,
                              child: Text("My Profile",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.headline1!.copyWith(
                                      color: kBlackColor,
                                      fontSize: 25.sp
                                  )
                              ),
                            ),
                            IconButton(
                              onPressed: (){
                                MenuDialog().openMenuDialog();
                              }, icon: const Icon(Icons.menu,
                              size: 40,),

                            )
                          ],
                        ),
                        SizedBox(height: 30.h,),
                        buildListTile(
                            title: 'Personal Profile',
                            image: "assets/icons/basic_details.png",
                            onTap: () {
                              Get.to(() => const EditBasicDetails());
                            }),
                        SizedBox(height: 10.h,),
                        buildListTile(
                            title: 'Health Profile',
                            image: "assets/icons/health_details_icon.png",
                            onTap: () {
                              Get.to(() => const HealthDetailView());
                            }),
                        SizedBox(height: 10.h,),
                        buildListTile(
                            title: 'Blood Pressure Prescriptions',
                            image: "assets/icons/about_us.png",
                            onTap: () {

                            }),
                        SizedBox(height: 10.h,),
                        buildListTile(
                            title: 'Doctor',
                            image: "assets/icons/help_icon.png",
                            onTap: () {
                             // Get.to(() => const HelpView());
                            }),

                        SizedBox(height: 10.h,),
                        buildListTile(
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
