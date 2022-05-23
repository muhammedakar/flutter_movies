import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/products/popular_movies.dart';

import '../constants/color_constants.dart';

class CarouselSliderr extends StatelessWidget {
  final List<PopularMovies> data;
  const CarouselSliderr({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
          height: 310.0.h,
          autoPlay: true,
        ),
        items: data.map((e) {
          return Builder(builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, "/detailsPage", arguments: e),
                child: Stack(
                  children: [
                    Container(
                      height: 310.h,
                      width: 380.w,
                      decoration: BoxDecoration(
                          color: Clr.red,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://image.tmdb.org/t/p/original" +
                                      e.posterPath))),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: BlurryContainer(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.play_circle_fill_rounded,
                                color: Clr.darkRed,
                                size: 30,
                              ),
                              const SizedBox(
                                width: 9,
                              ),
                              Text(
                                e.title,
                                style:
                                    GoogleFonts.bebasNeue(color: Clr.darkRed),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        }).toList());
  }
}
