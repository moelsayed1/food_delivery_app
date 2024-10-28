import 'package:flutter/material.dart';
import 'package:food_delivery_app/Features/favorites/views/widgets/build_fav_food_item.dart';
import 'package:food_delivery_app/core/utils/app_bar_icons/app_bar_icons.dart';
import 'package:food_delivery_app/generated/assets.dart';

class FavoriteViewBody extends StatelessWidget {
   FavoriteViewBody({super.key});

  final List<Map<String, String>> foodItems = [
    {
      'name': 'Special Steak',
      'description': 'With meat filling',
      'price': '\$8.95',
      'image': Assets.imagesMeat, // Add your images in the assets folder
    },
    {
      'name': 'Special Pizza',
      'description': 'With tomato sauce',
      'price': '\$12.50',
      'image': Assets.imagesPizza,
    },
    {
      'name': 'Special Dimsum',
      'description': 'With meat filling',
      'price': '\$8.95',
      'image': Assets.imagesDimsum,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: AppBarIcons(
            title: 'Favorites',
          ),
          elevation: 0, // Use your custom app bar widget here
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 24,
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return BuildFavFoodItem(
                  name: foodItems[index]['name']!,
                  description: foodItems[index]['description']!,
                  price: foodItems[index]['price']!,
                  imagePath: foodItems[index]['image']!,
                );
              },
              childCount: foodItems.length,
            ),
          ),
        ),
      ],
    );
  }
}
