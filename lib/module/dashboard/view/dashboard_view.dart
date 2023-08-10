
import 'package:bp_treat/module/dashboard/controller/dashboard_controller.dart';
import 'package:bp_treat/module/dashboard/controller/landing_controller.dart';
import 'package:bp_treat/module/dashboard/model/user_record.dart';

import 'package:bp_treat/module/dashboard/view/graph_widget.dart';


import 'package:bp_treat/widget/common_dropdown.dart';
import 'package:bp_treat/utils/app_theme.dart';
import 'package:bp_treat/utils/prefs.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../widget/common_header.dart';


class DashBoardView extends StatelessWidget {
  DashBoardView({super.key});
  final Prefrence _prefs = Prefrence.instance;

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
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
              : SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: SizedBox(
                      height: 690.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CommonHeader(title: 'View Blood Pressure History',),
                          //
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     SizedBox(
                          //       width: 250.w,
                          //       child: Text("View Blood Pressure History",
                          //           textAlign: TextAlign.center,
                          //           style: Theme.of(context).textTheme.headline1!.copyWith(
                          //               color: kBlackColor,
                          //               fontSize: 25.sp
                          //           )
                          //       ),
                          //     ),
                          //
                          //     IconButton(
                          //       onPressed: (){
                          //         MenuDialog().openMenuDialog();
                          //       }, icon: const Icon(Icons.menu,
                          //       size: 40,),
                          //
                          //     )
                          //   ],
                          // ),
                         SizedBox(height: 20.h),
                          Row(

                            children: [
                              Icon(Icons.video_camera_back_outlined,
                                color: kBlackColor,
                              ),
                              SizedBox(width: 10.w,),
                              GestureDetector(
                                onTap: ()  async {
                                  await launchUrl(Uri.parse(
                                      "https://youtube.com/watch?v=WTz0nARAxpA&feature=sharec"));
                                },
                                child: Text(
                                  "What is high blood pressure?",
                                  style: Theme.of(context).textTheme!.bodyText2!.copyWith(
                                      color: kBlackColor,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.underline
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Icon(Icons.video_camera_back_outlined,
                                color: kBlackColor,
                              ),
                              SizedBox(width: 10.w,),
                              GestureDetector(
                                onTap: () async {
                                  await launchUrl(Uri.parse(
                                      "https://www.youtube.com/watch?v=hXC304-cFaU"));
                                },
                                child: Text(
                                  "How to lower blood pressure without\nmedication",

                                  style: Theme.of(context).textTheme!.bodyText2!.copyWith(
                                      color: kBlackColor,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.underline
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                        padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: kGreyColor!)
                            ),
                            child: Column(

                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                       padding: const EdgeInsets.all(5),
                                      width:150.w,
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: kGreyColor!),
                                        borderRadius: BorderRadius.circular(12)
                                      ),
                                      child: Center(
                                        child: DropDownWidget(
                                            dropdownValue: controller.dropDownValue,
                                            items: controller.items,
                                            onChange:controller.onChangeValue,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20.w,),
                                    const Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 8,
                                              backgroundColor: Color(0xFF5D4037),
                                            ),
                                            SizedBox(width: 4),
                                            Text('Systolic'),
                                          ],
                                        ),

                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 8,
                                              backgroundColor: Color(0xFFFFE0B2),
                                            ),
                                            SizedBox(width: 4),
                                            Text('Diastolic'),
                                          ],
                                        ),

                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: 30.h,),
                                SizedBox(
                                  height: 200.h,
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
                                                        color: const Color(0xFF5D4037),
                                                        width: 6,
                                                        fromY: 0,
                                                      ),
                                                      BarChartRodData(
                                                        toY: dataItem.value.diastolic
                                                                ?.toDouble() ??
                                                            80,
                                                        // toY: 10,
                                                        color: const Color(0xFFFFE0B2),
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
                                                      color: const Color(0xFF5D4037),
                                                      width: 8,
                                                      fromY: 0,
                                                    ),
                                                    BarChartRodData(
                                                      toY: 0,
                                                      color: const Color(0xFFFFE0B2),
                                                      width: 8,
                                                    ),
                                                  ],
                                                )
                                              ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: Container(

                              decoration: BoxDecoration(

                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                border: Border.all(color: kGreyColor!)
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 360.w,
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: kGreyColor!),

                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Most recent 10 Records',
                                        style:
                                            Theme.of(context).textTheme.headline2,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
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
                    ),
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
