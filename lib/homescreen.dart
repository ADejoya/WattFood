import 'package:flutter/material.dart';
import 'package:wattfood/add_recipe_sheet.dart';
import 'package:wattfood/all_recipes_screen.dart';
import 'package:wattfood/app_colors.dart';
import 'package:wattfood/recipe.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Recipe> _recipes = [];

  void _deleteRecipe(int index) {
    setState(() {
      _recipes.removeAt(index);
    });
  }

  Future<void> _editRecipe(int index) async {
    final updated = await showModalBottomSheet<Recipe>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.cream,
      builder: (context) => AddRecipeSheet(existingRecipe: _recipes[index]),
    );
    if (updated != null) {
      setState(() {
        _recipes[index] = updated;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        title: const Text('Wattfood'),
        centerTitle: true,
        backgroundColor: AppColors.cream,
        titleTextStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color:AppColors.darkText
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AllRecipesScreen(
                  recipes: _recipes,
                  onDelete: _deleteRecipe,
                  onEdit: _editRecipe,
                ),
              ),
            );
          },
          child: Container(
            width: 150,
            height: 100,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.darkText,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.all_inbox, color: Colors.white, size: 26),
                    Text(
                      '${_recipes.length}',
                      style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Spacer(),
                const Text('All', style: TextStyle(color: Colors.white, fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final recipe = await showModalBottomSheet<Recipe>(
            context: context,
            isScrollControlled: true,
            backgroundColor: AppColors.cream,
            builder: (context) => const AddRecipeSheet(),
          );
          if (recipe != null) {
            setState(() {
              _recipes.add(recipe);
            });
          }
        },
        backgroundColor: AppColors.accent,
        foregroundColor: AppColors.cream,
        child: const Icon(Icons.add),
      )

    );
  }
}