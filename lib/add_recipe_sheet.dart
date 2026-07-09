import 'package:flutter/material.dart';
import 'package:wattfood/app_colors.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';



class AddRecipeSheet extends StatefulWidget{
  const AddRecipeSheet ({super.key});

  @override
  State<AddRecipeSheet> createState() => _AddRecipeSheetState();
}

  class _AddRecipeSheetState extends State<AddRecipeSheet> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ingredientsController = TextEditingController();
  String? _pickedImagePath;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _pickedImagePath = image.path;
      });
    }
  }

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
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.beige,
              borderRadius: BorderRadius.circular(12),
            ),
            child: _pickedImagePath == null
                ? const Center(
                    child: Icon(Icons.add_a_photo, size: 32, color: AppColors.darkText),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(File(_pickedImagePath!), fit: BoxFit.cover),
                  ),
          ),
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