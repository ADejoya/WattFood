import 'package:flutter/material.dart';


class AddRecipeSheet extends StatefulWidget{
  const AddRecipeSheet ({super.key});

  @override
  State<AddRecipeSheet> createState() => _AddRecipeSheetState();
}

  class _AddRecipeSheetState extends State<AddRecipeSheet> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ingredientsController = TextEditingController();

 @override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(40.0),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
            ),
            const Text(
              'Add Recipe',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.check),
            ),
          ],
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            labelText: 'Food name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16,),
        TextField(
          controller: _ingredientsController,
          maxLines: 5,
          minLines: 3,
          decoration: const InputDecoration(
            labelText: 'Ingridients',
            border: OutlineInputBorder()
          ),
        )
      ],
    ),
  );
}
}