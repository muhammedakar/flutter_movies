import 'package:dio/dio.dart';
import 'package:movies/products/popular_movies.dart';

class PopularRequest {
  String url(String category) =>
      "https://api.themoviedb.org/3/movie/$category?{api-Key}=tr"; // you can take api-key in this link https://www.themoviedb.org/

  Future<List<PopularMovies>> moviesList(String category) async {
    Response response = await Dio().get(url(category));
    final List result = response.data["results"];

    return result
        .map((e) => PopularMovies.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  
}
