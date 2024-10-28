import 'package:flutter/material.dart';

class BuildOrderHistoryItemItem extends StatelessWidget {
  const BuildOrderHistoryItemItem({
    super.key,
    required this.imagePath,
    required this.orderTitle,
    required this.orderDescription,
    required this.itemsCount,
    required this.price,
    required this.estimatedArrival,
    required this.orderNumber,
    required this.time,
  });

  final String imagePath;
  final String orderTitle;
  final String orderDescription;
  final String itemsCount;
  final String price;
  final String estimatedArrival;
  final String time;
  final String orderNumber;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.only(right: 8), // Consistent padding
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // Align items to top
          children: [
            // Image
            Expanded(
              flex: 4,
              child: AspectRatio(
                aspectRatio: 16 / 22,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePath,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Order Details (Flexible for dynamic width)
            Expanded( // Use Expanded to manage remaining space
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      orderTitle,
                      style: const TextStyle(
                        fontSize: 18, // Reduced font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    orderDescription,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        '$estimatedArrival ', // Combine text and space
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      Text(
                        time,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // Order Number (Constrained for limited width)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  itemsCount,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  orderNumber,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
