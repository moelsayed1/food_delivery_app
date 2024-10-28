import 'package:flutter/material.dart';

class BuildCartOrderItem extends StatelessWidget {
  const BuildCartOrderItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.iconButton,
    required this.quantityContainer,
  });

  final String image;
  final String title;
  final String description;
  final String price;
  final Widget iconButton;
  final Widget quantityContainer;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(14),
      child: Padding(
        padding: EdgeInsets.only(right: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: AspectRatio(
                aspectRatio: 16 / 22,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    image,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18, // Reduced font size
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      iconButton,
                    ],
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          price,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 2, top: 8),
                        child: SizedBox(
                          height: 40,
                          width: 110,
                          child: quantityContainer,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
