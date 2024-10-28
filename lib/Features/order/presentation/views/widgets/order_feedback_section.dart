import 'package:flutter/material.dart';

class OrderFeedbackSection extends StatelessWidget {
  const OrderFeedbackSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'How was your last order\nfrom FOOD ?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.star, color: Colors.orange, size: 32),
                Icon(Icons.star, color: Colors.orange, size: 32),
                Icon(Icons.star, color: Colors.orange, size: 32),
                Icon(Icons.star, color: Colors.orange, size: 32),
                Icon(Icons.star_border, color: Colors.orange, size: 32),
              ],
            ),
            const SizedBox(height: 8),
            const Text('Good', style: TextStyle(color: Colors.orange, fontSize: 16)),
            const SizedBox(height: 18),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Write',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                child: const Text('Submit'),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}