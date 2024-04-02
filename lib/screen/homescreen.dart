import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tribot/api/api_data.dart';
import 'package:tribot/helper/pref.dart';
import 'package:tribot/screen/widgets/home_card.dart';
import 'package:tribot/screen/widgets/home_type.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
final isDarkMode = Pref.isDarkMode.obs;
  @override
  Widget build(BuildContext context) {
    APIs.getAnswer("how are you?");
    return Scaffold(

        appBar: AppBar(
          backgroundColor:const Color(0xFFEEEEEE),
          title: const Text(
            "TriBot",
            style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold, color: Colors.blueGrey),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {
                    Get.changeThemeMode(isDarkMode.value? ThemeMode.light : ThemeMode.dark);

                    isDarkMode.value = !isDarkMode.value;
                    Pref.isDarkMode = !isDarkMode.value;
                  },
                   icon: Obx(() => Icon(
                   isDarkMode.value
                      ? Icons.brightness_2_rounded
                      : Icons.brightness_5_rounded,
                  size: 26,color: Colors.black,)))
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: HomeType.values
                .map((e) => HomeCard(
                      homeType: e,
                    ))
                .toList(),
          ),
        ),

        floatingActionButton: Container(
          alignment: Alignment.bottomCenter,
          child: Lottie.asset(
                    "lottie/home_logo.json",height: Get.height/3.20
                   
                  ),
        ),
        
        
        );

        
  }
  
}
