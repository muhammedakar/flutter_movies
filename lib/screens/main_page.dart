import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/constants/color_constants.dart';
import 'package:movies/products/popular_movies.dart';
import 'package:movies/services/popular_movies_request.dart';
import 'package:movies/widgets/bottom_navigation.dart';
import 'package:movies/widgets/carousel_slider.dart';
import 'package:movies/widgets/main_appbar.dart';
import 'package:movies/widgets/sub_list.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
    );
    PopularRequest request = PopularRequest();
    return Scaffold(
      bottomNavigationBar: const BottomNav(),
      backgroundColor: Clr.black,
      body: SingleChildScrollView(
        child: Center(
            child: FutureBuilder<List<PopularMovies>>(
                future: request.moviesList("popular"),
                builder: (context, snapshot) {
                  List<PopularMovies>? data = snapshot.data;
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        const MainAppBar(),
                        CarouselSliderr(
                          data: data!,
                        ),
                        SubTitle(
                          data: data,
                          title: "Popular Movies",
                        ),
                        FutureBuilder<List<PopularMovies>>(
                            future: request.moviesList("top_rated"),
                            builder: (context, snapshot) {
                              List<PopularMovies>? data = snapshot.data;
                              if (snapshot.hasData) {
                                return SubTitle(
                                  data: data!,
                                  title: "Top Rated Movies",
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            }),
                        FutureBuilder<List<PopularMovies>>(
                            future: request.moviesList("upcoming"),
                            builder: (context, snapshot) {
                              List<PopularMovies>? data = snapshot.data;
                              if (snapshot.hasData) {
                                return SubTitle(
                                  data: data!,
                                  title: "Upcoming Movies",
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            }),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })),
      ),
    );
  }
}
