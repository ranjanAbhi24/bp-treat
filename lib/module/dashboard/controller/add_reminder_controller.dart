import 'package:bp_treat/module/consult/view/ready_to_record.dart';
import 'package:bp_treat/module/dashboard/model/add_reminder.dart';
import 'package:bp_treat/service/api_service.dart';
import 'package:bp_treat/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/landing_page.dart';

class AddReminderController extends GetxController{
  final ApiService _apiService = ApiService();
  String dropdown1 ="Daily";
  String dropdown2="Central";
  late TextEditingController hourController;
  late TextEditingController minuteController;
  String meridian="";
  String selected_value = "";
  bool am=false;
  bool pm=false;
  bool isText=false;
  bool isInApp=false;
  List<String> items1= ["Daily","Weekly","Monthly"];
  List<String> items2= ["Central"];
  SetReminder? _setReminder;

  onChangeValue1(String value) {
    dropdown1 = value;
    if (dropdown1 == "Daily") {
      dropdown1 = "Daily";
    } else if (dropdown1 == "Monthly") {
      dropdown1 = "Monthly";
    } else   {
      dropdown1= "Weekly";
    }
    update();
  }

  onChangedValue2(String value){
    dropdown2= value;
    if (dropdown2 == "Central") {
      dropdown2 = "Central";
    // } else if (dropdown2 == "1") {
    //   dropdown2 = "1";
    // } else   {
    //   dropdown2= "2";
     }
    update();
  }

  selectMeridian(value){
    meridian=value;
    if(meridian=="AM"){
      am=true;
      pm=false;
    }else{
      pm=true;
      am=false;
    }
    update();
  }

  selectValue(value){
    selected_value=value;
    if(selected_value=="Text"){
      isText=true;
     isInApp=false;
    }else{
      isInApp=true;
      isText=false;
    }
    update();
  }

  setReminder() async {
    // var time = "${hourController.text}:${minuteController.text}$meridian";
    // print(meridian);
    // DateTime date= DateFormat("hh:mm").parse(time);
    // print("${date.hour}:${date.minute}");
    var time = "${hourController.text}:${minuteController.text}$meridian";
    print(time);
    _setReminder =   await _apiService.addReminder(period: dropdown1,time: time,type: "In App");
  if(_setReminder?.status == "Success"){
  //  ApplicationUtils.showSnackBar(titleText: "Congrats!!", messageText: _setReminder?.msg);

    Get.to(()=>const ReadyToRecord());
  }else{
    ApplicationUtils.showSnackBar(titleText: "Fail!!", messageText: _setReminder?.msg);
  }
  }

  @override
  void onInit() {
hourController = TextEditingController();
minuteController=TextEditingController();
hourController.text="00";
minuteController.text="00";

    super.onInit();
  }

  @override
  void dispose() {
hourController.dispose();
minuteController.dispose();
    super.dispose();
  }

}