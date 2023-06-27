import 'package:bp_treat/module/dashboard/controller/landing_controller.dart';
import 'package:bp_treat/utils/app_theme.dart';
import 'package:bp_treat/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/contact_controller.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('How can we help? '),
          elevation: 0.0,
          backgroundColor: kPrimaryColor,
          centerTitle: false,
          leading: Padding(
            padding: const EdgeInsets.all(6.0),
            child: CircleAvatar(
              backgroundColor: kWhiteColor,
              child: const Text('BP'),
            ),
          ),
        ),
        body: GetBuilder<ContactController>(
            init: ContactController(),
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
                      padding: const EdgeInsets.all(12),
                      child: controller.listOfMedicine.isEmpty
                          ? const Center(
                              child: Text('No Prescription to update'))
                          : SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.changePrescription.data?.title ??
                                        "",
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                  const SizedBox(height: 10),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Select Medicines you want to update.',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Column(
                                    children: controller.listOfMedicine
                                        .map<Widget>(
                                          (item) => Container(
                                            padding: const EdgeInsets.all(2),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 2),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                    color: controller
                                                            .selectedMedicines
                                                            .isEmpty
                                                        ? Colors.grey
                                                        : kPrimaryColor!)),
                                            child: CheckboxListTile(
                                              value: controller
                                                  .selectedMedicines
                                                  .contains(item.name),
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                              onChanged: (bool? isSelect) {
                                                controller.onMedSelect(
                                                    item.name,
                                                    isSelect ?? false);
                                              },
                                              title: Text(item.name ?? ""),
                                              activeColor: kPrimaryColor,
                                              checkColor: kWhiteColor,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  const SizedBox(height: 10),
                                  const Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'What problem are you having?',
                                        style: TextStyle(fontSize: 12),
                                      )),
                                  const SizedBox(height: 10),
                                  TextField(
                                    controller: controller.otherIssueController,
                                    onChanged: (value) {},
                                    maxLines: 5,
                                    maxLength: 200,
                                    cursorColor: kBlackColor,
                                    decoration: InputDecoration(
                                        enabled: true,
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            borderSide: BorderSide(
                                                color: kPrimaryColor!)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            borderSide: BorderSide(
                                                color: kPrimaryColor!))),
                                  ),
                                  ValueListenableBuilder<TextEditingValue>(
                                      valueListenable:
                                          controller.otherIssueController,
                                      builder: (context, value, child) {
                                        return
                                            // const SizedBox(height: 10),
                                            ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: kPrimaryColor,
                                          ),
                                          onPressed: controller
                                                      .selectedMedicines
                                                      .isNotEmpty ||
                                                  controller
                                                      .otherIssueController
                                                      .text
                                                      .isNotEmpty
                                              ? () async => await controller
                                                  .sendMedicineForChange(
                                                      controller
                                                              .prescriptionID ??
                                                          "")
                                              : null,
                                          child: const Text('Submit Request'),
                                        );
                                      }),
                                  const SizedBox(height: 10),
                                  RichText(
                                    text: TextSpan(
                                        text: 'or connect with ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(),
                                        children: [
                                          TextSpan(
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1!
                                                  .copyWith(
                                                      color: kPrimaryColor,
                                                      fontSize: 15),
                                              text:
                                                  "{Get.find<LandingController>().userData?.data?.doctorId?.fname} {Get.find<LandingController>().userData?.data?.doctorId?.lname}")
                                        ]),
                                  ),
                                  const SizedBox(height: 5),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: kPrimaryColor,
                                      ),
                                      onPressed: () => controller.makePhoneCall(
                                          Uri.parse(
                                              'tel:{Get.find<LandingController>().userData?.data?.doctorId?.contact}')),
                                      child: const Text('Call'))
                                ],
                              ),
                            ),
                    );
            }));
  }
}
