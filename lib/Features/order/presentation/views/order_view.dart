import 'package:flutter/material.dart';
import 'package:food_delivery_app/Features/order/presentation/views/widgets/order_view_body.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: OrderViewBody(),
      ),
    );
  }
}
