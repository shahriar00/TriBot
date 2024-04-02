import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tribot/helper/pref.dart';
import 'package:tribot/screen/homescreen.dart';
import 'package:tribot/screen/onboard_screen.dart';
import 'package:tribot/screen/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Pref.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return GetMaterialApp(
        title: 'TriBot',
        debugShowCheckedModeBanner: false,

        themeMode: Pref.defaultTheme,

        // dark theme .....................
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme( 
            elevation: 1,
            centerTitle: true,
      
            titleTextStyle: TextStyle( 
              color: Colors.blueGrey,fontSize: 20,fontWeight: FontWeight.bold
            )
          ),
          useMaterial3: false,
        ),




        // light theme .....................
        theme: ThemeData(
          appBarTheme: const AppBarTheme( 
            elevation: 1,
            centerTitle: true,
     
            titleTextStyle: TextStyle( 
              color: Colors.blueGrey,fontSize: 20,fontWeight: FontWeight.bold
            )
          ),
          useMaterial3: false,
        ),


        home: const OnboardingScreen());
  }
}


extension AppTheme on ThemeData {
  //light text color
  Color get lightTextColor =>
      brightness == Brightness.dark ? Colors.white70 : Colors.black54;

  //button color
  Color get buttonColor =>
      brightness == Brightness.dark ? Colors.cyan.withOpacity(.5) : Colors.blue;
}