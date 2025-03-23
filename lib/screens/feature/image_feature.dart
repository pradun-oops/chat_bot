import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lyra/helper/global.dart';

class ImageFeature extends StatefulWidget {
  const ImageFeature({super.key});

  @override
  State<ImageFeature> createState() => _ImageFeatureState();
}

class _ImageFeatureState extends State<ImageFeature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Generate Image.'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Lottie.asset(
              "assets/animation/Animation - 1742732616730.json",
              width: mq.width * .7,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Sorry! this feature is not available for now.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
