import 'package:get/get.dart';
import 'package:movie_app/Services/movie_services.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/models/movie_search_model.dart';

class SearchScreenController extends GetxController {
  RxString searchText = ''.obs;
  RxList<MovieSearchModel> collectionsList = <MovieSearchModel>[].obs;
  RxList<MovieModel> listMovies = <MovieModel>[].obs;
  RxBool isLoading = false.obs;
  final MovieServices movieServices = MovieServices();

  Future<void> searchMovies(String query) async {
    try {
      isLoading.value = true;
      final movies = await movieServices.searchCollections(query);
      collectionsList.value = movies;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getMovies(String query) async {
    try {
      isLoading.value = true;
      final movies = await movieServices.searchByMovie(query);
      listMovies.value = movies;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
