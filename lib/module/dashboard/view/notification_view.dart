import 'package:bp_treat/module/dashboard/controller/dashboard_controller.dart';
import 'package:bp_treat/utils/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<DashboardController>(
          init: DashboardController(),
          builder: (controller) {
            return Scaffold(
                backgroundColor: kWhiteColor,
                appBar: AppBar(
                  backgroundColor: kWhiteColor,
                  elevation: 0.0,
                  iconTheme: IconThemeData(color: kBlackColor),
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      controller.badgeStatusFn();
                      Get.back();
                    },
                  ),
                  title: Text(
                    'Notifications',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                body: controller.notificationList!.isEmpty
                    ? const Center(child: Text('No Notification'))
                    : ListView.separated(
                        physics: const AlwaysScrollableScrollPhysics(
                          parent: BouncingScrollPhysics(),
                        ),
                        separatorBuilder: (context, index) => Divider(
                          color: kPrimaryColor,
                        ),
                        itemCount: controller.notificationList?.length ?? 0,
                        padding: const EdgeInsets.all(16),
                        itemBuilder: ((context, index) {
                          return ListTile(
                            title: Text(
                              controller.notificationList?[index].title ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  ?.copyWith(
                                    color: kBlackColor?.withOpacity(0.9),
                                  ),
                            ),
                            subtitle: Text(
                              controller.notificationList?[index].body ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                    color: kBlackColor?.withOpacity(0.5),
                                    fontSize: 12,
                                  ),
                            ),
                            trailing: Text(
                              Jiffy(
                                controller.notificationList?[index].createdAt ??
                                    "",
                              ).fromNow(),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(fontSize: 10),
                            ),
                          );
                        }),
                      ));
          }),
    );
  }
}
