import 'package:flutter/material.dart';
import 'package:wattfood/add_recipe_sheet.dart';
import 'package:wattfood/app_colors.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: const Align(
        alignment:  Alignment.topLeft,
        child: Padding(padding: EdgeInsetsGeometry.all(16.0),
        child: Text('Welcome to your recipe app',
        style: TextStyle(fontSize: 18,
        color: AppColors.darkText
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context, isScrollControlled: true, backgroundColor: AppColors.cream,
           builder: (context) => const AddRecipeSheet(),
          );
        },
        backgroundColor: AppColors.accent,
        foregroundColor: AppColors.cream,
        child: const Icon(Icons.add),
      )
         
    );
  }
}