import 'package:flutter/material.dart';
import 'package:food_delivery_app/Features/home/presentation/views/widgets/food_details_view_body.dart';

class FoodDetailsView extends StatelessWidget {
  const FoodDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FoodDetailsViewBody(),
    );
  }
}
