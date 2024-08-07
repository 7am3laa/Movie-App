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
      icon: Icons.filter_drama,
    ),
    DrawerModel(
      title: 'Now Playing',
      api: 'now_playing',
      icon: Icons.search,
    ),
    DrawerModel(
      title: 'Popular',
      api: 'popular',
      icon: Icons.person,
    ),
    DrawerModel(
      title: 'Upcoming',
      api: 'upcoming',
      icon: Icons.settings,
    ),
  ];
}
