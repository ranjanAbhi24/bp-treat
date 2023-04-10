import 'package:bp_treat/module/auth/widget/common_elevated_button.dart';
import 'package:bp_treat/module/auth/widget/input_textfield.dart';
import 'package:bp_treat/module/consult/controller/consent_controller.dart';
import 'package:bp_treat/module/consult/view/third_consent_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/Drop_down_form_field.dart';

class SecondConsentForm extends StatelessWidget {
  const SecondConsentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
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
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Medical History',
                          style: Theme.of(context).textTheme.headline1),
                      const SizedBox(height: 20),
                      Text(
                        'Steps  2/4',
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(fontSize: 14),
                      ),
                      const SizedBox(height: 20),
                      DropDownFormField(
                        title: '',
                        text: 'Diabetes',
                        value: controller.diabetic ?? "No",
                        isEmpty: true,
                        items: controller.userValue.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChange: controller.isDiabeties,
                      ),
                      const SizedBox(height: 10),
                      InputTextField(
                          controller: controller.otherMedicationController,
                          validator: (value) {},
                          text: "Medications"),
                      const SizedBox(height: 10),
                      InputTextField(
                          controller: controller.allergyController,
                          validator: (value) {},
                          text: "Allergies"),
                      const SizedBox(height: 10),
                      InputTextField(
                          controller: controller.otherDisease,
                          validator: (value) {},
                          text: "Other Diseases"),
                      const SizedBox(height: 20),
                      CommonElevatedButton(
                          onTap: () {
                            Get.to(() => const ThirdConsentForm());
                          },
                          title: 'Continue')
                    ],
                  ),
                ),
              ),
            );
          }),
    ));
  }
}
