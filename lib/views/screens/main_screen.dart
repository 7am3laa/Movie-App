import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/views/screens/bookmark_screen.dart';
import 'package:movie_app/views/screens/moive_screen.dart';
import 'package:movie_app/views/screens/search_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MovieController controller = Get.find();
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: const [
            MovieScreen(),
            SearchScreen(),
            BookmarkScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.changeIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'Movie',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Bookmark',
            ),
          ],
        ),
      );
    });
  }
}
