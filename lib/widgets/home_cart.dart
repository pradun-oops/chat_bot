// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:lyra/helper/global.dart';
import 'package:lyra/model/home_type.dart';

class HomeCart extends StatelessWidget {
  final HomeType homeType;
  const HomeCart({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;
    return GestureDetector(
      onTap: homeType.onTap,
      child: Card(
        margin: EdgeInsets.only(bottom: mq.height * .02),
        color: Colors.blue.withOpacity(.7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        elevation: 0,
        child:
            homeType.leftAlign
                ? Row(
                  children: [
                    Container(
                      width: mq.width * 0.35,
                      padding: homeType.padding,
                      child: Lottie.asset(
                        homeType.lottie,
                        width: mq.width * 0.35,
                      ),
                    ),
                    Spacer(),
                    Text(
                      homeType.title,
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: .5,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(flex: 2),
                  ],
                )
                : Row(
                  children: [
                    Spacer(),
                    Text(
                      homeType.title,
                      style: TextStyle(
                        fontSize: 18,
                        letterSpacing: .5,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(flex: 2),
                    Container(
                      width: mq.width * 0.35,
                      padding: homeType.padding,
                      child: Lottie.asset(
                        homeType.lottie,
                        width: mq.width * 0.35,
                      ),
                    ),
                  ],
                ),
      ).animate().scale(duration: 1.seconds, curve: Curves.ease),
    );
  }
}
