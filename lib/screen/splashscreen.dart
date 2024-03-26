import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tribot/helper/pref.dart';
import 'package:tribot/screen/homescreen.dart';
import 'package:tribot/screen/widgets/custom_loading.dart';
import 'package:tribot/screen/widgets/onboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    Future.delayed(Duration(seconds: 2), () {
     Get.off(() =>
          Pref.showOnboarding ? const OnboardingScreen() : const HomeScreen());
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          Center(
            child: Container(
              height: 200,
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                    child: Image.asset(
                  "images/logo.png",
                  scale: 2,
                )),
              ),
            ),
          ),
          const Spacer(),
          const CustomLoading()
        ],
      ),
    );
  }
}
