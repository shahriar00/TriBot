import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tribot/screen/widgets/home_type.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;
  HomeCard({super.key,required this.homeType});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: homeType.onTap,
      child: Card(
        color: Colors.blueGrey,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ 
            Lottie.asset("lottie/${homeType.image}",width: deviceWidth*.35),
            
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child:  Text(homeType.title,style:const TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
            ),
      
          ],
        ),
      ),
    );
  }
}