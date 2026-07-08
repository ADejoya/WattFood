import 'package:flutter/material.dart';
import 'package:wattfood/add_recipe_sheet.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wattfood'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 200, 185, 51),
        titleTextStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
      ),
      body: const Align(
        alignment:  Alignment.topLeft,
        child: Padding(padding: EdgeInsetsGeometry.all(16.0),
        child: Text('Welcome to your recipe app',
        style: TextStyle(fontSize: 18,),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context, isScrollControlled: true, builder: (context) => const AddRecipeSheet(),
          );
        },
        child: const Icon(Icons.add),
      )
         
    );
  }
}