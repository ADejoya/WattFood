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
  final List<TextEditingController> _stepControllers = [TextEditingController()];
  final List<bool> _stepChecked = [false];

// for image picker
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _pickedImagePath = image.path;
      });
    }
  }
//for cooking steps
  void _addStep() {
  setState(() {
    _stepControllers.add(TextEditingController());
    _stepChecked.add(false);
  });
}
//removing step
void _removeStep(int index) {
  setState(() {
    _stepControllers[index].dispose();
    _stepControllers.removeAt(index);
    _stepChecked.removeAt(index);
  });
}

@override
void dispose() {
  _nameController.dispose();
  _ingredientsController.dispose();
  for (final c in _stepControllers) {
    c.dispose();
  }
  super.dispose();
}


 @override
Widget build(BuildContext context) {
  return Padding(
  padding: const EdgeInsets.all(40.0),
  child: SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
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
        ),
        const SizedBox(height: 16,),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text('Steps', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        const SizedBox(height: 8),
        Column(
          children: List.generate(_stepControllers.length, (index) {
            return Row(
              children: [
                Checkbox(
                  value: _stepChecked[index],
                  onChanged: (value) {
                    setState(() {
                      _stepChecked[index] = value ?? false;
                    });
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _stepControllers[index],
                    decoration: InputDecoration(
                      hintText: 'Step ${index + 1}',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () => _removeStep(index),
                ),
              ],
            );
          }),
        ),
        TextButton.icon(
          onPressed: _addStep,
          icon: const Icon(Icons.add),
          label: const Text('Add step'),
        ),
       ],
      ),
    ),
  );
}
}
