import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/products/popular_movies.dart';

import '../constants/color_constants.dart';

class SubTitle extends StatelessWidget {
  final List<PopularMovies> data;
  final String title;
  const SubTitle({Key? key, required this.data, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 12, right: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                title,
                style: GoogleFonts.bebasNeue(color: Clr.white, fontSize: 25),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Clr.red,
              )
            ],
          ),
        ),
        SizedBox(
          height: 170.h,
          child: ListView.builder(
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.pushNamed(context, "/detailsPage",arguments: data[index]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Hero(
                      tag: data[index].id,
                      child: Container(
                        height: 170.h,
                        width: 105.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Clr.white,
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/original" +
                                        data[index].posterPath),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
