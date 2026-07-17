class Recipe {
  final String name;
  final String ingredients;
  final List<String> steps;
  final String? imagePath;

  Recipe({
    required this.name,
    required this.ingredients,
    required this.steps,
    this.imagePath,
  });
}
