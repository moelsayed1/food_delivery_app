import 'package:flutter/material.dart';
import 'package:food_delivery_app/Features/order/presentation/views/widgets/build_order_history_item.dart';
import 'package:food_delivery_app/Features/order/presentation/views/widgets/order_feedback_section.dart';
import 'package:food_delivery_app/generated/assets.dart';

class BuildHistoryOrders extends StatelessWidget {
  const BuildHistoryOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ // Segmented control (Upcoming/History)
        const SizedBox(height: 16),
        const BuildOrderHistoryItemItem( // Replace with your order data
          imagePath: Assets.imagesPizza2,
          orderTitle: 'Red n hot pizza',
          orderDescription: 'Spicy chicken, beef',
          itemsCount: '1 Items',
          price: '\$8.95',
          estimatedArrival: 'Order',
          orderNumber: '#264100',
          time: 'Delivered',
        ),
        const SizedBox(height: 32),
        const OrderFeedbackSection(), // Feedback section
      ],
    );
  }
}
