import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/views/screens/all_items_screen.dart';
import 'package:movie_app/views/widgets/custom_horizontal_movie_card.dart';
import 'package:movie_app/views/widgets/custom_row.dart';
import 'package:movie_app/views/widgets/custom_vertical_movie_card.dart';

import 'drawer_screen.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MovieController movieController = Get.find();
    movieController.getNowPlayingMovies();
    movieController.getUpcomingMovies();
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: AppBar(
        title: const Text('FilmKu'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CustomRow(
            title: 'Now Showing',
            onTap: () {
              Get.to(
                () => AllItemsScreen(
                  name: 'Now Showing',
                  items: movieController.movieListnow,
                ),
              );
            },
          ),
          Obx(() {
            if (movieController.movieListnow.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return SizedBox(
              height: 340,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  MovieModel movie = movieController.movieListnow[index];
                  return CustomVerticalMovieCard(movie: movie);
                },
              ),
            );
          }),
          CustomRow(
            title: 'Popular',
            onTap: () {
              Get.to(() => AllItemsScreen(
                    name: 'Popular',
                    items: movieController.movieListup,
                  ));
            },
          ),
          Obx(() {
            if (movieController.movieListup.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  MovieModel movie = movieController.movieListup[index];
                  return CustomHorizontalMovieCard(movie: movie);
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
