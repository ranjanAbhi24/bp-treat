import 'package:bp_treat/module/doctor/controller/doctor_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../utils/app_theme.dart';


class ListOfDoctors extends StatefulWidget {
  const ListOfDoctors({super.key});

  @override
  State<ListOfDoctors> createState() => _ListOfDoctorsState();
}

class _ListOfDoctorsState extends State<ListOfDoctors> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor?.withOpacity(0.1),
      body: GetBuilder<DoctorController>(
        init: DoctorController(),
        builder: (controller){
          return Column(
            children: [
              Row(
                children: [
                  IconButton(
                      padding:EdgeInsets.zero,
                      onPressed: (){
                        Get.back();
                      }, icon: const Icon(Icons.arrow_back)),
                  Text(
                    'Available Doctors',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ],
              ),
                  Expanded(
                      child: controller.listOfDoctor.isEmpty?Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color(0XFFF49DA2)
                            .withOpacity(0.4),
                      ),
                      child: const Center(
                          child: CircularProgressIndicator())
                  ):ListView.builder(
                        shrinkWrap: true,
                          itemCount: controller.listOfDoctor.length,
                          itemBuilder: (BuildContext context, int index){
                    return Container(
                        padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0XFFF49DA2).withOpacity(0.4)),
                      child: ListTile(
                         title: Text("${controller.listOfDoctor[index].fname}\t${controller.listOfDoctor[index].lname}",
                         style: Theme.of(context).textTheme.bodyText1!.copyWith(
                           color: kBlackColor
                         ),
                         ),
                        subtitle: 
                        // Text("Contact:"
                        //     " ${controller.listOfDoctor[index].contact??"2814814236"}"),
                        Text("Contact: ${controller.formatPhoneNumber(controller.listOfDoctor[index].contact??"2814814236")}")
                      ),
                    );
                      })
                  )
            ],
          );
        },
      ),
      ),
    );
  }
}

