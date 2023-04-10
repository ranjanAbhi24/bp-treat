import 'package:bp_treat/module/auth/widget/common_elevated_button.dart';
import 'package:bp_treat/module/auth/widget/input_textfield.dart';
import 'package:bp_treat/module/consult/controller/consent_controller.dart';
import 'package:bp_treat/module/consult/view/fourth_consent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../widget/Drop_down_form_field.dart';

class ThirdConsentForm extends StatelessWidget {
  const ThirdConsentForm({super.key});

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
            return Container(
              color: Colors.white,
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Blood Tests',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Steps  3/4',
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  InputTextField(
                      controller: controller.tshController,
                      inputType: TextInputType.number,
                      validator: (value) {},
                      text: 'Thyroid stimulating hormone'),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Flexible(
                        child: InputTextField(
                            inputType: TextInputType.number,
                            controller: controller.hematocritController,
                            validator: (value) {},
                            text: "Hematocrit"),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: InputTextField(
                            inputType: TextInputType.number,
                            controller: controller.creatinineController,
                            validator: (value) {},
                            text: "Creatinine"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Flexible(
                        child: InputTextField(
                            inputType: TextInputType.number,
                            controller: controller.calciumController,
                            validator: (value) {},
                            text: "Calcium"),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: InputTextField(
                            inputType: TextInputType.number,
                            controller: controller.albuminController,
                            validator: (value) {},
                            text: "Albumin"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Spacer(),
                  CommonElevatedButton(
                      onTap: () {
                        Get.to(() => FourthConsent());
                      },
                      title: 'Continue'),
                  const SizedBox(height: 20),
                ],
              ),
            );
          }),
    ));
  }
}
