import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/app_bar_icons/app_bar_icons.dart';
import 'package:food_delivery_app/generated/assets.dart';

class FoodDetailsViewBody extends StatefulWidget {
  const FoodDetailsViewBody({super.key});

  @override
  State<FoodDetailsViewBody> createState() => _FoodDetailsViewBodyState();
}

class _FoodDetailsViewBodyState extends State<FoodDetailsViewBody> {
  int _quantity = 1;

  Map<String, bool> _selectedAddons = {
    'Pepper Julienned': false,
    'Broccoli': false,
    'Mashroom': false,
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarIcons(
                title: 'Food Details',
              ),
              SizedBox(
                height: 16,
              ),
              AspectRatio(
                aspectRatio: 5 / 3.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    Assets.imagesPizza2,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Special Pizza',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'With tommato sauce',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange, // Dark grey background
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove, color: Colors.white),
                          onPressed: () {
                            setState(() {
                              if (_quantity > 1) {
                                _quantity--;
                              }
                            });
                          },
                        ),
                        Text(
                          '$_quantity',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add, color: Colors.white),
                          onPressed: () {
                            setState(() {
                              _quantity++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 24,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    '4.3 Ratings',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  Image.asset(
                    Assets.imagesMessage,
                    height: 24,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '960 Reviews',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Description
              const Text(
                'Detail & Ingredient',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Meat Lovers is filled with toppings of sliced beef sausage, minced beef, beef burger, and chicken sausage. In one bite, you can taste a variety of processed meats that are many and dense. Especially the minced meat which still has fiber \nin it.',
                maxLines: 6,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[400], // Lighter grey for contrast
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Choice of Add On',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildAddonOption(Assets.imagesPepper, 'Pepper Julienned', '\$2.30'),
              _buildAddonOption(Assets.imagesBroccoli, 'Broccoli', '4.70'),
              _buildAddonOption(Assets.imagesMushrooms, 'Mashroom', '\$2.50'),
              const SizedBox(height: 16),
              Center(
                child: SizedBox(
                  height: 60,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    child: const Text('Add Cart'),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildAddonOption(String imagePath, String name, String price) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedAddons[name] = !_selectedAddons[name]!; // Toggle the value
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              height: 40,
              width: 40,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              price,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
            Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              checkColor: Colors.white,
              value: _selectedAddons[name],
              onChanged: (value) {
                setState(() {
                  _selectedAddons[name] = value!;
                });
              },
              activeColor: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
