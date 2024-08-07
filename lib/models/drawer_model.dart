import 'package:flutter/material.dart';


class DrawerModel {
  final String title;
  final IconData icon;


  DrawerModel({
    required this.title,
    required this.icon,
  });
}

class DrawerList {
  List<DrawerModel> drawerList = [
    DrawerModel(
      title: 'Top Rated',
      icon: Icons.rate_review_outlined,
    ),
    DrawerModel(
      title: 'Now Playing',
      icon: Icons.search,
    ),
    DrawerModel(
      title: 'Popular',
      icon: Icons.person,
    ),
    DrawerModel(
      title: 'Upcoming',
      icon: Icons.settings,
    ),
  ];
}
