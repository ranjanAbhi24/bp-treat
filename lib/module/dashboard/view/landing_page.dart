import 'package:bp_treat/module/dashboard/controller/landing_controller.dart';
import 'package:bp_treat/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<LandingController>(
          init: LandingController(),
          builder: (controller) => Scaffold(
                body: controller.pages[controller.tabIndex],
                bottomNavigationBar:
                    buildBottomNavigationMenu(context, controller),
              )),
    );
  }

  buildBottomNavigationMenu(context, LandingController controller) {
    return GetPlatform.isAndroid
        ? BottomNavigationBar(
            unselectedItemColor: Colors.white.withOpacity(0.6),
            selectedItemColor: Colors.white,
            backgroundColor: kPrimaryColor,
            currentIndex: controller.tabIndex,
            onTap: controller.changeTabIndex,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                label: "Dashboard",
                icon: Icon(Icons.dashboard),
              ),
              BottomNavigationBarItem(
                label: "Medicine",
                icon: Icon(Icons.medication),
              ),
              BottomNavigationBarItem(
                label: "Contact",
                icon: Icon(Icons.chat),
              ),
              BottomNavigationBarItem(
                label: "Account",
                icon: Icon(Icons.account_box),
              ),
            ],
          )
        : CupertinoTabScaffold(
            backgroundColor: kWhiteColor,
            tabBar: CupertinoTabBar(
                height: 54,
                activeColor: kWhiteColor,
                inactiveColor: kWhiteColor!.withOpacity(0.6),
                backgroundColor: kPrimaryColor,
                onTap: controller.changeTabIndex,
                currentIndex: controller.tabIndex,
                items: const [
                  BottomNavigationBarItem(
                    label: "Dashboard",
                    icon: Icon(Icons.dashboard),
                  ),
                  BottomNavigationBarItem(
                    label: "Medicine",
                    icon: Icon(Icons.medication),
                  ),
                  BottomNavigationBarItem(
                    label: "Contact",
                    icon: Icon(Icons.chat),
                  ),
                  BottomNavigationBarItem(
                    label: "Account",
                    icon: Icon(Icons.account_box),
                  ),
                ]),
            tabBuilder: ((context, index) {
              return CupertinoTabView(
                builder: (context) {
                  return controller.pages[index];
                },
              );
            }));
  }
}
