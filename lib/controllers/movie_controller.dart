import 'package:get/get.dart';
import 'package:movie_app/models/movie_model.dart';
import '../core/Services/movie_services.dart';

class MovieController extends GetxController {
  MovieServices movieServices = MovieServices();
  RxList<MovieModel> nowShowingList = <MovieModel>[].obs;
  RxList<MovieModel> popularList = <MovieModel>[].obs;
  RxList<MovieModel> drawerList = <MovieModel>[].obs;

  RxString genreName = ''.obs;
  RxInt currentIndex = 0.obs;
  void changeIndex(int index) {
    currentIndex.value = index;
  }

  Future<void> getNowShowingMovies() async {
    try {
      final movies = await movieServices.getMovies('now_playing');
      nowShowingList.value = movies;
    } on Exception catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }

  Future<void> getPopularMovies() async {
    try {
      final movies = await movieServices.getMovies('upcoming');
      popularList.value = movies;
    } on Exception catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }

  Future<void> getMovies(String category) async {
    try {
      final movies = await movieServices.getMovies(category);
      drawerList.value = movies;
    } on Exception catch (e) {
      throw Exception('Error fetching movies: $e');
    }
  }
}
