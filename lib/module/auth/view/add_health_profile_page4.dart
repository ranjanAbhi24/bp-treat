import 'package:bp_treat/module/auth/controller/add_health_profile_controller.dart';
import 'package:bp_treat/module/auth/widget/option_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/size.dart';

class AddHealthProfilePage4 extends StatefulWidget {
  const AddHealthProfilePage4({super.key});

  @override
  State<AddHealthProfilePage4> createState() => _AddHealthProfilePage4State();
}

class _AddHealthProfilePage4State extends State<AddHealthProfilePage4> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: GetBuilder<AddHealthController>(
          init: AddHealthController(),
          builder: (controller) {
            return SingleChildScrollView(
                child: Container(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.02),
                  Center(
                    child: Image.asset(
                      "assets/images/app_icon2.png",
                      height: size.height * 0.1,
                      width: size.width * 0.4,
                    ),
                  ),
                  Center(
                    child: Text(
                      "Health Profile(4 of 4)",
                      maxLines: 1,
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 29,
                          ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    "Please continue your health profile to get better recommendations.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: kBlackColor?.withOpacity(0.8)),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Text("Which of the following do you smoke?",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: Colors.black)),
                  OptionField(
                      onTap: controller.selectedCheckBox,
                      isChecked: controller.isSelectedTobacco,
                      optionText: "Tabacco"),
                  OptionField(
                      onTap: controller.selectedCheckBox,
                      isChecked: controller.isMarijuana,
                      optionText: "Marijuana"),
                  OptionField(
                      onTap: controller.selectedCheckBox,
                      isChecked: controller.isMarijuana,
                      optionText: "None of these"),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    "Which of the following do you take?",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.black),
                  ),
                  OptionField(
                      onTap: controller.selectedCheckBox,
                      isChecked: controller.isSelectedTobacco,
                      optionText: "Narcotics"),
                  OptionField(
                      onTap: controller.selectedCheckBox,
                      isChecked: controller.isMarijuana,
                      optionText: "Amphetamines"),
                  OptionField(
                      onTap: controller.selectedCheckBox,
                      isChecked: controller.isMarijuana,
                      optionText: "Cocaine"),
                  OptionField(
                      onTap: controller.selectedCheckBox,
                      isChecked: controller.isMarijuana,
                      optionText: "None of these"),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    "Which is the most number of drinks you might have in a day?",
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.black),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12)),
                    child: DropdownButton<String>(
                      elevation: 0,
                      value: controller.dropDownValue,
                      underline: const SizedBox.shrink(),
                      items: controller.dropdownList.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                      onChanged: (value) => controller
                          .onChangeValue(value ?? 'Select a choice..'),
                    ),
                  ),
                ],
              ),
            ));
          }),
    ));
  }
}
