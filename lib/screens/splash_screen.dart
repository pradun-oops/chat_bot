// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lyra/helper/global.dart';
import 'package:lyra/helper/pref.dart';
import 'package:lyra/screens/home_screen.dart';
import 'package:lyra/screens/on_boarding_screen.dart';
import 'package:lyra/widgets/custom_loading.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Get.off(() => Pref.showOnBoarding ? OnBoardingScreen() : Homescreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            Spacer(flex: 2),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: EdgeInsets.all(mq.width * 0.05),
                child: Image.asset(
                  "assets/icons/chat.png",
                  width: mq.width * 0.4,
                ),
              ),
            ),
            Spacer(),
            CustomLoading(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
