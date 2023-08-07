import 'package:bp_treat/module/dashboard/controller/view_all_controller.dart';
import 'package:bp_treat/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ViewAllRecord extends StatelessWidget {
  const ViewAllRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Get.back(),
          ),
          title:
              Text("All Records", style: Theme.of(context).textTheme.headline2),
        ),
        body: GetBuilder<ViewAllController>(
            init: ViewAllController(),
            builder: (controller) {
              return controller.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Color(0xFFDF1721)),
                      ),
                    )
                  : Container(
                      color: const Color(0XFFF49DA2).withOpacity(0.15),
                      child: Column(
                        children: [
                          Card(
                            elevation: 4.0,
                            margin: const EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: controller.intervals
                                  .asMap()
                                  .entries
                                  .map(
                                    (time) => GestureDetector(
                                      onTap: () async {
                                        await controller.onIntervalTap(
                                          time.key,
                                          time.value,
                                        );
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(10),
                                        margin: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color:
                                              controller.isSelected == time.key
                                                  ? kPrimaryColor
                                                  : kWhiteColor,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Text(time.value,
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                ?.copyWith(
                                                  color:
                                                      controller.isSelected ==
                                                              time.key
                                                          ? kWhiteColor
                                                          : kBlackColor,
                                                )),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Expanded(
                            child: ListView.builder(
                                physics: const AlwaysScrollableScrollPhysics(
                                  parent: BouncingScrollPhysics(),
                                ),
                                itemCount: controller.list.length,
                                itemBuilder: ((context, index) {

                                  return buildRecordTile(
                                    dateTime: controller.list[index].createdAt!
                                        .substring(0, 16),
                                    systolic: controller.list[index].systolic
                                        .toString(),
                                    diastolic: controller.list[index].diastolic
                                        .toString(),
                                    pulse:
                                        controller.list[index].pulse.toString(),
                                    description:
                                        controller.list[index].note ?? "",
                                  );
                                })),
                          ),
                        ],
                      ),
                    );
            }),
      ),
    );
  }

  buildRecordTile({
    required String dateTime,
    required String systolic,
    required String diastolic,
    required String pulse,
    required String description,
  }) {
    return Card(
      elevation: 2.0,
      shadowColor: kPrimaryColor,
      margin: const EdgeInsets.all(6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                description,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: kBlackColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
