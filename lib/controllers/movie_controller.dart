// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:movie_app/Services/movie_services.dart';
import 'package:movie_app/models/movie_model.dart';

class MovieController extends GetxController {
  MovieServices movieServices = MovieServices();
  RxList<MovieModel> movieListnow = <MovieModel>[].obs;
  RxList<MovieModel> movieListup = <MovieModel>[].obs;
  RxList<MovieModel> genreMovies = <MovieModel>[].obs;
  RxList<MovieModel> searchResults = <MovieModel>[].obs;
  RxString genreName = ''.obs;
  RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  Future<void> getNowPlayingMovies() async {
    try {
      final movies = await movieServices.getNowPlayingMovies();
      movieListnow.value = movies;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<void> getUpcomingMovies() async {
    try {
      final movies = await movieServices.getUpcomingMovies();
      movieListup.addAll(movies);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  String getGenreName(int genreId) {
    final Map<int, String> genreNames = {
      28: "Action",
      12: "Adventure",
      16: "Animation",
      35: "Comedy",
      80: "Crime",
      99: "Documentary",
      18: "Drama",
      10751: "Family",
      14: "Fantasy",
      36: "History",
      27: "Horror",
      10402: "Music",
      9648: "Mystery",
      10749: "Romance",
      878: "Science Fiction",
      10770: "TV Movie",
      53: "Thriller",
      10752: "War",
      37: "Western",
    };

    return genreNames[genreId] ?? 'Unknown Genre';
  }
}
