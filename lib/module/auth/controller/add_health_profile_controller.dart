
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddHealthController extends GetxController{
 bool isMale = false;
bool isFemale = false;
DateTime selectDate = DateTime.now();
late TextEditingController feetController;
late TextEditingController inchesController;
late TextEditingController allergiesController;
late TextEditingController medicalConditionsController;
late TextEditingController currentMedicationsController;
late GlobalKey<FormState> page2FormKey;
String selectValue ='male';
String haveDiabetes="Yes";
bool diabetesYes= false;
bool diabetesNo=false;
 List<String> dropdownList=["Select a choice..","1",'2',"3"];
 List<String> list1= ['Tabacco','Marijuana','None of these'];
 List<String> list2 = ['Narcotics','Amphetamines','Cocaine','None of these'];
 bool? isSelectedTobacco = false;
 bool? isMarijuana = false;
 String dropDownValue = 'Select a choice..';

 onChangeValue(String value) {
   dropDownValue = value;
   if(dropDownValue == "Select a choice.."){
     dropDownValue = "Select a choice..";
   }
  else if (dropDownValue == "1") {
     dropDownValue = "1";
   } else if (dropDownValue == '2') {
     dropDownValue = "2";
   } else {
     dropDownValue = "3";
   }
  update();
 }

 selectedCheckBox(bool? value) {
   isSelectedTobacco=true;

   update();
 }

 void  confirmDiabetes(value){
   haveDiabetes = value;
   if(haveDiabetes == "yes"){
     diabetesYes = true;
     diabetesNo=false;
   }else if(haveDiabetes == "no"){
     diabetesNo=true;
     diabetesYes=false;
   }
   update();
 }

void dateTimeChanged(value){
  selectDate = value;
  update();
}

void selectGender(value){
selectValue=value;
if(selectValue == "male"){
  print(selectValue);
  isMale=true;
  isFemale=false;
}
else if(selectValue == "Female"){
  print(selectValue);
  isFemale=true;
  isMale=false;
}
update();
 }





 @override
  void onInit() {
    // TODO: implement onInit
   feetController=TextEditingController();
   inchesController = TextEditingController();
   allergiesController = TextEditingController();
   medicalConditionsController = TextEditingController();
   currentMedicationsController=TextEditingController();
   page2FormKey = GlobalKey<FormState>();
    super.onInit();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    feetController.dispose();
    allergiesController.dispose();
    inchesController.dispose();
    medicalConditionsController.dispose();
    currentMedicationsController.dispose();
  }
}

