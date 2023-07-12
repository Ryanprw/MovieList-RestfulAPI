import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:list_movie/theme.dart';

// ignore: must_be_immutable
class CardScreen extends StatelessWidget {
  List<Map<String, dynamic>> allMovies = [];

  CardScreen({super.key});

  Future fecthMovie() async {
    try {
      var reponse = await http.get(Uri.parse(
          "https://api.themoviedb.org/3/discover/movie?api_key=fb5fd70af6f41a2152db147715931e0b"));
      List data =
          (json.decode(reponse.body) as Map<String, dynamic>)["results"];
      data.forEach((element) {
        allMovies.add(element);
      });
    } catch (e) {
      print("Terjadi Kesalahan");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fecthMovie(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: .66),
            itemCount: allMovies.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            primary: false,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: blackColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 210,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500" +
                                  allMovies[index]["poster_path"],
                            ),
                            fit: BoxFit.cover),
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: const ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            allMovies[index]["title"],
                            style: GoogleFonts.lato(
                                fontSize: 14, color: whiteColor),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            allMovies[index]["release_date"],
                            style: GoogleFonts.lato(color: whiteColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}
