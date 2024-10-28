import 'package:flutter/material.dart';
import 'package:food_delivery_app/Features/cart/presentation/views/widgets/build_cart_order_item.dart';
import 'package:food_delivery_app/Features/cart/presentation/views/widgets/total_price.dart';
import 'package:food_delivery_app/core/utils/app_bar_icons/app_bar_icons.dart';
import 'package:food_delivery_app/core/utils/custom_elevated_button/custom_elevated_button.dart';
import 'package:food_delivery_app/core/utils/routing/app_router.dart';
import 'package:food_delivery_app/core/utils/widgets/quantity_container.dart';
import 'package:food_delivery_app/generated/assets.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              AppBarIcons(
                title: 'Cart',
              ),
              SizedBox(
                height: 16,
              ),
              BuildCartOrderItem(
                image: Assets.imagesPizza2,
                title: 'Red n hot pizza',
                description: 'Spicy chicken, beef',
                price: '\$8.95',
                quantityContainer: QuantityCounter(),
                iconButton: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.close,
                    color: Colors.orange,
                    size: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Stack(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(24),
                      hintText: 'Promo Code',
                      border: buildOutlineInputBorder(),
                      enabledBorder: buildOutlineInputBorder(),
                      focusedBorder: buildOutlineInputBorder(),
                      fillColor: Colors.grey[800],
                      filled: true,
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: SizedBox(
                          height: 45,
                          width: 110,
                          child: CustomElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                            child: Text(
                              'Apply',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              TotalPrice(
                title: 'Subtotal',
                value: '\$27.30',
                currency: 'USD',
              ),
              SizedBox(
                height: 8,
              ),
              const Divider(
                thickness: 2,
                color: Color(0xffC7C7C7),
              ),
              SizedBox(
                height: 8,
              ),
              TotalPrice(
                title: 'Tax and Fees',
                value: '\$5.30',
                currency: 'USD',
              ),
              SizedBox(
                height: 8,
              ),
              const Divider(
                thickness: 2,
                color: Color(0xffC7C7C7),
              ),
              SizedBox(
                height: 8,
              ),
              TotalPrice(
                title: 'Delivery',
                value: '\$1.00',
                currency: 'USD',
              ),
              SizedBox(
                height: 8,
              ),
              const Divider(
                thickness: 2,
                color: Color(0xffC7C7C7),
              ),
              SizedBox(
                height: 8,
              ),
              TotalPrice(
                title: '',
                value: '\$1.00',
                currency: 'USD',
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 55,
                width: 180,
                child: CustomElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouter.ordersRoute);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                  child: Text(
                    'Confirm Order',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(32),
      borderSide: BorderSide(
        color: Colors.white.withOpacity(0.5),
      ),
    );
  }
}
