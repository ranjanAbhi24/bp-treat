import 'package:bp_treat/module/auth/widget/common_elevated_button.dart';
import 'package:bp_treat/module/consult/view/doctor_consultation.dart';
import 'package:bp_treat/module/dashboard/controller/landing_controller.dart';
import 'package:bp_treat/module/doctor/controller/doctor_controller.dart';
import 'package:bp_treat/utils/app_theme.dart';
import 'package:bp_treat/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'doctor_virtual_visit.dart';

class DoctorSelectionScreen extends StatefulWidget {
  const DoctorSelectionScreen({super.key});

  @override
  State<DoctorSelectionScreen> createState() => _DoctorSelectionScreenState();
}

class _DoctorSelectionScreenState extends State<DoctorSelectionScreen> {
  int isSelected = -1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          Scaffold(
              // appBar: AppBar(
              //   backgroundColor: kWhiteColor,
              //   elevation: 0.0,
              //   leading: Icon(
              //     Icons.arrow_back,
              //     color: kBlackColor,
              //   ),
              // ),
              backgroundColor: kWhiteColor,
              body: GetBuilder<DoctorController>(
                  init: DoctorController(),
                  builder: (controller) {
                    return Container(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [

                          Image.asset(
                            "assets/images/app_icon2.png",
                              height: 90.h,
                              width: 100.w
                          ),
                          Text(
                            'Choose your Doctor',
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 20.h,
                            ),
                          ),
                          Text(
                            'This doctor will have access to your record '
                                'and you may contact them for a virtual visit',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline4!.copyWith(

                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                                color: kBlackColor?.withOpacity(0.8)
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Text("Available doctors for zip code 7701}",
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: kBlackColor
                          ),
                          ),
SizedBox(
  height: 20.h,
),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: controller.listOfDoctor.length,
                              itemBuilder: (context, index) {
                                return buildDoctorListTile(
                                  docName:
                                      '${controller.listOfDoctor[index].fname} ${controller.listOfDoctor[index].lname}',
                                  docAddress:
                                      controller.listOfDoctor[index].zipcode??"not available",
                                  onTap: () {
                                    setState(() {
                                      isSelected = index;
                                      controller.docID =
                                          controller.listOfDoctor[index].sId;
                                      controller.role =
                                          controller.listOfDoctor[index].role;
                                      controller.docName =
                                          "${controller.listOfDoctor[index].fname} ${controller.listOfDoctor[index].lname}";
                                      controller.docContact = controller.listOfDoctor[index].contact??"XXX-XXX-XXXX";
                                      print(controller.docContact);
                                    });
                                  },
                                  isSelected: isSelected == index,
                                );
                              },
                            ),
                          ),
                           SizedBox(
                             height: 20.h,
                           ),
                            Container(
                              alignment: Alignment.bottomCenter,
                               width: 200.w,
                               child: CommonElevatedButton(
                                   onTap: ()  async {
                                     print("docId-${controller.docID}");
                                     print("role-${controller.role}");
                                     print("contact-${controller.docContact}");
                                 Get.to(()=> const DoctorVirtualVisit(),
                                 arguments: [controller.docName,controller.docContact],
                                 );

                                   },
                                   title: "Continue",
                                   backgroundColor: kPrimaryColor,
                                   textColor: kWhiteColor),
                             )
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   children: [
                          //     Expanded(
                          //         flex: 2,
                          //         child: CommonElevatedButton(
                          //             onTap: () async {
                          //               await controller.selectDoc(
                          //                   doctorID: controller.docID ??
                          //                       "62b577b25729c44144144bde",
                          //                   docRole: controller.role ?? "Admin");
                          //             },
                          //             title: 'Submit',
                          //           backgroundColor: kPrimaryColor,
                          //           textColor: kWhiteColor,)),
                          //     const SizedBox(width: 10),
                          //     // Expanded(
                          //     //   flex: 1,
                          //     //   child: ElevatedButton(
                          //     //     onPressed: () {
                          //     //       Get.to(() => const DoctorConsultationConsent());
                          //     //       // await controller.selectDoc(
                          //     //       //     doctorID: "62b577b25729c44144144bde",
                          //     //       //     docRole: "Admin");
                          //     //     },
                          //     //     style: ElevatedButton.styleFrom(
                          //     //       elevation: 0.0,
                          //     //       shape: RoundedRectangleBorder(
                          //     //           borderRadius: const BorderRadius.all(
                          //     //               Radius.circular(12)),
                          //     //           side: BorderSide(color: kPrimaryColor!)),
                          //     //       backgroundColor: Colors.white,
                          //     //       fixedSize: Size(
                          //     //         size.width,
                          //     //         50,
                          //     //       ),
                          //     //     ),
                          //     //     child: Text(
                          //     //       'Skip',
                          //     //       style: TextStyle(color: kBlackColor),
                          //     //     ),
                          //     //   ),
                          //     // ),
                          //   ],
                          // )
                        ],
                      ),
                    );
                  }))

    );
  }

  buildDoctorListTile({
    String? docName,
    String? docAddress,
    required Function() onTap,
    required bool isSelected,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border.all(color: isSelected ? Colors.red : Colors.grey,),
        borderRadius: const BorderRadius.all(Radius.circular(12))
      ),
     // color: isSelected ? kPrimaryColor : kWhiteColor,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        onTap: onTap,
        leading: CircleAvatar(
          radius: 40,
          backgroundColor: kSecondaryColor,
          child: Text(
            docName?[4] ?? "D",
            style: TextStyle(color: isSelected ? kPrimaryColor : kBlackColor),
          ),
        ),
        title: Text("$docName",
            style: TextStyle(
                color:
                //isSelected ? kWhiteColor : kBlackColor, fontSize: 16
              kBlackColor,
              fontSize: 16
            )),
        subtitle:
            Text(
              'Zip code: $docAddress',

              style: TextStyle(
                color: kBlackColor,
                //isSelected ? kWhiteColor : kBlackColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            // const SizedBox(height: 8),
            // Text('35 Richardson Street Dallas, TX 75211',
            //     style: TextStyle(
            //       color: isSelected ? kWhiteColor : kBlackColor,
            //       fontSize: 12,
            //       fontWeight: FontWeight.w400,
            //     )),

      ),
    );
  }
}
