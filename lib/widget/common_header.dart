import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../module/dashboard/view/menu_view.dart';
import '../utils/app_theme.dart';

class CommonHeader extends StatelessWidget {
  const CommonHeader({super.key,
  required this.title,

  });
  final String title;


  @override
  Widget build(BuildContext context) {

    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       // IconButton(
       //     onPressed: (){
       //     exit(0);
       //     },
       //     icon: Icon(Icons.arrow_back,
       //     color: kBlackColor,
       //     ),
       // ),
        SizedBox(
          width: 20.w,
        ),
        SizedBox(
          width: 220.w,
          child: Text(title,
            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                              color: kBlackColor,
                              fontSize: 25.sp
                            )
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        IconButton(
          onPressed: (){
            MenuDialog().openMenuDialog();
    },
          icon:  Icon(Icons.menu,
          size: 30,
          color: kBlackColor,
          ),
        ),
      ],
    );
  }
}


