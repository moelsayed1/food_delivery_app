import 'package:flutter/material.dart';
import 'package:food_delivery_app/Features/order/presentation/views/widgets/build_history_orders.dart';
import 'package:food_delivery_app/Features/order/presentation/views/widgets/build_upcoming_orders.dart';
import 'package:food_delivery_app/core/utils/app_bar_icons/app_bar_icons.dart';

class OrderViewBody extends StatefulWidget {
  const OrderViewBody({super.key});

  @override
  State<OrderViewBody> createState() => _OrderViewBodyState();
}

class _OrderViewBodyState extends State<OrderViewBody> {
  bool isUpcomingSelected = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const AppBarIcons(
            title: 'My Orders',
          ),
          const SizedBox(
            height: 32,
          ),
          // Toggle Buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isUpcomingSelected = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        isUpcomingSelected ? Colors.orange : Colors.transparent,
                        foregroundColor:
                        isUpcomingSelected ? Colors.white : Colors.orange,
                        padding: const EdgeInsets.symmetric(vertical: 22),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                      child: const Text('Upcoming'),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isUpcomingSelected = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        isUpcomingSelected ? Colors.transparent : Colors.orange,
                        foregroundColor:
                        isUpcomingSelected ? Colors.orange : Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 22),
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                      child: const Text('History'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: isUpcomingSelected ? const BuildUpcomingOrders() : BuildHistoryOrders(),
          ),
        ],
      ),
    );
  }

}
