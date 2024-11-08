// lib/recipe.dart
class Recipe {
  String title;
  String description;
  List<String> ingredients;
  int duration;

  Recipe({
    required this.title,
    required this.description,
    required this.ingredients,
    required this.duration,
  });

  // Convert a Recipe object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'ingredients': ingredients,
      'duration': duration,
    };
  }

  // Create a Recipe object from a JSON map
  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'],
      description: json['description'],
      ingredients: List<String>.from(json['ingredients']),
      duration: json['duration'],
    );
  }
}
