import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_theme.dart';


class BuildListTile extends StatelessWidget {
  const BuildListTile({super.key,
    required this.title,
    required this.image,
    required  this.onTap
  });
final String title;
final String image;

final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kWhiteColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: kGreyColor!)
      ),
      child: ListTile(
        onTap: onTap,
        leading: Image.asset(
          fit: BoxFit.cover,
          image,
          color: kPrimaryColor,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme!.bodyText2!.copyWith(
            color: kBlackColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500
          )
        )
      ),
    );
  }
}
