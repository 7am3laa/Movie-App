import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/core/functions/trans_genre_id.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/views/screens/details_screen.dart';
import 'custom_text.dart';

class CustomHorizontalMovieCard extends StatelessWidget {
  final MovieModel movie;

  const CustomHorizontalMovieCard({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainFunctions mainFunctions = MainFunctions();
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailsScreen(movie: movie));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: movie.originalTitle.split(':').first,
                    fintSize: 18,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '${movie.voteAverage.toStringAsFixed(1)} / 10 IMDb',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
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
                    children: [
                      const Icon(Icons.alarm),
                      const SizedBox(width: 10),
                      Text(
                        movie.releaseDate,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
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
