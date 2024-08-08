import 'package:get/get.dart';
import 'package:movie_app/core/Services/database_service.dart';
import 'package:movie_app/models/movie_model.dart';

class BookmarkScreenController extends GetxController {
  DatabaseService databaseService = DatabaseService();

  RxList<MovieModel> bookedMovies = <MovieModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadBookmarks();
  }

  Future<void> loadBookmarks() async {
    final movies = await databaseService.getMovies();
    bookedMovies.value = movies;
  }

  void bookmark(MovieModel movie) async {
    await databaseService.insert(movie);
    loadBookmarks();
  }

  void delete(int movieId) async {
    await databaseService.delete(movieId);
    loadBookmarks();
  }

  bool isBookmarked(int movieId) {
    return bookedMovies.any((movie) => movie.id == movieId);
  }

  Future<void> deleteAll() async {
    await databaseService.deleteAll();
    loadBookmarks();
  }
}
