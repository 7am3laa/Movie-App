import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/bookmark_controller.dart';
import 'package:movie_app/core/functions/trans_genre_id.dart';
import 'package:movie_app/models/movie_model.dart';
import '../widgets/custom_text.dart';

class DetailsScreen extends StatelessWidget {
  final MovieModel movie;
  const DetailsScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BookmarkScreenController bookmarkScreenController = Get.find();
    final MainFunctions mainFunctions = MainFunctions();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.8),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 10,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 10,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomText(
                          text: movie.title.split(':').first,
                          fintSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Obx(() {
                        return IconButton(
                          onPressed: () {
                            if (!bookmarkScreenController
                                .isBookmarked(movie.id)) {
                              bookmarkScreenController.bookmark(movie);
                            } else {
                              bookmarkScreenController.delete(movie.id);
                            }
                          },
                          icon: Icon(
                            bookmarkScreenController.isBookmarked(movie.id)
                                ? Icons.bookmark
                                : Icons.bookmark_border_outlined,
                            color:
                                bookmarkScreenController.isBookmarked(movie.id)
                                    ? Colors.blue
                                    : Colors.grey,
                          ),
                        );
                      }),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      const SizedBox(width: 4),
                      Text(
                        '${movie.voteAverage.toStringAsFixed(1)} / 10 IMDb',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: [
                      for (var g in movie.genreIds)
                        Container(
                          width: 100,
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.blue[100],
                          ),
                          child: Center(
                            child: CustomText(
                              text: mainFunctions.getGenreName(g),
                              fintSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomColumn(
                        text1: 'Length',
                        text2: '2h 28min',
                      ),
                      CustomColumn(
                        text1: 'Language',
                        text2: movie.originalLanguage,
                      ),
                      CustomColumn(
                        text1: 'Rating',
                        text2: '${movie.voteCount}',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const CustomText(
                    text: 'Description',
                    fintSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 8),
                  CustomText(
                    text: movie.overview,
                    color: Colors.grey,
                    fintSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  const SizedBox(height: 16),
                  const CustomText(
                    text: 'Cast',
                    fintSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Cast information will be displayed here.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomColumn extends StatelessWidget {
  final String text1;
  final String text2;
  const CustomColumn({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: text1,
          color: Colors.grey,
          fintSize: 16,
          fontWeight: FontWeight.normal,
        ),
        CustomText(
          text: text2,
          fintSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ],
    );
  }
}
