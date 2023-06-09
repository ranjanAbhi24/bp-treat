import 'package:bp_treat/utils/app_theme.dart';
import 'package:bp_treat/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Get.back(),
          ),
          title: Text("Us", style: Theme.of(context).textTheme.headline2),
        ),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row(
              //   children: [
              //     Image.asset(
              //       "assets/images/steven_image.png",
              //       height: 100.0,
              //       width: 100.0,
              //     ),
              //     const SizedBox(width: 5),
              //     Expanded(
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: const [
              //           Text(
              //             "Dr. Steven Goldstein",
              //           ),
              //           SizedBox(
              //             height: 10,
              //           ),
              //           Text(
              //             "Board Certified in Internal Medicine and in Neurology",
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(
              //   height: 10.0,
              // ),
              RichText(
                text: TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(color: kBlackColor?.withOpacity(0.8)),
                    children: <TextSpan>[
                      const TextSpan(text: 'The '),
                      TextSpan(
                          text: 'Houston Healthcare Initiative, ',
                          style:
                              Theme.of(context).textTheme.bodyText2?.copyWith(
                                    color: kPrimaryColor?.withOpacity(0.8),
                                  )),
                      const TextSpan(
                        text: 'promotes the health of Texans by:',
                      ),
                    ]),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const Text('\u2022 '),
                  Flexible(
                    child: Text(
                        "Educating patients how to shop for medical care and how to efficiently access the healthcare system",
                        maxLines: 2,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyText2),
                  ),
                ],
              ),
              const SizedBox(height: 6.0),
              Row(
                children: [
                  const Text('\u2022 '),
                  Flexible(
                    child: Text(
                      "Promoting the use of technology to improve the productivity of physicians",
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              ),

              // const SizedBox(height: 6.0),
              // Text(
              //   "\u2022 Educating patients about how to shop for medical care.",
              //   textAlign: TextAlign.start,
              //   style: Theme.of(context).textTheme.subtitle2?.copyWith(
              //       color: kBlackColor?.withOpacity(0.8),
              //       fontWeight: FontWeight.w400),
              // ),
              const SizedBox(height: 20.0),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "BP Treat",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: kPrimaryColor),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  const Text('\u2022 '),
                  Flexible(
                    child: Text(
                      "Use of AI to develop an algorithm to suggest medication to the physican",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2!,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const Text('\u2022 '),
                  Flexible(
                    child: Text(
                      "Efficiently treat uninsured patients",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2!,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const Text('\u2022 '),
                  Flexible(
                    child: Text(
                      "Encourage patient compliance with treatment",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2!,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                'Created by Steven Goldstein, MD',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                'Board Certified in Internal Medicine and Neurology',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
