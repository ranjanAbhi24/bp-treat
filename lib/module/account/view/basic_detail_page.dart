import 'package:bp_treat/module/account/controller/basic_detail_controller.dart';
import 'package:bp_treat/module/auth/widget/input_textfield.dart';
import 'package:bp_treat/utils/app_theme.dart';

import 'package:bp_treat/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';

class EditBasicDetails extends StatelessWidget {
  const EditBasicDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            "Login",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GetBuilder<BasicDetailController>(
              init: BasicDetailController(),
              builder: (controller) {
                return controller.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Color(0xFFDF1721)),
                        ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(height: 20.0),
                            Form(
                              key: controller.formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InputTextField(
                                      controller: controller.nameController,
                                      inputType: TextInputType.name,
                                      readOnly: true,
                                      validator: (value) {
                                        if (value == null) {
                                          return "Required*";
                                        } else {
                                          return null;
                                        }
                                      },
                                      text: 'Name*'),
                                  const SizedBox(height: 10),
                                  InputTextField(
                                      controller: controller.emailController,
                                      inputType: TextInputType.emailAddress,
                                      readOnly: true,
                                      validator: (value) {
                                        if (value == null) {
                                          return "Required*";
                                        } else if (!GetUtils.isEmail(value)) {
                                          return 'Please enter a valid email';
                                        } else {
                                          return null;
                                        }
                                      },
                                      text: 'Email*'),
                                  const SizedBox(height: 10),
                                  InputTextField(
                                      inputType: TextInputType.number,
                                      controller:
                                          controller.mobileNumberController,
                                      readOnly: true,
                                      validator: (value) {
                                        if (value == null) {
                                          return "Required*";
                                        } else if (value > 10 || value < 10) {
                                          return "Enter a valid mobile number";
                                        } else {
                                          return null;
                                        }
                                      },
                                      text: 'Mobile*'),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: InputTextField(
                                            controller:
                                                controller.stateController,
                                            inputType: TextInputType.text,
                                            readOnly: true,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Required*";
                                              } else {
                                                return null;
                                              }
                                            },
                                            text: 'State'),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: InputTextField(
                                            controller:
                                                controller.zipCodeController,
                                            inputType: TextInputType.number,
                                            readOnly: true,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Required*";
                                              } else if (value < 5 ||
                                                  value > 6) {
                                                return 'Enter correct zipcode';
                                              } else {
                                                return null;
                                              }
                                            },
                                            text: 'Zip'),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: InputTextField(
                                            controller:
                                                controller.dobController,
                                            // onPressed: () =>
                                            //     controller.selectDOB(context),
                                            readOnly: true,
                                            validator: (value) {},
                                            text: 'DOB'),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: InputTextField(
                                            readOnly: true,
                                            controller:
                                                controller.genderController,
                                            validator: (value) {},
                                            text: 'Gender'),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: InputTextField(
                                            controller:
                                                controller.heightController,
                                            inputType: TextInputType.number,
                                            readOnly: true,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Required*";
                                              } else {
                                                return null;
                                              }
                                            },
                                            text: 'Height(in inches)'),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: InputTextField(
                                            controller:
                                                controller.weightController,
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            inputType: TextInputType.number,
                                            readOnly: false,
                                            validator: (value) {
                                              if (value == null) {
                                                return "Required*";
                                              } else {
                                                return null;
                                              }
                                            },
                                            text: 'Weight(in pounds)'),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  InputTextField(
                                      hintText: '00:00',
                                      controller: controller.timeController,
                                      onPressed: () =>
                                          controller.showTime(context),
                                      readOnly: true,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Required*';
                                        } else {
                                          return null;
                                        }
                                      },
                                      text: "Preferred Notification Time"),
                                  const SizedBox(height: 10),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          backgroundColor: kPrimaryColor,
                                          fixedSize: const Size(200, 50)),
                                      onPressed: () async {
                                        await EasyLoading.show();
                                        await controller.updateDetail();
                                        await EasyLoading.dismiss();
                                      },
                                      child: const Text(
                                        'Update',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
