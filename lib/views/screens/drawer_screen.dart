import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/models/drawer_model.dart';
import 'package:movie_app/views/screens/all_items_screen.dart';
import 'package:movie_app/views/widgets/custom_text.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MovieController controller = Get.find();
    DrawerList drawerLists = DrawerList();

    return Drawer(
      backgroundColor: const Color(0xff006783),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/movie.png',
                    fit: BoxFit.fill,
                    height: 100,
                    width: 100,
                  ),
                  const CustomText(
                    text: 'Movie App',
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fintSize: 24,
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.white,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomText(
              text: 'Categories',
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fintSize: 20,
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: drawerLists.drawerList.length,
              itemBuilder: (context, index) {
                DrawerModel drawer = drawerLists.drawerList[index];
                return ListTile(
                  title: CustomText(
                    text: drawer.title,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fintSize: 16,
                  ),
                  leading: Icon(
                    drawer.icon,
                    color: Colors.white,
                  ),
                  onTap: () async {
                    controller.drawerList.clear();
                    await controller.getMovies(drawer.api);
                    Get.to(
                      () => AllItemsScreen(
                        name: drawer.title,
                        items: controller.drawerList,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomText(
                text: 'Movie App v 1.0.0',
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fintSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
