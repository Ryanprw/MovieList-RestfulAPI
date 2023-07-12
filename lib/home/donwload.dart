import 'package:flutter/material.dart';
import 'package:list_movie/theme.dart';
import 'package:lottie/lottie.dart';

class Downloads extends StatelessWidget {
  const Downloads({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Center(
        child: Lottie.asset(
          'assets/monkey.json',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
