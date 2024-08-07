import 'package:flutter/material.dart';

class DrawerModel {
  final String title;
  final String api;
  final IconData icon;

  DrawerModel({
    required this.title,
    required this.api,
    required this.icon,
  });
}

class DrawerList {
  List<DrawerModel> drawerList = [
    DrawerModel(
      title: 'Top Rated',
      api: 'top_rated',
      icon: Icons.trending_up,
    ),
    DrawerModel(
      title: 'Now Playing',
      api: 'now_playing',
      icon: Icons.play_circle_outlined,
    ),
    DrawerModel(
      title: 'Popular',
      api: 'popular',
      icon: Icons.movie_filter_rounded,
    ),
    DrawerModel(
      title: 'Upcoming',
      api: 'upcoming',
      icon: Icons.upcoming_rounded,
    ),
  ];
}
