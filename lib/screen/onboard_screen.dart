import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tribot/model/onboard.dart';
import 'package:tribot/screen/homescreen.dart';
import 'package:tribot/screen/widgets/custom_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = PageController();

    final list = [
      //onboarding 1
      Onboard(
          title: 'Ask me Anything',
          subtitle:
              'I can be your Best Friend & You can ask me anything & I will help you!',
          lottie: 'iot'),

      //onboarding 2
      Onboard(
        title: 'Imagination to Reality',
        lottie: 'loading',
        subtitle:
            'Just Imagine anything & let me know, I will create something wonderful for you!',
      ),
    ];

    return Scaffold(
      body: PageView.builder(
        controller: c,
        itemCount: list.length,
        itemBuilder: (ctx, ind) {
          final isLast = ind == list.length - 1;

          return Column(
            children: [
              //lottie
              Lottie.asset('lottie/${list[ind].lottie}.json',
                  height: MediaQuery.of(context).size.height * .6, width: isLast ? MediaQuery.of(context).size.width * .7 : null),

              //title
              Text(
                list[ind].title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    letterSpacing: .5),
              ),

              //for adding some space
              SizedBox(height:MediaQuery.of(context).size.height * .015),

              //subtitle
              SizedBox(
                width: MediaQuery.of(context).size.width * .7,
                child: Text(
                  list[ind].subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13.5,
                      letterSpacing: .5,
                      ),
                ),
              ),

              const Spacer(),

              //dots

              Wrap(
                spacing: 10,
                children: List.generate(
                    list.length,
                    (i) => Container(
                          width: i == ind ? 15 : 10,
                          height: 8,
                          decoration: BoxDecoration(
                              color: i == ind ? const Color.fromARGB(255, 147, 183, 212) : Colors.grey,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                        )),
              ),

              const Spacer(),

              //button
              CustomBtn(
                  onTap: () {
                    if (isLast) {
                      Get.off(() => const HomeScreen());
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //     builder: (_) => const HomeScreen()));
                    } else {
                      c.nextPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.ease);
                    }
                  },
                  text: isLast ? 'Finish' : 'Next'),

              const Spacer(flex: 2),
            ],
          );
        },
      ),
    );
  }
}