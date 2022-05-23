

import 'package:flutter/material.dart';
import 'package:movies/products/popular_movies.dart';
import 'package:movies/screens/details_page.dart';
import 'package:movies/screens/main_page.dart';

class RouteGenerator {
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const MainPage());

      case '/detailsPage':
        return MaterialPageRoute(builder: (context) =>  DetailsPage(data: settings.arguments as PopularMovies,));

      
    }
    return null;
  }
}
