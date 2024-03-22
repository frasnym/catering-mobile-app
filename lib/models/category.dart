class Category {
  final String title;
  final int id;

  Category({
    required this.id,
    required this.title,
  });
}

List<Category> categories = [
  Category(
    id: 1,
    title: 'Foods',
  ),
  Category(
    id: 2,
    title: 'Drinks',
  )
];
