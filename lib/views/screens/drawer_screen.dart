import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/models/drawer_model.dart';
import 'package:movie_app/views/screens/all_items_screen.dart';
import 'package:movie_app/views/widgets/custom_text.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DrawerList drawerLists = DrawerList();
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: drawerLists.drawerList.length,
              itemBuilder: (context, index) {
                DrawerModel drawer = drawerLists.drawerList[index];
                return ListTile(
                  title: CustomText(
                    text: drawer.title,
                    fontWeight: FontWeight.w500,
                  ),
                  leading: Icon(drawer.icon),
                  onTap: () {
                    // Get.to(() => AllItemsScreen(name: drawer.title,));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
