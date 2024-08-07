class Category {
  final String name;

  Category({required this.name});
}

class CategoriesList {
  List<Category> categories = [
    Category(name: 'Action'),
    Category(name: 'Comedy'),
    Category(name: 'Drama'),
    Category(name: 'Horror'),
    Category(name: 'Thriller'),
  ];
}
