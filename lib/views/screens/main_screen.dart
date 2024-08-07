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
        bottomNavigationBar: Card(
          color: Colors.white,
          elevation: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  controller.changeIndex(0);
                },
                icon: Icon(
                  Icons.movie_outlined,
                  color: controller.currentIndex.value == 0
                      ? Colors.blue
                      : Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.changeIndex(1);
                },
                icon: Icon(
                  Icons.search_rounded,
                  color: controller.currentIndex.value == 1
                      ? Colors.blue
                      : Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.changeIndex(2);
                },
                icon: Icon(
                  Icons.bookmark_border_outlined,
                  color: controller.currentIndex.value == 2
                      ? Colors.blue
                      : Colors.black,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
