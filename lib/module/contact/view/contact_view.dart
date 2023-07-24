import 'package:bp_treat/module/dashboard/controller/dashboard_controller.dart';
import 'package:bp_treat/module/dashboard/controller/landing_controller.dart';
import 'package:bp_treat/module/dashboard/widget/common_dropdown.dart';
import 'package:bp_treat/utils/app_theme.dart';
import 'package:bp_treat/utils/size.dart';
import 'package:flutter/material.dart';
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
        // appBar: AppBar(
        //   title: const Text('How can we help? '),
        //   elevation: 0.0,
        //   backgroundColor: kPrimaryColor,
        //   centerTitle: false,
        //   leading: Padding(
        //     padding: const EdgeInsets.all(6.0),
        //     child: CircleAvatar(
        //       backgroundColor: kWhiteColor,
        //       child: const Text('BP'),
        //     ),
        //   ),
        // ),
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
                                // Text(
                                //   controller.changePrescription.data?.title ??
                                //       "",
                                //   style:
                                //       Theme.of(context).textTheme.headline2,
                                // ),
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
                                        // "${Get.find<LandingController>().doctorInfo['data']['doctorId']['fname']}"
                                        // " ${Get.find<LandingController>().doctorInfo['data']['doctorId']['lname']}",
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
                                // Column(
                                //   children: controller.listOfMedicine
                                //       .map<Widget>(
                                //         (item) => Container(
                                //           padding: const EdgeInsets.all(2),
                                //           margin: const EdgeInsets.symmetric(
                                //               vertical: 2),
                                //           decoration: BoxDecoration(
                                //               borderRadius:
                                //                   BorderRadius.circular(12),
                                //               border: Border.all(
                                //                   color: controller
                                //                           .selectedMedicines
                                //                           .isEmpty
                                //                       ? Colors.grey
                                //                       : kPrimaryColor!)),
                                //           child: CheckboxListTile(
                                //             value: controller
                                //                 .selectedMedicines
                                //                 .contains(item.name),
                                //             controlAffinity:
                                //                 ListTileControlAffinity
                                //                     .trailing,
                                //             onChanged: (bool? isSelect) {
                                //               controller.onMedSelect(
                                //                   item.name,
                                //                   isSelect ?? false);
                                //             },
                                //             title: Text(item.name ?? ""),
                                //             activeColor: kPrimaryColor,
                                //             checkColor: kWhiteColor,
                                //           ),
                                //         ),
                                //       )
                                //       .toList(),
                                // ),
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
                                  onChanged: (value) {},
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
                                // ValueListenableBuilder<TextEditingValue>(
                                //     valueListenable:
                                //         controller.otherIssueController,
                                //     builder: (context, value, child) {
                                //       return
                                //           // const SizedBox(height: 10),
                                //           ElevatedButton(
                                //         style: ElevatedButton.styleFrom(
                                //           backgroundColor: kPrimaryColor,
                                //         ),
                                //         onPressed: controller
                                //                     .selectedMedicines
                                //                     .isNotEmpty ||
                                //                 controller
                                //                     .otherIssueController
                                //                     .text
                                //                     .isNotEmpty
                                //             ? () async => await controller
                                //                 .sendMedicineForChange(
                                //                     controller
                                //                             .prescriptionID ??
                                //                         "")
                                //             : null,
                                //         child: const Text('Submit Request'),
                                //       );
                                //     }),
                         //     const SizedBox(height: 10),
                                // RichText(
                                //   text: TextSpan(
                                //       text: 'or connect with ',
                                //       style: Theme.of(context)
                                //           .textTheme
                                //           .subtitle1!
                                //           .copyWith(),
                                //       children: [
                                //         TextSpan(
                                //             style: Theme.of(context)
                                //                 .textTheme
                                //                 .subtitle1!
                                //                 .copyWith(
                                //                     color: kPrimaryColor,
                                //                     fontSize: 15),
                                //             text:
                                //                 "${Get.find<LandingController>().userInfo['data']['doctorId']['fname']} ${Get.find<LandingController>().userInfo['data']['doctorId']['lname']}")
                                //       ]),
                                // ),
                       SizedBox(height: 20.h),
                                Center(
                                  child: SizedBox(
                                    width: 150.w,
                                    child: CommonElevatedButton(
                                      onTap: () {


                                      },
                                      title: 'Send',
                                      backgroundColor: kPrimaryColor,
                                      textColor: kWhiteColor,
                                    ),
                                  ),
                                ),

                                // ElevatedButton(
                                //     style: ElevatedButton.styleFrom(
                                //       backgroundColor: kPrimaryColor,
                                //     ),
                                //     onPressed: () => controller.makePhoneCall(
                                //         Uri.parse(
                                //             'tel:${Get.find<LandingController>().userInfo['data']['doctorId']['contact']}')),
                                //     child: const Text('Call'))
                              ],
                            ),
                          ),
                        );
            }));
  }
}
