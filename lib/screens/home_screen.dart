import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lyra/helper/global.dart';
import 'package:lyra/helper/pref.dart';
import 'package:lyra/model/home_type.dart';
import 'package:lyra/widgets/home_cart.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showOnBoarding = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.brightness_4_rounded,
                size: 25,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: mq.width * 0.04,
          vertical: mq.height * 0.01,
        ),
        children: HomeType.values.map((e) => HomeCart(homeType: e)).toList(),
      ),
    );
  }
}
