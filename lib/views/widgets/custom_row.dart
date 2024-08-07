import 'package:flutter/material.dart';
import 'package:movie_app/views/widgets/custom_text.dart';

class CustomRow extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomRow({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      trailing: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          width: 70,
          height: 30,
          child: const Center(
            child: CustomText(
              text: 'See All',
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fintSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
