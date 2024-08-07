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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 30,
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.blue[100],
                          ),
                          child: CustomText(
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
                child: controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : controller.listMovies.isEmpty
                        ? const Center(
                            child: CustomText(text: 'No movies found'),
                          )
                        : ListView.builder(
                            itemCount: controller.listMovies.length,
                            itemBuilder: (context, index) {
                              MovieModel movie = controller.listMovies[index];
                              return CustomHorizontalMovieCard(movie: movie);
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
