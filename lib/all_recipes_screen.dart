import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:wattfood/app_colors.dart';
import 'package:wattfood/recipe.dart';
import 'package:wattfood/recipe_detail_screen.dart';

class AllRecipesScreen extends StatefulWidget {
  final List<Recipe> recipes;
  final void Function(int index) onDelete;
  final Future<void> Function(int index) onEdit;
  const AllRecipesScreen({
    super.key,
    required this.recipes,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  State<AllRecipesScreen> createState() => _AllRecipesScreenState();
}

class _AllRecipesScreenState extends State<AllRecipesScreen> {
  @override
  Widget build(BuildContext context) {
    final recipes = widget.recipes;
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        title: const Text('All Recipes'),
        backgroundColor: AppColors.cream,
      ),
      body: recipes.isEmpty
          ? const Center(child: Text('No recipes yet'))
          : ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return Slidable(
                  key: ValueKey('${recipe.name}_$index'),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (_) async {
                          await widget.onEdit(index);
                          setState(() {});
                        },
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: 'Edit',
                      ),
                      SlidableAction(
                        onPressed: (_) {
                          widget.onDelete(index);
                          setState(() {});
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: recipe.imagePath != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              File(recipe.imagePath!),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const Icon(Icons.fastfood, size: 40),
                    title: Text(recipe.name),
                    subtitle: Text('${recipe.steps.length} steps'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RecipeDetailScreen(recipe: recipe)),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
