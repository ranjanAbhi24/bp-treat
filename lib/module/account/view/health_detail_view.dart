import 'package:bp_treat/module/account/controller/health_detail_controller.dart';
import 'package:bp_treat/module/auth/widget/common_elevated_button.dart';
import 'package:bp_treat/module/auth/widget/input_textfield.dart';
import 'package:bp_treat/module/consult/widget/Drop_down_form_field.dart';
import 'package:bp_treat/utils/app_theme.dart';
import 'package:bp_treat/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
                    height: size.height,
                    width: size.width,
                    color: Colors.white,
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics()),
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
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
                            const SizedBox(height: 10),
                            InputTextField(
                                hintText: 'Enter disease separating with ";"',
                                inputType: TextInputType.text,
                                controller: controller.otherDiseaseController,
                                validator: (value) {},
                                text: "Other Diseases"),
                            const SizedBox(height: 10),
                            InputTextField(
                                hintText: 'Medication detail',
                                inputType: TextInputType.text,
                                controller: controller.medicationController,
                                validator: (value) {},
                                text: "Medications"),
                            const SizedBox(height: 10),
                            InputTextField(
                                hintText: 'Allergies details',
                                inputType: TextInputType.text,
                                controller: controller.allergiesController,
                                validator: (value) {},
                                text: "Allergies"),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: InputTextField(
                                      hintText: '00',
                                      inputType: TextInputType.number,
                                      controller:
                                          controller.hematocritController,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Required*';
                                        } else {
                                          return null;
                                        }
                                      },
                                      text: "Hematocrit"),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: InputTextField(
                                      hintText: '00',
                                      inputType: TextInputType.number,
                                      controller:
                                          controller.creatinineController,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Required*';
                                        } else {
                                          return null;
                                        }
                                      },
                                      text: "Creatinine"),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: InputTextField(
                                      hintText: '00',
                                      inputType: TextInputType.number,
                                      controller: controller.calciumController,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Required*';
                                        } else {
                                          return null;
                                        }
                                      },
                                      text: "Calcium"),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: InputTextField(
                                      hintText: '00',
                                      inputType: TextInputType.number,
                                      controller: controller.albuminController,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Required*';
                                        } else {
                                          return null;
                                        }
                                      },
                                      text: "Albumin"),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: InputTextField(
                                      hintText: '00',
                                      inputType: TextInputType.number,
                                      controller: controller.tshController,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Required*';
                                        } else {
                                          return null;
                                        }
                                      },
                                      text: "TSH"),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: DropDownFormField(
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
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                    child: DropDownFormField(
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
                                )),
                                const SizedBox(width: 10),
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
                            const SizedBox(height: 10),
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
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: DropDownFormField(
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
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                    child: DropDownFormField(
                                  title: '',
                                  text: 'Heroin?',
                                  value: controller.isHeroin == true
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
                                  onChange: controller.onHeroin,
                                )),
                              ],
                            ),
                            const SizedBox(height: 20),
                            CommonElevatedButton(
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
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  );
          }),
    );
  }
}
