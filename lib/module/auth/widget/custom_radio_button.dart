import 'package:flutter/material.dart';


class CustomRadioButton extends StatelessWidget {
  final Function() onTap;
  const CustomRadioButton({super.key,
  required this.text,
   required this.onTap,
   required this.selectedColor,
  });
 final String text;
final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          //     borderRadius: const BorderRadius.all(Radius.circular(100)),
          border: Border.all(color: selectedColor),
        ),
        child:  Center(
          child: Text(text),
        ),
      ),
    );
  }
}
