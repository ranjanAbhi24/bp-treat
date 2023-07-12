import 'package:bp_treat/module/auth/view/login_screen.dart';
import 'package:bp_treat/module/auth/view/register_screen_1.dart';
import 'package:bp_treat/utils/app_theme.dart';
import 'package:bp_treat/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height,
      width: size.width,
      child: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: [
          PageViewModel(
              title: "BP Treat",
              image: Image.asset(
                'assets/images/welcome_one.png',
                fit: BoxFit.cover,
              ),
              bodyWidget: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("\u2022 Learn about hypertension ",
                      style: Theme.of(context).textTheme.bodyText2),
                  const SizedBox(height: 10),
                  Text("\u2022 Track your blood pressure",
                      style: Theme.of(context).textTheme.bodyText2),
                  const SizedBox(height: 10),
                  FittedBox(
                    child: Text("\u2022 Get prescriptions for hypertension",
                        style: Theme.of(context).textTheme.bodyText2),
                  ),
                ],
              ),
              decoration: pageDecoration),
          PageViewModel(
              title: "Educational videos",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () async {
                        await launchUrl(Uri.parse(
                            "https://www.youtube.com/watch?v=0tGyRJxbYpQ"));
                      },
                      child: Row(
                        children: const [
                          Text("\u2022 "),
                          Text(
                            "How to take your blood pressure",
                            style: TextStyle(
                                fontSize: 12,
                                decoration: TextDecoration.underline,
                                color: Colors.blue),
                          ),
                        ],
                      )),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () async {
                      await launchUrl(Uri.parse(
                          "https://www.youtube.com/watch?v=hXC304-cFaU"));
                    },
                    child: Row(
                      children: const [
                        Text("\u2022 "),
                        Text(
                          "How to treat blood pressure without medication",
                          style: TextStyle(
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                              color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              image: Image.asset('assets/images/welcome_two.png'),
              decoration: pageDecoration),
          PageViewModel(
              title: "Steps to obtain treatment",
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("\u2022 Complete your patient profile",
                      style: Theme.of(context).textTheme.bodyText2),
                  const SizedBox(height: 10),
                  Text("\u2022 Record your blood pressure daily for 7 days",
                      style: Theme.of(context).textTheme.bodyText2),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\u2022 Attend a virtual Doctor’s visit ",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
              image: Image.asset(
                'assets/images/welcome_three.png',
                fit: BoxFit.cover,
              ),
              decoration: pageDecoration),
        ],
        onDone: () {
         // Get.off(() => const LoginScreen());
          Get.off(() => const RegisterScreen1());
        },
        onSkip: () {
         // Get.off(() => const LoginScreen());
          Get.off(() => const RegisterScreen1());
        },
        showBackButton: false,
        showSkipButton: true,
        skip: ButtonTheme(
          minWidth: MediaQuery.of(context).size.width,
          height: 40.0,
          child: Text('Skip', style: Theme.of(context).textTheme.headline1),
        ),
        next: ButtonTheme(
          minWidth: MediaQuery.of(context).size.width,
          height: 40.0,
          child: Text('Next', style: Theme.of(context).textTheme.headline1),
        ),
        done: ButtonTheme(
          minWidth: MediaQuery.of(context).size.width,
          height: 40.0,
          child: Text('Done', style: Theme.of(context).textTheme.headline1),
        ),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: kPrimaryColor,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }

  final PageDecoration pageDecoration = PageDecoration(
    titleTextStyle: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
        fontFamily: 'Montserrat',
        color: kBlackColor),
    bodyTextStyle: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        fontFamily: 'Montserrat',
        color: Colors.black.withOpacity(0.40)),
    bodyPadding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 12.0),
    pageColor: Colors.white,
    imagePadding: EdgeInsets.zero,
  );
}
