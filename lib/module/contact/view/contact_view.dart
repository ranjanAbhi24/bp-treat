import 'package:bp_treat/module/dashboard/controller/dashboard_controller.dart';
import 'package:bp_treat/module/dashboard/controller/landing_controller.dart';
import 'package:bp_treat/module/dashboard/widget/common_dropdown.dart';
import 'package:bp_treat/utils/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../auth/widget/common_elevated_button.dart';
import '../../dashboard/view/menu_view.dart';
import '../controller/contact_controller.dart';

class ContactMyDoctor extends StatefulWidget {
  const ContactMyDoctor({super.key});

  @override
  State<ContactMyDoctor> createState() => _ContactMyDoctorState();
}

class _ContactMyDoctorState extends State<ContactMyDoctor> {
  @override
  Widget build(BuildContext context) {
    Get.put<DashboardController>(DashboardController());
    return
      Scaffold(
        backgroundColor: kWhiteColor,

        body: GetBuilder<ContactController>(
            init: ContactController(),
            builder: (controller) {
              return controller.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xFFDF1721)),
                      ),
                    )
                  : SingleChildScrollView(
                          child: Container(
                            height: 690.h,
                            width: 360.w,
                            padding: const EdgeInsets.all(25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 50.w,
                                    ),
                                    Center(
                                      child: SizedBox(
                                        width: 200.w,
                                        child: Text("Contact My Doctor",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context).textTheme.headline1!.copyWith(
                                                color: kBlackColor,
                                                fontSize: 25.sp
                                            )
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                               IconButton(
                                      onPressed: (){
                                        MenuDialog().openMenuDialog();
                                      }, icon: const Icon(Icons.menu,
                                      size: 40,),
                                    )
                                  ],
                                ),

                                SizedBox(
                                  height: 30.h,
                                ),

                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color:  Colors.grey,),
                                      borderRadius: const BorderRadius.all(Radius.circular(12))
                                  ),
                                  child: ListTile(
                                    contentPadding:
                                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),

                                    leading:  Container(
                                      height: 70,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100)
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(100),
                                        child: const Image(
                                        image:  AssetImage("assets/images/steven_image.png"),
                                        fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    title:
                                    Text(
                                        "${Get.find<LandingController>().userInfo['data']['doctorId']['fname']}"
                                         " ${Get.find<LandingController>().userInfo['data']['doctorId']['lname']}",

                                        style: TextStyle(
                                            color:
                                            //isSelected ? kWhiteColor : kBlackColor, fontSize: 16
                                            kBlackColor,
                                            fontSize: 16
                                        )),
                                  ),
                                ),

                               SizedBox(height: 50.h),
                                Text(
                                  'What would you like to ask the doctor?',
                                  style:
                                  Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: kBlackColor
                                  ),
                                ),
                                 SizedBox(height: 10.h),
                               Container(
                                 padding: const EdgeInsets.all(10),
                                 decoration: BoxDecoration(
                                   border: Border.all(color: kGreyColor!),
                                   borderRadius: BorderRadius.circular(12)
                                 ),
                                  height: 40.h,
                                  child: DropDownWidget(
                                      dropdownValue: controller.dropdownValue,
                                      items: controller.items, onChange: controller.onChanged
                                  ),
                                ),

                                SizedBox(height: 20.h),
                            Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Please describe further?',
                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                        color: kBlackColor
                                      )
                                    )),
                                const SizedBox(height: 10),
                                TextField(

                                  controller: controller.descriptionController,

                                  maxLines: 5,
                                  cursorColor: kBlackColor,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(10),
                                      enabled: true,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              const BorderRadius.all(
                                                  Radius.circular(10)),
                                          borderSide: BorderSide(
                                              color: kBlackColor!)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              const BorderRadius.all(
                                                  Radius.circular(10)),
                                          borderSide: BorderSide(
                                              color: kPrimaryColor!))),
                                ),


                       SizedBox(height: 20.h),
                                Center(
                                  child: SizedBox(
                                    width: 150.w,
                                    child: CommonElevatedButton(
                                      onTap: () async {
                                        await EasyLoading.show();
                                        await controller.addContactDetails(
                                            doctorId:Get.find<LandingController>().userInfo['data']['doctorId']["id"]);
                                        await EasyLoading.dismiss();
                                      },
                                      title: 'Send',
                                      backgroundColor: kPrimaryColor,
                                      textColor: kWhiteColor,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        );
            }));
  }
}
