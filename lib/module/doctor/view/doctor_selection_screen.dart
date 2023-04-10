import 'package:bp_treat/module/auth/widget/common_elevated_button.dart';
import 'package:bp_treat/module/consult/view/doctor_consultation.dart';
import 'package:bp_treat/module/doctor/controller/doctor_controller.dart';
import 'package:bp_treat/utils/app_theme.dart';
import 'package:bp_treat/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: kWhiteColor,
            elevation: 0.0,
            leading: Icon(
              Icons.arrow_back,
              color: kBlackColor,
            ),
          ),
          backgroundColor: kWhiteColor,
          body: GetBuilder<DoctorController>(
              init: DoctorController(),
              builder: (controller) {
                return Container(
                  height: size.height,
                  width: size.width,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                        'Choose your preferred Doctor',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      // Text(
                      //   'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
                      //   style: Theme.of(context).textTheme.subtitle1,
                      //   textAlign: TextAlign.center,
                      // ),
                      const SizedBox(height: 30),
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.listOfDoctor.length,
                          itemBuilder: (context, index) {
                            return buildDoctorListTile(
                              docName:
                                  '${controller.listOfDoctor[index].fname} ${controller.listOfDoctor[index].lname}',
                              docAddress:
                                  '${controller.listOfDoctor[index].address}',
                              onTap: () {
                                setState(() {
                                  isSelected = index;
                                  controller.docID =
                                      controller.listOfDoctor[index].sId;
                                  controller.role =
                                      controller.listOfDoctor[index].role;
                                  controller.docName =
                                      "${controller.listOfDoctor[index].fname} ${controller.listOfDoctor[index].lname}";
                                });
                              },
                              isSelected: isSelected == index,
                            );
                          },
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              flex: 2,
                              child: CommonElevatedButton(
                                  onTap: () async {
                                    await controller.selectDoc(
                                        doctorID: controller.docID ??
                                            "62b577b25729c44144144bde",
                                        docRole: controller.role ?? "Admin");
                                  },
                                  title: 'Submit')),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(() => const DoctorConsultationConsent());
                                // await controller.selectDoc(
                                //     doctorID: "62b577b25729c44144144bde",
                                //     docRole: "Admin");
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
                                    side: BorderSide(color: kPrimaryColor!)),
                                backgroundColor: Colors.white,
                                fixedSize: Size(
                                  size.width,
                                  50,
                                ),
                              ),
                              child: Text(
                                'Skip',
                                style: TextStyle(color: kBlackColor),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              })),
    );
  }

  buildDoctorListTile({
    String? docName,
    String? docAddress,
    required Function() onTap,
    required bool isSelected,
  }) {
    return Card(
      color: isSelected ? kPrimaryColor : kWhiteColor,
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
                color: isSelected ? kWhiteColor : kBlackColor, fontSize: 16)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Text(
              '$docAddress',
              style: TextStyle(
                color: isSelected ? kWhiteColor : kBlackColor,
                fontSize: 10,
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
          ],
        ),
      ),
    );
  }
}
