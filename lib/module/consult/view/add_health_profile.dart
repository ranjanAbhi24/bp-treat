import 'package:bp_treat/module/consult/controller/add_health_profile_controller.dart';
import 'package:bp_treat/module/consult/view/add_health_profile_page2.dart';
import 'package:bp_treat/widget/common_elevated_button.dart';
import 'package:bp_treat/utils/show_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import '../../../utils/app_theme.dart';



class AddHealthProfile extends StatelessWidget {
  const AddHealthProfile({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child:
           Scaffold(
             appBar: AppBar(
               backgroundColor: kWhiteColor,
               elevation: 0,
               leading: IconButton(
                 onPressed: (){
                   Get.back();
                 },
                 icon: const Icon(Icons.arrow_back),
                 color: kBlackColor,
               ),
             ),
              body: GetBuilder<AddHealthController>(
                init: AddHealthController(),
                builder: (controller){
                  return SingleChildScrollView(
                    child: Container(
                      color: kWhiteColor,
                      padding: const EdgeInsets.only(left: 30,right: 30),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Health Profile (1 of 4)",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                              //fontSize: 25.sp
                              color: const Color.fromRGBO(193, 65, 66, 1)
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text("Please continue your health profile to get better recommendations.",
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.headline4!.copyWith(
                                fontWeight: FontWeight.normal,
                               // fontSize: 13.sp,
                                color: kBlackColor
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Container(
                             padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: kGreyColor!.withOpacity(0.3),
                              border: Border.all(color: Colors.grey)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("What is your biological gender?",
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                        color: Colors.black
                                    )
                                ),
                                SizedBox(
                                    height: 20.h
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap:(){
                                        controller.selectGender("male");
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(30),
                                        decoration: BoxDecoration(
                                          color: controller.isMale ?const Color.fromRGBO(193, 65, 56, 10):Colors.white,
                                          shape: BoxShape.circle,
                                          //     borderRadius: const BorderRadius.all(Radius.circular(100)),
                                          border: Border.all(color: controller.isMale ?const Color.fromRGBO(193, 65, 56, 10):Colors.grey,),
                                        ),
                                        child:   Center(
                                          child: Text("Male",
                                          style:Theme.of(context).textTheme.subtitle2!.copyWith(
                                            color: controller.isMale?kWhiteColor:kBlackColor,
                                              fontWeight: FontWeight.normal
                                          )
                                          ),
                                        ),
                                      ),
                                    ),
                                    // CustomRadioButton(text: 'Male', onTap: (){
                                    //   controller.selectMale();
                                    // }, selectedColor: controller.isMale.value?Colors.red:Colors.grey, ),
                                    GestureDetector(
                                      onTap:
                                          (){
                                        controller.selectGender("Female");
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(30),
                                        decoration: BoxDecoration(
                                          color: controller.isFemale ?const Color.fromRGBO(193, 65, 56, 10):Colors.white,
                                          shape: BoxShape.circle,
                                          //     borderRadius: const BorderRadius.all(Radius.circular(100)),
                                          border: Border.all(color: controller.isFemale ?
                                          const Color.fromRGBO(193, 65, 56, 10):Colors.grey,),
                                        ),
                                        child:   Center(
                                          child: Text("Female",
                                          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                              color: controller.isFemale?kWhiteColor:kBlackColor,
                                            fontWeight: FontWeight.normal
                                          ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height:20.h),
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: kGreyColor!.withOpacity(0.3),
                                border: Border.all(color: Colors.grey)

                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("When were you born?",
                                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                        color: Colors.black
                                    )
                                ),
                                SizedBox(
                                  height: 240.h,
                                  width: 290.w,
                                  child: ScrollDatePicker(
                                    minimumDate: DateTime(1930,1,1),

                                      options: DatePickerOptions(

                                        backgroundColor: kGreyColor!.withOpacity(0.0),
                                      ),
                                      scrollViewOptions: DatePickerScrollViewOptions(

                                        year: ScrollViewDetailOptions(
                                            margin: const EdgeInsets.all(5),
                                            textStyle: Theme.of(context).textTheme.headline2!.copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal
                                            ),
                                          selectedTextStyle: Theme.of(context).textTheme.headline2!.copyWith(
                                            color: Colors.black,
                                              fontWeight: FontWeight.bold
                                          )
                                        ),
                                        month: ScrollViewDetailOptions(
                                            margin: const EdgeInsets.all(5),
                                            textStyle: Theme.of(context).textTheme.headline2!.copyWith(
                                              color: Colors.black,
                                                fontWeight: FontWeight.normal
                                            ),
                                            selectedTextStyle: Theme.of(context).textTheme.headline2!.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold
                                            )
                                        ),
                                        day: ScrollViewDetailOptions(
                                            margin: const EdgeInsets.all(5),
                                            textStyle: Theme.of(context).textTheme.headline2!.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal
                                            ),
                                            selectedTextStyle: Theme.of(context).textTheme.headline2!.copyWith(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold
                                            )
                                        ),
                                      ),
                                      selectedDate: controller.selectDate,
                                      onDateTimeChanged: (value){
                                        controller.dateTimeChanged(value);
                                      }
                                  ),
                                ),
                              ],
                            ),
                          ),
SizedBox(
  height: 20.h,
),
                          // SpinnerDateTimePicker(
                          //   mode: CupertinoDatePickerMode.date,
                          //     initialDateTime: DateTime.now(),
                          //     maximumDate: DateTime.now().add(const Duration(days: 7)),
                          //     minimumDate: DateTime.now().subtract(const Duration(days: 1)),
                          //     didSetTime: (value){}
                          // )
                          Center(
                            child: SizedBox(
                              width:200.w,
                              child: CommonElevatedButton(
                                  onTap: (){
                                    if(controller.select_gender.isNotEmpty && controller.dob.isNotEmpty){
                                      Get.to(()=> const AddHealthProfilePage2());
                                    }
                                    else{
                                      if(controller.select_gender.isEmpty && controller.dob.isEmpty){
                                        ApplicationUtils.showSnackBar(
                                            titleText: "Alert",
                                            messageText: "Select the values");
                                      }else if(controller.select_gender.isEmpty){
                                        ApplicationUtils.showSnackBar(
                                            titleText: "Alert",
                                            messageText: "Select your biological gender");
                                      }else{
                                        ApplicationUtils.showSnackBar(
                                            titleText: "Alert",
                                            messageText: "Select your dob");
                                      }
                                    }
                                  },
                                  title: "Continue",
                                backgroundColor: kPrimaryColor,
                                textColor: kWhiteColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
            ),
             )

    );
  }
}
