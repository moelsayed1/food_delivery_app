import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/widgets/food_item_cards.dart';

class FoodCardList extends StatelessWidget {
  final List<Map<String, dynamic>> foodItems = [
    {
      'image': 'assets/images/dimsum.jpg',
      'title': 'Special Dimsum',
      'description': 'With meat filling'
    },
    {
      'image': 'assets/images/pizza2.jpg',
      'title': 'Special Pizza',
      'description': 'With tomato sauce'
    },
    {
      'image': 'assets/images/meat.jpg',
      'title': 'Special Meat',
      'description': 'With meat filling'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.transparent,
      child: ListView.builder( // Use ListView.builder for horizontal scrolling
        scrollDirection: Axis.horizontal, // Make it scroll horizontally
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          return Container( // Wrap FoodItemCard with a Container for sizing
            width: 200, // Set a fixed width for each card (adjust as needed)
            margin: EdgeInsets.only(right: 12.0), // Add spacing between cards
            child: FoodItemCard(
              image: foodItems[index]['image'],
              title: foodItems[index]['title'],
              description: foodItems[index]['description'],
            ),
          );
        },
      ),
    );
  }
}