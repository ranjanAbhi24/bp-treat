import 'package:bp_treat/module/auth/widget/common_elevated_button.dart';
import 'package:bp_treat/module/auth/widget/input_textfield.dart';
import 'package:bp_treat/module/consult/controller/consent_controller.dart';
import 'package:bp_treat/module/consult/view/second_concent_form.dart';
import 'package:bp_treat/module/consult/widget/Drop_down_form_field.dart';
import 'package:bp_treat/module/dashboard/view/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class FirstConsentForm extends StatelessWidget {
  const FirstConsentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.off(() => const LandingPage());
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: GetBuilder<ConsentController>(
          init: ConsentController(),
          builder: (controller) {
            return Container(
              color: Colors.white,
              padding: const EdgeInsets.all(12),
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your Profile',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      'Blood tests are needed before continuing. Obtain from your doctor or go to linktolabs',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const SizedBox(height: 20),
                    Text('Steps  1/4',
                        style: Theme.of(context).textTheme.headline2?.copyWith(
                              fontSize: 14,
                            )),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: InputTextField(
                              controller: controller.dobController,
                              onPressed: () => controller.selectDOB(context),
                              readOnly: true,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Required*';
                                } else {
                                  return null;
                                }
                              },
                              text: "DOB"),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                            child: DropDownFormField(
                          title: '',
                          text: 'Gender',
                          value: controller.genderValue ?? "Please Select",
                          isEmpty: true,
                          items: controller.gender.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChange: controller.onGenderChange,
                        )),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: InputTextField(
                              controller: controller.heightController,
                              inputType: const TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Required*';
                                } else {
                                  return null;
                                }
                              },
                              text: "Height (in inches)"),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: InputTextField(
                              controller: controller.weightController,
                              inputType: const TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Required*';
                                } else {
                                  return null;
                                }
                              },
                              text: "Weight (in Pounds)"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    InputTextField(
                      text: "Phone*",
                      controller: controller.phoneController,
                      inputType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required*';
                        } else if (value.length != 10) {
                          return 'Mobile number must be 10 digit';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InputTextField(
                                  text: "State*",
                                  controller: controller.stateController,
                                  inputType: TextInputType.text,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Required*';
                                    } else if (GetUtils.isNum(value)) {
                                      return 'Please enter correct state name';
                                    } else {
                                      return null;
                                    }
                                  })
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InputTextField(
                                text: "Zip*",
                                controller: controller.zipController,
                                inputType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Required*';
                                  } else if (value.length != 5) {
                                    return 'Zip code must be 5 digit';
                                  } else if (!GetUtils.isNum(value)) {
                                    return 'Please enter correct zipcode';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    CommonElevatedButton(
                        onTap: () {
                          var isValid =
                              controller.formKey.currentState!.validate();
                          if (isValid) {
                            Get.to(() => const SecondConsentForm());
                          }
                        },
                        title: 'Continue'),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          }),
    ));
  }
}
