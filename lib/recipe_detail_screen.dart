import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wattfood/app_colors.dart';
import 'package:wattfood/recipe.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        title: Text(recipe.name),
        backgroundColor: AppColors.cream,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          if (recipe.imagePath != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                File(recipe.imagePath!),
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          const SizedBox(height: 16),
          Text(
            recipe.name,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.darkText),
          ),
          const SizedBox(height: 16),
          const Text('Ingredients', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(recipe.ingredients),
          const SizedBox(height: 16),
          const Text('Steps', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...recipe.steps.asMap().entries.map(
                (entry) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text('${entry.key + 1}. ${entry.value}'),
                ),
              ),
        ],
      ),
    );
  }
}
