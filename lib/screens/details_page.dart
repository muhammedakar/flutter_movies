import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/products/popular_movies.dart';
import 'package:movies/widgets/bottom_navigation.dart';

import '../constants/color_constants.dart';
import '../widgets/appbar_wid.dart';
import '../widgets/cover_title.dart';

class DetailsPage extends StatelessWidget {
  final PopularMovies data;
  const DetailsPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNav(),
      backgroundColor: Clr.black,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Hero(
                  tag: data.id,
                  child: Image.network(
                    "https://image.tmdb.org/t/p/original" + data.posterPath,
                    fit: BoxFit.fitHeight,
                    height: 813.h / 1.4,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppBarWid(),
                    CoverTitle(
                      data: data,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
