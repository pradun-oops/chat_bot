import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:lyra/helper/global.dart';
import 'package:lyra/model/on_board.dart';
import 'package:lyra/screens/home_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    final list = [
      OnBoard(
        title: 'Ask me Anything.',
        subTitle:
            'I can be your best friend & you can ask me anything & I will help you.',
        lottie: 'assets/animation/Animation - 1742699377039.json',
      ),
      OnBoard(
        title: 'Imagination to reality.',
        subTitle:
            'Just imagine anything & let me know, I will create something wonderful for you.',
        lottie: 'assets/animation/Animation - 1742699439643.json',
      ),
    ];

    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: list.length,

        itemBuilder: (ctx, index) {
          final isLast = index == list.length - 1;

          return Column(
            children: [
              Lottie.asset(list[index].lottie, height: mq.height * 0.6),
              Text(
                list[index].title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.5,
                ),
              ),
              SizedBox(
                width: mq.width * 0.7,
                child: Text(
                  list[index].subTitle,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              Wrap(
                spacing: 10,
                children: List.generate(
                  list.length,
                  (i) => Container(
                    width: i == index ? 15 : 10,
                    height: 8,
                    decoration: BoxDecoration(
                      color:
                          i == index
                              ? const Color.fromARGB(255, 0, 110, 255)
                              : Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ),
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  elevation: 0,
                  backgroundColor: const Color.fromARGB(255, 0, 110, 255),

                  maximumSize: Size(mq.width * 0.5, 50),
                ),
                onPressed: () {
                  if (isLast) {
                    Get.off(() => Homescreen());
                  } else {
                    pageController.nextPage(
                      duration: Duration(milliseconds: 600),
                      curve: Curves.ease,
                    );
                  }
                },
                child: Text(
                  isLast ? "Finish" : "Next",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              Spacer(flex: 2),
            ],
          );
        },
      ),
    );
  }
}
