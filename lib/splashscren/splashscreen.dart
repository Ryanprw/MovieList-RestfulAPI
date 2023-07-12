import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../BottomNav/bottom_nav.dart';

import '../theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset("assets/logo.png")),
              const SizedBox(
                height: 45,
              ),
              Text(
                "Watch movies in\nVirtual Reality",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    color: whiteColor,
                    fontSize: 34,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Download and watch offline\nwherever you are",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  color: greyColor,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 46,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BottomNav()));
                },
                child: Container(
                  height: 55,
                  width: 220,
                  decoration: BoxDecoration(
                    color: creamColor,
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Get Started",
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                          color: whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
