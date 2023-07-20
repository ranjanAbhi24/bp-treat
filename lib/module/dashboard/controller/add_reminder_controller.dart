import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddReminderController extends GetxController{
  String dropdown1 ="Daily";
  String dropdown2="Central Time";
  late TextEditingController hourController;
  late TextEditingController minuteController;
  String meridian="";
  String selected_value = "";
  bool am=false;
  bool pm=false;
  bool isText=false;
  bool isInApp=false;
  List<String> items1= ["Daily","Weekly","Monthly"];
  List<String> items2= ["Central Time","1","2"];

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
    if (dropdown2 == "Central Time") {
      dropdown2 = "Central Time";
    } else if (dropdown2 == "1") {
      dropdown2 = "1";
    } else   {
      dropdown2= "2";
    }
    update();
  }

  selectMeridian(value){
    meridian=value;
    if(meridian=="A.M"){
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