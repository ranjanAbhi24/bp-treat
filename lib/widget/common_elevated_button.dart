

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonElevatedButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final backgroundColor;
  final textColor;
  const CommonElevatedButton({
    Key? key,
    required this.onTap,
    required this.title,
   required this.backgroundColor,
    required this.textColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:backgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        fixedSize: Size(200.w,50.h),
        textStyle: TextStyle(

          fontWeight: FontWeight.bold,
          color: textColor
        ),
      ),
      onPressed: onTap,
      child: Text(
        maxLines:1,
        title,
       style: Theme.of(context).textTheme.bodyText1!.copyWith(
         color: textColor,

       ))
    );
  }
}
