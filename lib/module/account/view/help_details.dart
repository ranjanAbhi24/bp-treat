import 'package:bp_treat/module/account/controller/faq_controller.dart';
import 'package:bp_treat/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Get.back(),
          ),
          title: Text(
            "Help",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: GetBuilder<FAQController>(
            init: FAQController(),
            builder: (controller) {
              return controller.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xFFDF1721)),
                      ),
                    )
                  : Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.faq?.data?[0].description ?? "",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          const SizedBox(height: 10),
                          Divider(color: Colors.black.withOpacity(0.4)),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Text(
                              "FAQs",
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: ListView.builder(
                                itemCount: controller.faq?.data?.length,
                                itemBuilder: (context, index) {
                                  return controller.faq?.data?[index].title ==
                                          ''
                                      ? Container()
                                      : buildRowTile(
                                          title: controller
                                                  .faq?.data?[index].title ??
                                              "",
                                          discription: controller
                                                  .faq?.data?[index].body ??
                                              "",
                                        );
                                }),
                          ),
                        ],
                      ),
                    );
            }),
      ),
    );
  }

  buildRowTile({
    required String title,
    required String discription,
  }) {
    return ListTileTheme(
      dense: true,
      contentPadding: const EdgeInsets.all(0),
      child: ExpansionTile(
        controlAffinity: ListTileControlAffinity.trailing,
        collapsedIconColor: kPrimaryColor,
        iconColor: kPrimaryColor,
        maintainState: true,
        childrenPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black.withOpacity(0.6),
            fontSize: 14,
          ),
        ),
        children: [
          Text(
            discription,
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black.withOpacity(0.4),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
