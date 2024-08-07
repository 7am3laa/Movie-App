import 'package:flutter/material.dart';
import 'package:movie_app/views/widgets/custom_horizontal_movie_card.dart';

class AllItemsScreen extends StatelessWidget {
  final List items;
  final String name;
  const AllItemsScreen({Key? key, required this.items, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CustomHorizontalMovieCard(movie: items[index]);
        },
      ),
    );
  }
}
