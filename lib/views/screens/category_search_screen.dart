import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/search_controller.dart';
import 'package:movie_app/models/movie_search_model.dart';
import 'package:movie_app/views/widgets/custom_text.dart';

class CategorySearchScreen extends StatelessWidget {
  final String category;
  const CategorySearchScreen({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchScreenController controller = Get.find();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.searchMovies(category);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('$category Movies'),
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.collectionsList.isEmpty) {
            return const Center(child: Text('No movies found'));
          }

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.5,
            ),
            itemCount: controller.collectionsList.length,
            itemBuilder: (context, index) {
              MovieSearchModel movie = controller.collectionsList[index];
              return Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 300,
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(
                        text: movie.name,
                        fintSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
