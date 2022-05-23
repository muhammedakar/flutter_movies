import 'package:dio/dio.dart';
import 'package:movies/products/popular_movies.dart';

class PopularRequest {
  String apiToken= ""; // you can take api-key in this link https://www.themoviedb.org/
  String url(String category) => "https://api.themoviedb.org/3/movie/$category?api_key=$apiToken&language=tr"; 

  Future<List<PopularMovies>> moviesList(String category) async {
    Response response = await Dio().get(url(category));
    final List result = response.data["results"];

    return result
        .map((e) => PopularMovies.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  
}
