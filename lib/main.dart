import 'package:flutter/material.dart';
import 'dart:convert';
import 'recipe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: RecipeScreen(),
    );
  }
}

class RecipeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Step 1: Create a Recipe object
    Recipe recipe = Recipe(
      title: 'Spaghetti Carbonara',
      description: 'A classic Italian pasta dish with creamy sauce.',
      ingredients: ['Spaghetti', 'Eggs', 'Parmesan', 'Pancetta', 'Pepper'],
      duration: 20,
    );

    // Step 2: Serialize the Recipe object to JSON
    String jsonString = jsonEncode(recipe.toJson());
    print('Serialized JSON: $jsonString');

    // Step 3: Deserialize the JSON string back to a Recipe object
    Map<String, dynamic> recipeMap = jsonDecode(jsonString);
    Recipe newRecipe = Recipe.fromJson(recipeMap);
    print('Deserialized Recipe: ${newRecipe.title}, ${newRecipe.description}');

    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe App'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Original Recipe:",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Title: ${recipe.title}"),
            Text("Description: ${recipe.description}"),
            Text("Ingredients: ${recipe.ingredients.join(', ')}"),
            Text("Duration: ${recipe.duration} minutes"),
            SizedBox(height: 20),
            Text("Serialized JSON:",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text(jsonString),
            SizedBox(height: 20),
            Text("Deserialized Recipe:",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Title: ${newRecipe.title}"),
            Text("Description: ${newRecipe.description}"),
            Text("Ingredients: ${newRecipe.ingredients.join(', ')}"),
            Text("Duration: ${newRecipe.duration} minutes"),
          ],
        ),
      ),
    );
  }
}
