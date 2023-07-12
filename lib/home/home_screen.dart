import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_movie/theme.dart';
import 'package:list_movie/widgets/card_movies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _categories = [
    "Movies",
    "Tv Series",
    "Documentary",
    "Sports"
  ];

  int _isSelected = 0;

  @override
  Widget build(BuildContext context) {
    Widget categories(int index) {
      return InkWell(
        onTap: () {
          setState(() {
            _isSelected = index;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Text(
            _categories[index],
            style: GoogleFonts.lato(fontSize: 16, color: pinkColor),
          ),
        ),
      );
    }

    Widget listCategories() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            children: _categories
                .asMap()
                .entries
                .map((MapEntry map) => categories(map.key))
                .toList()),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 36,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Text(
                    "Find Movies, Tv series,\nand more..",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.lato(
                      fontSize: 24,
                      color: whiteColor,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Material(
                color: searchColor,
                borderRadius: BorderRadius.circular(20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "Search Movies",
                    hintStyle: TextStyle(color: hintColor),
                    prefixIcon: Icon(
                      Icons.search,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            listCategories(),
            const SizedBox(
              height: 24,
            ),
            Expanded(child: CardScreen())
          ],
        ),
      ),
    );
  }
}
