import 'package:bp_treat/utils/app_theme.dart';

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
              Center(
                child: Text(
                  'Created by Steven Goldstein, MD',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Center(
                child: Text(
                  'Board Certified in Internal Medicine and Neurology',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
