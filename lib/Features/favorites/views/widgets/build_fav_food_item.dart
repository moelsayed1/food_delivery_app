import 'package:flutter/material.dart';

class BuildFavFoodItem extends StatelessWidget {
  const BuildFavFoodItem({
    super.key,
    this.name,
    this.description,
    this.price,
    this.imagePath,
  });

  final String? name, description, price, imagePath;

  @override
  Widget build(BuildContext context) {
    return  Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  imagePath!,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.favorite_border, color: Colors.white),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  description!,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price!,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.orangeAccent,
                      child: Icon(Icons.add, color: Colors.white, size: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
