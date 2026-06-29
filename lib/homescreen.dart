import 'package:flutter/material.dart';
import 'package:wattfood/carousel_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 220, 137, 20),
        title: const Text('WattFood'),
        titleTextStyle: const TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
                ),
              ),// appbar styling
                  body: Column(
                  children: [
          const SizedBox(height: 16),
          FoodCarousel(),//sliding pictures home
          const SizedBox(height: 16),
          
          TextButton(
            onPressed: () {},
            child: const Text(
              'Forgot Password?',
              style: TextStyle(
              color: Color.fromARGB(217, 255, 0, 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}