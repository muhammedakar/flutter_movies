import 'package:auto_size_text/auto_size_text.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/color_constants.dart';
import '../products/popular_movies.dart';

class CoverTitle extends StatelessWidget {
  final PopularMovies data;
  const CoverTitle({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Column(
        children: [
          BlurryContainer(
            width: 393.w,
            blur: 8,
            borderRadius: BorderRadius.zero,
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AutoSizeText(
                    data.title,
                    maxLines: 1,
                    style: GoogleFonts.bebasNeue(
                        color: Clr.white,
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Container(
                          height: 30.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              color: Clr.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(7)),
                          child: Center(
                              child: AutoSizeText(
                            data.originalTitle,
                            maxLines: 1,
                            style: GoogleFonts.bebasNeue(
                                color: Clr.white, fontSize: 19),
                          )),
                        ),
                      ),
                      Container(
                        height: 30.h,
                        width: 70.w,
                        decoration: BoxDecoration(
                            color: Clr.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(7)),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 4.0, right: 4),
                              child: Icon(
                                Icons.star_rate_rounded,
                                color: Colors.yellow,
                              ),
                            ),
                            Text(
                              data.voteAverage.toString(),
                              style: GoogleFonts.bebasNeue(
                                  color: Clr.white, fontSize: 22),
                            ),
                          ],
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          height: 30.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                              color: Clr.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(7)),
                          child: Center(
                              child: Text(
                            data.adult ? "+18" : "13+",
                            style: GoogleFonts.bebasNeue(
                                color: Clr.white, fontSize: 22),
                          )),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    data.overview,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style:
                        GoogleFonts.bebasNeue(color: Clr.white, fontSize: 20),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
