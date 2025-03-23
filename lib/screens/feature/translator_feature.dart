import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:lyra/helper/global.dart';

class TranslatorFeature extends StatefulWidget {
  const TranslatorFeature({super.key});

  @override
  State<TranslatorFeature> createState() => _TranslatorFeatureState();
}

class _TranslatorFeatureState extends State<TranslatorFeature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Language Translate.'),
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
