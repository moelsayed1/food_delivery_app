import 'package:flutter/material.dart';
import 'package:food_delivery_app/Features/order/presentation/views/widgets/build_order_item.dart';
import 'package:food_delivery_app/generated/assets.dart';

class BuildUpcomingOrders extends StatelessWidget {
  const BuildUpcomingOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2, // Replace with your actual upcoming orders count
      itemBuilder: (context, index) {
        return BuildOrderItem( // Call a helper function to build each item
          imagePath: Assets.imagesPizza, // Replace with your actual image path
          orderTitle: 'Red n hot pizza',
          orderDescription: 'Spicy chicken, beef',
          itemsCount: '1 Items',
          price: '\$8.95',
          estimatedArrival: '25',
          time: 'min',
          orderNumber: '#264100',
        );
      },
    );
  }
}
