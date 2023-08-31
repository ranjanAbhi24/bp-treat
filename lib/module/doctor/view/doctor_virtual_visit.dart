import 'package:bp_treat/widget/common_elevated_button.dart';
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
          backgroundColor: kWhiteColor,
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
          body: GetBuilder<DoctorController>(
            init: DoctorController(),
            builder: (controller){
              return SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(left: 30,right: 30,bottom: 20),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          'Initiate Virtual Visit',
                          style: Theme.of(context).textTheme.headline1!.copyWith(
                          //  fontSize: 20.h,
                              color: const Color.fromRGBO(193, 65, 66, 1)
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'To be able to receive treatment, you must call '
                              'your doctor to schedule a virtual visit',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontWeight: FontWeight.normal,
                             // fontSize: 12.sp,
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
                            const EdgeInsets.symmetric(vertical: 20, horizontal: 20),

                            leading: CircleAvatar(
                              radius: 40,
                              backgroundColor: kSecondaryColor,
                              child: Text(
                                " ${arguments[0]?[4]}",

                                style: TextStyle(color: kBlackColor),
                              ),
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                //controller.formatPhoneNumber(arguments[0]),
                                  "${arguments[0]}",
                                  style:Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: kBlackColor,
                                      fontWeight: FontWeight.normal
                                  )
                              ),
                            ),
                            subtitle:RichText(
                              text: TextSpan(
                                text: "Call:",
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: kBlackColor,
                                  fontWeight: FontWeight.normal
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '${arguments[1]}',
                                    //text: controller.formatPhoneNumber(arguments[1]),
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                        color: kBlackColor,
                                      fontWeight: FontWeight.bold
                                    )
                                  )
                                ]
                              ),

                            )
                            // Text(
                            //   'Call: ${arguments[1]}',
                            //
                            //   style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            //
                            //   ),
                            //   maxLines: 2,
                            //   overflow: TextOverflow.ellipsis,
                            // ),

                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Text("During the visit, the doctor will",

                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,

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
                                            color: Colors.black,
                                          fontWeight: FontWeight.normal,
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
                                            color: Colors.black,
                                          fontWeight: FontWeight.normal,
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
                              fontWeight: FontWeight.normal
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
                                title: "Continue",
                                backgroundColor: kPrimaryColor,
                                textColor: kWhiteColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        )
    );
  }
}
