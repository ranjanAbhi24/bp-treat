import 'package:bp_treat/utils/app_theme.dart';
import 'package:bp_treat/utils/size.dart';
import 'package:flutter/material.dart';

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
        fixedSize: Size(size.width, 50),
        textStyle: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: textColor
        ),
      ),
      onPressed: onTap,
      child: Text(
        title,
       style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}
