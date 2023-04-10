import 'package:bp_treat/module/consult/controller/consent_controller.dart';
import 'package:bp_treat/module/dashboard/controller/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../auth/widget/common_elevated_button.dart';
import '../widget/Drop_down_form_field.dart';

class FourthConsent extends StatelessWidget {
  const FourthConsent({super.key});

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
                  return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(12),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Habits',
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Steps  4/4',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      ?.copyWith(fontSize: 14),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                        child: DropDownFormField(
                                      title: '',
                                      text: 'Tobacco?',
                                      value: controller.smoker ?? "No",
                                      isEmpty: true,
                                      items: controller.userValue
                                          .map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChange: controller.onSmoking,
                                    )),
                                    const SizedBox(width: 10),
                                    Expanded(
                                        child: DropDownFormField(
                                      title: '',
                                      text: 'Marijuana?',
                                      value: controller.weedUser ?? "No",
                                      isEmpty: true,
                                      items: controller.userValue
                                          .map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChange: controller.isWeed,
                                    )),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Expanded(
                                      child: DropDownFormField(
                                        title: '',
                                        text: 'Amphetamine?',
                                        value: controller.amphetamine ?? "No",
                                        isEmpty: true,
                                        items: controller.userValue
                                            .map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        onChange: controller.isAmphetamin,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                        child: DropDownFormField(
                                      title: '',
                                      text: 'Narcotics?',
                                      value: controller.narcotics ?? "No",
                                      isEmpty: true,
                                      items: controller.userValue
                                          .map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChange: controller.isNarcotic,
                                    )),
                                    const SizedBox(width: 10),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                DropDownFormField(
                                  title: '',
                                  text: 'Heroin?',
                                  value: controller.heroine ?? "No",
                                  isEmpty: true,
                                  items:
                                      controller.userValue.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChange: controller.onHeroine,
                                ),
                                const SizedBox(height: 10),
                                DropDownFormField(
                                  title: '',
                                  text: 'Alcohol?',
                                  value: controller.alcoholic ?? '',
                                  isEmpty: true,
                                  items: controller.alcoholOption
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChange: controller.onAlcoholicChange,
                                ),
                                const Spacer(),
                                CommonElevatedButton(
                                    onTap: () async {
                                      await EasyLoading.show();
                                      await controller.postConsent();
                                      await EasyLoading.dismiss();
                                    },
                                    title: 'Finish'),
                                const SizedBox(height: 20),
                              ])));
                })));
  }
}
