// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/search_controller.dart';
import 'package:movie_app/models/category.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/views/screens/category_search_screen.dart';
import 'package:movie_app/views/widgets/custom_horizontal_movie_card.dart';
import 'package:movie_app/views/widgets/custom_text.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchScreenController controller = Get.find();
    final CategoriesList categoriesList = CategoriesList();

    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Search',
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
        centerTitle: true,
      ),
      body: Obx(
        () {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for movies...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  onChanged: (query) {
                    if (query.isNotEmpty) {
                      controller.searchText.value = query;
                      controller.getMovies(query);
                    } else {
                      controller.collectionsList.clear();
                    }
                  },
                ),
              ),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesList.categories.length,
                  itemBuilder: (context, index) {
                    Category category = categoriesList.categories[index];
                    String label = category.name;
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          () => CategorySearchScreen(
                            category: label,
                          ),
                        );
                      },
                      child: Card(
                        margin: const EdgeInsets.all(10.0),
                        clipBehavior: Clip.antiAlias,
                        shadowColor: const Color(0xff006783),
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: const Color(0xff006783),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CustomText(
                            color: Colors.white,
                            text: label,
                            fintSize: 16.0,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: controller.searchText.value == ''
                    ? const Center(
                        child: CustomText(
                          text: 'search for movies',
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      )
                    : controller.isLoading.value
                        ? const Center(child: CircularProgressIndicator())
                        : controller.listMovies.isEmpty
                            ? const Center(
                                child: CustomText(
                                  text: 'No movies found',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                ),
                              )
                            : ListView.builder(
                                itemCount: controller.listMovies.length,
                                itemBuilder: (context, index) {
                                  MovieModel movie =
                                      controller.listMovies[index];
                                  return CustomHorizontalMovieCard(
                                    movie: movie,
                                  );
                                },
                              ),
              ),
            ],
          );
        },
      ),
    );
  }
}
