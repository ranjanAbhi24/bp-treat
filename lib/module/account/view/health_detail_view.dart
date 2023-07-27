import 'package:bp_treat/module/account/controller/health_detail_controller.dart';
import 'package:bp_treat/module/auth/widget/common_elevated_button.dart';
import 'package:bp_treat/module/auth/widget/input_textfield.dart';
import 'package:bp_treat/module/consult/widget/Drop_down_form_field.dart';
import 'package:bp_treat/module/dashboard/widget/common_dropdown.dart';
import 'package:bp_treat/utils/app_theme.dart';
import 'package:bp_treat/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HealthDetailView extends StatelessWidget {
  const HealthDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Get.back()),
        title: const Text(
          "Health Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GetBuilder<HealthDetailController>(
          init: HealthDetailController(),
          builder: (controller) {
            return controller.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFFDF1721)),
                    ),
                  )
                : Container(
                    height: 690.h,
                    width: 360.w,
                    color: Colors.white,
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics()),
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text('Diabetes',
                            // style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            //   color: kBlackColor
                            // ),
                            // ),
                            // SizedBox(height: 10.h,),
                            // Container(
                            //   padding: const EdgeInsets.only(left: 10,right: 10),
                            //   decoration: BoxDecoration(
                            //       border: Border.all(color: Colors.black),
                            //       borderRadius: BorderRadius.circular(12),
                            //   ),
                            //   child: DropDownWidget(
                            //       dropdownValue: controller.isDiabetic == true ? "Yes" : "No",
                            //       items: controller.listOfOption,
                            //       onChange:controller.onDiabetes ),
                            // ),
                            DropDownFormField(
                              title: '',
                              text: 'Diabetes*',
                              value:
                                  controller.isDiabetic == true ? "Yes" : "No",
                              isEmpty: true,
                              items:
                                  controller.listOfOption.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChange: controller.onDiabetes,
                            ),
                            SizedBox(height: 10.h),
                            InputTextField(
                                hintText: 'Enter disease separating with ";"',
                                inputType: TextInputType.text,
                                controller: controller.otherDiseaseController,
                                validator: (value) {},
                                text: "Other Diseases"),
                            SizedBox(height: 10.h),
                            InputTextField(
                                hintText: 'Medication detail',
                                inputType: TextInputType.text,
                                controller: controller.medicationController,
                                validator: (value) {},
                                text: "Medications"),
                           SizedBox(height: 10.h),
                            InputTextField(
                                hintText: 'Allergies details',
                                inputType: TextInputType.text,
                                controller: controller.allergiesController,
                                validator: (value) {},
                                text: "Allergies"),
                        SizedBox(height: 10.h),
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: InputTextField(
                            //           hintText: '00',
                            //           inputType: TextInputType.number,
                            //           controller:
                            //               controller.hematocritController,
                            //           validator: (value) {
                            //             if (value.isEmpty) {
                            //               return 'Required*';
                            //             } else {
                            //               return null;
                            //             }
                            //           },
                            //           text: "Hematocrit"),
                            //     ),
                            //     const SizedBox(width: 10),
                            //     Expanded(
                            //       child: InputTextField(
                            //           hintText: '00',
                            //           inputType: TextInputType.number,
                            //           controller:
                            //               controller.creatinineController,
                            //           validator: (value) {
                            //             if (value.isEmpty) {
                            //               return 'Required*';
                            //             } else {
                            //               return null;
                            //             }
                            //           },
                            //           text: "Creatinine"),
                            //     ),
                            //   ],
                            // ),
                          //  const SizedBox(height: 10),
                            // Row(
                            //   children: [
                            //     Expanded(
                            //       child: InputTextField(
                            //           hintText: '00',
                            //           inputType: TextInputType.number,
                            //           controller: controller.calciumController,
                            //           validator: (value) {
                            //             if (value.isEmpty) {
                            //               return 'Required*';
                            //             } else {
                            //               return null;
                            //             }
                            //           },
                            //           text: "Calcium"),
                            //     ),
                            //     const SizedBox(width: 10),
                            //     Expanded(
                            //       child: InputTextField(
                            //           hintText: '00',
                            //           inputType: TextInputType.number,
                            //           controller: controller.albuminController,
                            //           validator: (value) {
                            //             if (value.isEmpty) {
                            //               return 'Required*';
                            //             } else {
                            //               return null;
                            //             }
                            //           },
                            //           text: "Albumin"),
                            //     ),
                            //   ],
                            // ),
                          //  const SizedBox(height: 10),
                          //   Text('Narcotics',
                          //     style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          //         color: kBlackColor
                          //     ),
                          //   ),
                          //   SizedBox(height: 10.h),
                          //   Container(
                          //     padding: const EdgeInsets.only(left: 10,right: 10),
                          //     decoration: BoxDecoration(
                          //       border: Border.all(color: Colors.black),
                          //       borderRadius: BorderRadius.circular(12),
                          //     ),
                          //     child: DropDownWidget(
                          //         dropdownValue: controller.isNarcotics == true
                          //                 ? "Yes"
                          //                 : "No",
                          //         items: controller.listOfOption, onChange:
                          //     controller.onNarcotics,
                          //     ),
                          //   ),
                            DropDownFormField(
                              title: '',
                              text: 'Narcotics?',
                              value: controller.isNarcotics == true
                                  ? "Yes"
                                  : "No",
                              isEmpty: true,
                              items: controller.listOfOption
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChange: controller.onNarcotics,
                            ),
                             SizedBox(height: 10.h),
                            Row(
                              children: [
                                Expanded(
                                    child:
                                    DropDownFormField(
                                  title: '',
                                  text: 'Tobacco?',
                                  value: controller.isTabacoo == true
                                      ? 'Yes'
                                      : 'No',
                                  isEmpty: true,
                                  items: controller.listOfOption
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChange: controller.onSmoke,
                                )
                                ),
                                 SizedBox(width: 10.h),
                                Expanded(
                                    child: DropDownFormField(
                                  title: '',
                                  text: 'Marijuana?',
                                  value: controller.isMarijuana == true
                                      ? "Yes"
                                      : "No",
                                  isEmpty: true,
                                  items: controller.listOfOption
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChange: controller.onWeed,
                                )),
                              ],
                            ),
                             SizedBox(height: 10.h),
                            DropDownFormField(
                              title: '',
                              text: 'Alcohol?',
                              value: controller.alcoholic ?? '0/day',
                              isEmpty: false,
                              items:
                                  controller.alcoholOption.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChange: controller.onAlcoholicChange,
                            ),
                            SizedBox(height: 20.h),
                            DropDownFormField(
                              title: '',
                              text: 'Amphetamine?',
                              value: controller.isAmphetamine == true
                                  ? "Yes"
                                  : "No",
                              isEmpty: true,
                              items: controller.listOfOption
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChange: controller.onAmphetamine,
                            ),
                           const SizedBox(height: 20),
                            Center(
                              child: SizedBox(
                                width: 200.w,
                                child: CommonElevatedButton(
                                    onTap: () async {
                                      if (controller.formKey.currentState!
                                          .validate()) {
                                        await EasyLoading.show();
                                        await controller.updateHealthDetails();
                                        await EasyLoading.dismiss();
                                      }
                                    },
                                    title: 'Update',
                                  backgroundColor: kPrimaryColor,
                                  textColor: kWhiteColor,
                                ),
                              ),
                            ),
                           SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                    ),
                  );
          }),
    );
  }
}
