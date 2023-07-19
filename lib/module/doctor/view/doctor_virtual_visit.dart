import 'package:bp_treat/module/auth/widget/common_elevated_button.dart';
import 'package:bp_treat/module/doctor/controller/doctor_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_theme.dart';


class DoctorVirtualVisit extends StatelessWidget {
  const DoctorVirtualVisit({super.key});

  @override
  Widget build(BuildContext context) {
    var arguments= Get.arguments;
    return SafeArea(
        child: Scaffold(
          body: GetBuilder<DoctorController>(
            init: DoctorController(),
            builder: (controller){
              return Container(
                padding: const EdgeInsets.all(30),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                            "assets/images/app_icon2.png",
                            height: 90.h,
                            width: 100.w
                        ),
                      ),
                      Center(
                        child: Text(
                          'Initiate Virtual Visit',
                          style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 20.h,
                          ),
                        ),
                      ),
                      Text(
                        'To be able to receive treatment, you must call '
                            'your doctor to schedule a virtual visit',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                            color: kBlackColor?.withOpacity(0.8)
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color:  Colors.grey,),
                            borderRadius: const BorderRadius.all(Radius.circular(12))
                        ),
                        child: ListTile(
                          contentPadding:
                          const EdgeInsets.symmetric(vertical: 15, horizontal: 15),

                          leading: CircleAvatar(
                            radius: 40,
                            backgroundColor: kSecondaryColor,
                            child: Text(
                              " ${arguments[0]?[4]}",

                              style: TextStyle(color: kBlackColor),
                            ),
                          ),
                          title: Text("${arguments[0]}",
                              style: TextStyle(
                                  color:
                                  //isSelected ? kWhiteColor : kBlackColor, fontSize: 16
                                  kBlackColor,
                                  fontSize: 16
                              )),
                          subtitle:
                          Text(
                            'Call: ${arguments[1]}',

                            style: TextStyle(
                              color: kBlackColor,
                              //isSelected ? kWhiteColor : kBlackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text("During the visit, the doctor will",

                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 260.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children:  [
                                const Text("\u2022   "),
                                SizedBox(
                                  width: 240.w,
                                  child: Text(
                                      "Confirm that you know how to take your blood pressure correctly",
                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                          color: Colors.black
                                      )),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(

                              children:  [
                                const Text("\u2022   "),
                                SizedBox(
                                  width: 240.w,
                                  child: Text(
                                      "Order blood tests",
                                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                          color: Colors.black
                                      )),
                                ),

                              ],
                            ),


                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Text("After you call to schedule your appointment, tap the finish button below ",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Center(
                        child: SizedBox(
                          width: 200.w,
                          child: CommonElevatedButton(
                              onTap: () async {
                                await controller.selectDoc(
                                    doctorID: controller.docID ??
                                        "62b577b25729c44144144bde",
                                    docRole: controller.role ?? "Admin");
                              },
                              title: "Finish",
                              backgroundColor: kPrimaryColor,
                              textColor: kWhiteColor),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )
        )
    );
  }
}
