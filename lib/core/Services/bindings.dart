import 'package:get/get.dart';
import 'package:movie_app/controllers/bookmark_controller.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/controllers/search_controller.dart';



class IinitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieController());
    Get.lazyPut(() => SearchScreenController());
    Get.lazyPut(() => BookmarkScreenController());
  }
}
