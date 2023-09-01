import 'package:bp_treat/module/consult/controller/add_health_profile_controller.dart';
import 'package:bp_treat/widget/common_elevated_button.dart';
import 'package:bp_treat/module/doctor/controller/doctor_controller.dart';
import 'package:bp_treat/utils/app_theme.dart';
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
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          Scaffold(
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
              backgroundColor: kWhiteColor,
              body: GetBuilder<DoctorController>(
                  init: DoctorController(),
                  builder: (controller) {
                    return Container(
                      padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            'Choose your Doctor',
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                           //  fontSize: 25.sp,

                                color: const Color.fromRGBO(193, 65, 66, 1)
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'This doctor will have access to your record. '
                                'Contact them for a virtual visit',
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                fontWeight: FontWeight.normal,
                               // fontSize: 12.sp,
                                color: kBlackColor
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Center(
                            child: Text("Available Doctors for zip code ${Get.find<AddHealthController>().addConsent?.consent?.zipcode}",
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: kBlackColor
                            ),
                            ),
                          ),
SizedBox(
  height: 20.h,
),
                          controller.listOfDoctor.isEmpty? const Center(child: CircularProgressIndicator()):
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: controller.listOfDoctor.length,
                              itemBuilder: (context, index) {
                                return buildDoctorListTile(
                                  docName:
                                      '${controller.listOfDoctor[index].fname} ${controller.listOfDoctor[index].lname}',
                                  docZipCode:
                                      "${controller.listOfDoctor[index].zipcode}",
                                  onTap: () {
                                    setState(() {
                                      isSelected = index;
                                      controller.docID =
                                          controller.listOfDoctor[index].sId;
                                      controller.role =
                                          controller.listOfDoctor[index].role;
                                      controller.docName =
                                          "${controller.listOfDoctor[index].fname} ${controller.listOfDoctor[index].lname}";
                                      controller.docContact = controller.listOfDoctor[index].contact??"2814814236";

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
                            Center(
                              child: Container(
                                alignment: Alignment.bottomCenter,
                                 width: 200.w,
                                 child: CommonElevatedButton(
                                     onTap: ()  async {

                                   Get.to(()=> const DoctorVirtualVisit(),
                                   arguments: [controller.docName??'Dr. Steven Goldstein',controller.docContact??'2814814236'],
                                   );
                                     },
                                     title: "Continue",
                                     backgroundColor: kPrimaryColor,
                                     textColor: kWhiteColor),
                               ),
                            )
                        ],
                      ),
                    );
                  }))

    );
  }

  buildDoctorListTile({
    String? docName,
    String? docZipCode,
    required Function() onTap,
    required bool isSelected,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border.all(color: isSelected ? Colors.red : Colors.grey,),
        borderRadius: const BorderRadius.all(Radius.circular(12))
      ),

      child: ListTile(
        contentPadding:
        const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        onTap: onTap,
        leading: CircleAvatar(
          radius: 40,
          backgroundColor: kSecondaryColor,
          child: Text(
            docName!.substring(0,3)=="Dr."?docName![4]:docName![0],
            style: TextStyle(color: isSelected ? kPrimaryColor : kBlackColor),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(docName,
              style: TextStyle(
                  color:
                kBlackColor,
                fontSize: 16
              )),
        ),
        subtitle:
            Text(
              'Zip code: ${docZipCode!="null"?docZipCode:"12345"}',

              style: TextStyle(
                color: kBlackColor,

                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),


      ),
    );
  }
}
