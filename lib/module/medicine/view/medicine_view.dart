import 'package:bp_treat/module/medicine/controller/medicine_controller.dart';
import 'package:bp_treat/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MedicineView extends StatefulWidget {
  const MedicineView({super.key});

  @override
  State<MedicineView> createState() => _MedicineViewState();
}

class _MedicineViewState extends State<MedicineView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MedicineController>(
        init: MedicineController(),
        builder: ((controller) {
          return controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFFDF1721)),
                  ),
                )
              : Scaffold(
                  backgroundColor: kPrimaryColor?.withOpacity(0.1),
                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 12),
                            child: Text(
                              'Medication',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: controller.reportList.isEmpty
                                ? Container(
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: const Color(0XFFF49DA2)
                                          .withOpacity(0.4),
                                    ),
                                    child: const Center(
                                        child: Text('No Prescription')))
                                : ListView.builder(
                                    physics:
                                        const AlwaysScrollableScrollPhysics(
                                      parent: BouncingScrollPhysics(),
                                    ),
                                    itemCount: controller.reportList.length,
                                    itemBuilder: ((context, index) {
                                      controller.prescriptionID =
                                          controller.reportList[index].sId;
                                      List medName = [];
                                      String medicineNamee = '';
                                      for (int i = 0;
                                          i <
                                              controller.reportList[index]
                                                  .medicines!.length;
                                          i++) {
                                        var medicineName = {
                                          'name': controller.reportList[index]
                                              .medicines![i].name,
                                        };
                                        medName.add(
                                            medicineName.values.elementAt(0));
                                        medicineNamee = medName.join(' and ');
                                      }
                                      return controller.isLoading
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : buildPrescriptionWidget(
                                              title: medicineNamee,
                                              onTap: () async {
                                                final url =
                                                    "http://54.238.218.186:5000/prescriptions/${controller.reportList[index].pdf}";

                                                await controller
                                                    .requestDownload(
                                                  url: url,
                                                  fileName: DateTime.now()
                                                      .toLocal()
                                                      .toString(),
                                                  id: controller
                                                          .reportList[index]
                                                          .sId ??
                                                      "",
                                                );
                                              },
                                              date: controller
                                                  .reportList[index].createdAt!
                                                  .substring(0, 16),
                                              isViewed: controller
                                                      .reportList[index]
                                                      .isViewed ??
                                                  false,
                                            );
                                    }),
                                  ),
                          ),
                        ]),
                  ));
        }));
  }
}

buildPrescriptionWidget({
  String? title,
  bool isViewed = false,
  String? date,
  Function()? onTap,
}) {
  return Container(
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: const Color(0XFFF49DA2).withOpacity(0.4),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(date ?? "",
                style: TextStyle(
                  fontSize: 12,
                  color: kBlackColor?.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(width: 30),
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isViewed ? Colors.orange : Colors.green,
              ),
            ),
            const SizedBox(width: 5),
            Text(isViewed ? 'Previous' : 'Updated',
                style: TextStyle(
                  fontSize: 13,
                  color: kBlackColor?.withOpacity(0.7),
                )),
            const Spacer(),
            GestureDetector(
              onTap: onTap,
              child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color(0XFFF49DA2)),
                  child: const Icon(Icons.download)),
            ),
          ],
        ),
        Text(
          'Prescription for $title',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            color: kBlackColor,
          ),
        ),
        const SizedBox(height: 10),
        Text("Download your precription and use as prescribed by doctor.",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: kBlackColor?.withOpacity(0.6),
            )),
        const SizedBox(height: 10),
      ],
    ),
  );
}
