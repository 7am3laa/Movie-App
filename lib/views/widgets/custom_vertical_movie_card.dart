import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/views/screens/details_screen.dart';

import '../../models/movie_model.dart';

class CustomVerticalMovieCard extends StatelessWidget {
  final MovieModel movie;
  const CustomVerticalMovieCard({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailsScreen(movie: movie));
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
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
                    'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              movie.originalTitle.split(':').first,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(Icons.star, color: Colors.yellow),
                const SizedBox(width: 4),
                Text('${movie.voteAverage.toStringAsFixed(1)} / 10 IMDb'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
