import 'package:badges/badges.dart' as badge;
import 'package:bp_treat/module/dashboard/controller/dashboard_controller.dart';
import 'package:bp_treat/module/dashboard/controller/landing_controller.dart';
import 'package:bp_treat/module/dashboard/model/user_record.dart';
import 'package:bp_treat/module/dashboard/view/add_bp_view.dart';
import 'package:bp_treat/module/dashboard/view/graph_widget.dart';
import 'package:bp_treat/module/dashboard/view/notification_view.dart';
import 'package:bp_treat/module/dashboard/view/view_all_record.dart';
import 'package:bp_treat/utils/app_theme.dart';
import 'package:bp_treat/utils/prefs.dart';
import 'package:bp_treat/utils/size.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    LandingController landingcontroller = Get.find<LandingController>();
    return GetBuilder<DashboardController>(
        init: DashboardController(),
        builder: (controller) {
          return controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFFDF1721)),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                              "Hello, ${landingcontroller.userData?.data?.name ?? "user"}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(fontSize: 14)),
                          const SizedBox(width: 6),
                          Image.asset('assets/images/waving_hand.png'),
                          const Spacer(),
                          GestureDetector(
                              onTap: () async {
                                await Prefrence.setBadgeStatus(false);
                                Get.to(() => const NotificationView());
                              },
                              child: badge.Badge(
                                showBadge: controller.badgeStatus == true
                                    ? true
                                    : false,
                                position:
                                    badge.BadgePosition.topEnd(top: 0, end: 1),
                                animationType: badge.BadgeAnimationType.scale,
                                badgeContent: null,
                                child: Image.asset(
                                    'assets/images/notification.png'),
                              )),
                        ],
                      ),
                      Divider(color: Colors.black.withOpacity(0.5)),
                      Row(
                        children: [
                          Text(
                            'Tracker',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: kPrimaryColor?.withOpacity(0.15),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                DropdownButton<String>(
                                    elevation: 0,
                                    value: controller.dropDownValue,
                                    underline: const SizedBox.shrink(),
                                    icon: CircleAvatar(
                                      backgroundColor: const Color(0XFFF49DA2)
                                          .withOpacity(0.4),
                                      radius: 14,
                                      child: const Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.black,
                                      ),
                                    ),
                                    items: controller.items.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(
                                          items,
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) => controller
                                        .onChangeValue(value ?? 'hour')),
                              ],
                            ),
                          ),
                          const Spacer(),
                          FittedBox(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                              ),
                              onPressed: () {
                                Get.to(() => const AddBPView());
                              },
                              child: Row(
                                children: const [
                                  Icon(Icons.add),
                                  Text(
                                    'Add',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: Color(0xff53e422),
                          ),
                          SizedBox(width: 4),
                          Text('Systolic'),
                          SizedBox(width: 40),
                          CircleAvatar(
                            radius: 8,
                            backgroundColor: Color(0xffff5722),
                          ),
                          SizedBox(width: 4),
                          Text('Diastolic'),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: BarGraphWidget(
                          getTitlesWidget: (value, metaData) {
                            List? list = controller.listOfGraphData
                                .map((e) => e.interval)
                                .toList();
                            return SideTitleWidget(
                                axisSide: metaData.axisSide,
                                space: 4,
                                child: list.isEmpty
                                    ? const Text('')
                                    : Text(list[value.toInt()]));
                          },
                          showingBarGroups:
                              controller.listOfGraphData.isNotEmpty
                                  ? controller.listOfGraphData
                                      .asMap()
                                      .entries
                                      .map((dataItem) {
                                      return BarChartGroupData(
                                          x: dataItem.key,
                                          barsSpace: 4,
                                          barRods: [
                                            BarChartRodData(
                                              toY: dataItem.value.systolic
                                                      ?.toDouble() ??
                                                  70,
                                              // toY: 14,
                                              color: const Color(0xff53e422),
                                              width: 6,
                                              fromY: 0,
                                            ),
                                            BarChartRodData(
                                              toY: dataItem.value.diastolic
                                                      ?.toDouble() ??
                                                  80,
                                              // toY: 10,
                                              color: const Color(0xffff5722),
                                              width: 6,
                                            ),
                                          ]);
                                    }).toList()
                                  : [
                                      BarChartGroupData(
                                        x: 1,
                                        barsSpace: 4,
                                        barRods: [
                                          BarChartRodData(
                                            toY: 0,
                                            color: const Color(0xff53fdd7),
                                            width: 8,
                                            fromY: 0,
                                          ),
                                          BarChartRodData(
                                            toY: 0,
                                            color: const Color(0xffff5722),
                                            width: 8,
                                          ),
                                        ],
                                      )
                                    ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Container(
                          // padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: const Color(0XFFF49DA2).withOpacity(0.15),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                width: size.width,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0XFFF49DA2).withOpacity(0.5),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Last 10 Records',
                                      style:
                                          Theme.of(context).textTheme.headline2,
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            backgroundColor:
                                                Colors.red.shade500),
                                        onPressed: () {
                                          Get.to(() => const ViewAllRecord());
                                        },
                                        child: Text(
                                          'View all',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2
                                              ?.copyWith(
                                                  color: kWhiteColor
                                                      ?.withOpacity(0.8),
                                                  fontWeight: FontWeight.bold),
                                        )),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 6),
                              Expanded(
                                child: controller.record.isEmpty
                                    ? const Center(child: Text('Empty List'))
                                    : ListView.builder(
                                        physics:
                                            const AlwaysScrollableScrollPhysics(
                                          parent: BouncingScrollPhysics(),
                                        ),
                                        itemCount: controller.record.length,
                                        itemBuilder: ((context, index) {
                                          Record record =
                                              controller.record[index];

                                          // DateTime parseDate = DateFormat(
                                          //         "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                                          //     .parse(
                                          //         record.createdAt.toString());
                                          // DateTime parseDate = DateFormat(
                                          //         'M-DD-YY HH:MI:SS')
                                          //     .parse(
                                          //         record.createdAt.toString());
                                          // print(
                                          //     "PD : ${record.createdAt.toString().split(':')}");
                                          // var inputDate = DateTime.parse(
                                          //     parseDate.toString());
                                          // var outputFormat =
                                          //     DateFormat('MM/dd/yyyy hh:mm a');
                                          // var outputDate =
                                          //     outputFormat.format(inputDate);
                                          return buildRecordTile(
                                            dateTime: record.createdAt!
                                                .substring(0, 16),
                                            severity: record.category ?? "",
                                            systolic:
                                                record.systolic.toString(),
                                            diastolic:
                                                record.diastolic.toString(),
                                            pulse: record.pulse.toString(),
                                            isSever: record.category ?? "",
                                            note: record.note ?? "No Note",
                                          );
                                        }),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        });
  }

  buildRecordTile({
    required String dateTime,
    required String severity,
    required String systolic,
    required String diastolic,
    required String pulse,
    required String isSever,
    required String note,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dateTime,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                      color: isSever == "average"
                          ? const Color(0XFFE2F5F6)
                          : isSever == "elevated"
                              ? const Color(0XFFFDF5DC)
                              : const Color(0XFFF8E7EB),
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    severity,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: isSever == "average"
                          ? const Color(0XFF28B59D)
                          : isSever == "elevated"
                              ? const Color(0XFFF2894A)
                              : const Color(0xFFF4635D),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      systolic,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: kBlackColor,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "SYS\nmmHg",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black.withOpacity(0.35),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      diastolic,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: kBlackColor),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "DIA\nmmHg",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black.withOpacity(0.35),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      pulse,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: kBlackColor),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "Pulse\n/min",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.black.withOpacity(0.35),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                note,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
