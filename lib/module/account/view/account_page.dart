
import 'package:bp_treat/module/account/view/health_detail_view.dart';
import 'package:bp_treat/module/account/controller/account_controller.dart';
import 'package:bp_treat/module/account/view/basic_detail_page.dart';
import 'package:bp_treat/module/dashboard/view/menu_view.dart';
import 'package:bp_treat/utils/app_theme.dart';
import 'package:flutter/material.dart';
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
                        // CircleAvatar(
                        //   radius: 50,
                        //   backgroundColor: kPrimaryColor?.withOpacity(0.3),
                        //   child: CircleAvatar(
                        //     radius: 46,
                        //     backgroundColor: kWhiteColor,
                        //     child: CircleAvatar(
                        //       radius: 40,
                        //       backgroundColor: Colors.black,
                        //       child: Text(
                        //         Get.find<LandingController>().userInfo['data']
                        //                 ['name'][0] ??
                        //             "U",
                        //         style: Theme.of(context)
                        //             .textTheme
                        //             .headline1
                        //             ?.copyWith(
                        //               color: kWhiteColor,
                        //               fontSize: 28,
                        //             ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                       // const SizedBox(height: 16),
                        // Text(
                        //   Get.find<LandingController>().userInfo['data']
                        //           ['name'] ??
                        //       "user",
                        //   style: Theme.of(context).textTheme.headline1,
                        // ),
                        // const SizedBox(height: 10),
                        // Text(
                        //   Get.find<LandingController>().userInfo['data']
                        //           ['mobile'] ??
                        //       "phone",
                        //   style: Theme.of(context).textTheme.bodyText1,
                        // ),
                        // const SizedBox(height: 10),
                        // Text(
                        //   Get.find<LandingController>().userInfo['data']
                        //           ['email'] ??
                        //       "abc@xyz.com",
                        //   style: Theme.of(context).textTheme.bodyText2,
                        // ),
                     //   const SizedBox(height: 10),
                     //    RichText(
                     //        text: TextSpan(
                     //            text: "Treated by : ",
                     //            style: Theme.of(context)
                     //                .textTheme
                     //                .bodyText2
                     //                ?.copyWith(
                     //                    fontWeight: FontWeight.w600,
                     //                    fontSize: 14,
                     //                    color: kBlackColor?.withOpacity(0.8)),
                     //            children: [
                     //          TextSpan(
                     //              text:
                     //                  "${Get.find<LandingController>().userInfo['data']['doctorId']['fname']} ${Get.find<LandingController>().userInfo['data']['doctorId']['lname']} ",
                     //              style: Theme.of(context)
                     //                  .textTheme
                     //                  .bodyText2
                     //                  ?.copyWith(
                     //                      fontWeight: FontWeight.bold,
                     //                      fontSize: 15,
                     //                      color: kPrimaryColor))
                     //        ])),
                        //const SizedBox(height: 20),
                        // Get.find<LandingController>().userInfo['data']
                        //             ['consultationConsent'] ==
                        //         false
                        //     ? ElevatedButton(
                        //         style: ElevatedButton.styleFrom(
                        //             backgroundColor: kPrimaryColor,
                        //             elevation: 0.0,
                        //             shape: RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(12),
                        //             ),
                        //             padding: const EdgeInsets.symmetric(
                        //                 horizontal: 30, vertical: 16)),
                        //         onPressed: () {
                        //           Get.to(
                        //               () => const DoctorConsultationConsent());
                        //         },
                        //         child: const Text(
                        //           'Consult the Doctor',
                        //         ),
                        //       )
                        //     : const SizedBox(),
                      //  const SizedBox(height: 30),
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
                              //Get.to(() => const AboutUsView());
                            }),
                        SizedBox(height: 10.h,),
                        buildListTile(
                            title: 'Doctor',
                            image: "assets/icons/help_icon.png",
                            onTap: () {
                             // Get.to(() => const HelpView());
                            }),
                        // buildListTile(
                        //     title: 'Videos',
                        //     image: 'assets/icons/video.png',
                        //     ontap: () {
                        //       Get.to(() => const VideoList());
                        //     }),
                        // buildListTile(
                        //     title: 'Change Password',
                        //     image: "assets/icons/change_password.png",
                        //     ontap: () {
                        //       Get.to(() => const ChangePasswordView());
                        //     }),
                        // buildListTile(
                        //     title: 'Privacy and Policy',
                        //     image: "assets/icons/privacy.png",
                        //     ontap: () {
                        //       launchUrl(
                        //           Uri.parse(
                        //               'https://app.houstonepilepsy.com/privacy-policy'),
                        //           mode: LaunchMode.platformDefault);
                        //     }),
                        // buildListTile(
                        //     title: 'Logout',
                        //     image: "assets/icons/logout.png",
                        //     ontap: () async {
                        //       EasyLoading.show();
                        //       await controller.logout();
                        //       EasyLoading.dismiss();
                        //     }),
                      ],
                    ),
                  ),
                );
        });
  }


}
