import 'package:flutter/material.dart';

import '../../../utils/app_theme.dart';


class OptionField extends StatelessWidget {
  final dynamic onTap;
  final bool? isChecked;
  final String optionText;

  const OptionField({super.key,
  required this.onTap,
    required this.isChecked,
    required this.optionText
  });


  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Checkbox(
          activeColor: kPrimaryColor,
          materialTapTargetSize:
          MaterialTapTargetSize.shrinkWrap,
          side: BorderSide(color: kBlackColor!.withOpacity(0.8), width: 2),
          checkColor: Colors.white,
          value: isChecked,
          onChanged: onTap,
        ),
        Text(optionText,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.w500
        ),
        )
      ],
    );
  }
}
