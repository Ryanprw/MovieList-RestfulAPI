import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_movie/theme.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                  "https://i.pinimg.com/originals/ba/fb/02/bafb02c9862fc646fefd58798a830771.jpg"),
            ),
            const SizedBox(height: 20),
            itemProfile('Name', 'Muhammad Ryan', CupertinoIcons.person),
            const SizedBox(height: 10),
            itemProfile(
                'Address', 'Jakarta, Indonesia', CupertinoIcons.location),
            const SizedBox(height: 10),
            itemProfile('Email', 'ryanprwdev@gmail.com', CupertinoIcons.mail),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    backgroundColor: pinkColor),
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        title: Text(
          title,
          style: GoogleFonts.openSans(
            color: whiteColor,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: hintColor),
        ),
        leading: Icon(
          iconData,
          color: whiteColor,
        ),
        trailing: Icon(
          Icons.arrow_forward,
          color: whiteColor,
        ),
      ),
    );
  }
}
