import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomBtn({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              elevation: 0,
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              minimumSize: Size(MediaQuery.of(context).size.width * .4, 50)),
          onPressed: onTap,
          child: Text(text)),
    );
  }
}