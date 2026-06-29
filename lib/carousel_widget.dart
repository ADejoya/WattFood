import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
 //design ng sliding pictures
class FoodCarousel extends StatelessWidget {
  FoodCarousel({super.key});

  final List<String> items = [
    'images/adobo.jpg',
    'images/mechado.jpg',
    'images/sinigang.jpg',
  ];

 @override
  Widget build(BuildContext context) {
    
    return CarouselSlider(
      options: CarouselOptions(
        height: 180,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.80,
      ),
      items: items.map((item) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            item,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          );
      }).toList(),
    );
  }
}
