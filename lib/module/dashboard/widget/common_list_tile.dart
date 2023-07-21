import 'package:flutter/material.dart';

import '../../../utils/app_theme.dart';


class buildListTile extends StatelessWidget {
  const buildListTile({super.key,
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
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: kBlackColor,
          ),
        ),

      ),
    );
  }
}
