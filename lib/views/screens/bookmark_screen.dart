import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/bookmark_controller.dart';
import 'package:movie_app/views/widgets/custom_horizontal_movie_card.dart';
import 'package:movie_app/views/widgets/custom_text.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BookmarkScreenController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Bookmarks',
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
        centerTitle: true,
        elevation: 5,
        actions: [
          IconButton(
            onPressed: () {
              controller.deleteAll();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Obx(
        () => controller.bookedMovies.isEmpty
            ? const Center(
                child: CustomText(
                  text: 'No Movies Saved yet',
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              )
            : ListView.builder(
                itemCount: controller.bookedMovies.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(10),
                    elevation: 10,
                    child: Slidable(
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              controller
                                  .delete(controller.bookedMovies[index].id);
                            },
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: CustomHorizontalMovieCard(
                        movie: controller.bookedMovies[index],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
