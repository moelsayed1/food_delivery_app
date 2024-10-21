import 'package:flutter/material.dart';
import 'package:food_delivery_app/Features/home/presentation/views/widgets/food_card_list_view.dart';
import 'package:food_delivery_app/core/utils/widgets/food_category_cards.dart';
import 'package:food_delivery_app/generated/assets.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {

  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose(); // Dispose the controller when the widget is removed
    super.dispose();
  }

  // Function to handle bottom navigation item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage( // Animate to the selected page
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Padding(
            padding: EdgeInsets.only(left: 16, top: 16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    Assets.imagesProfile,
                  ),
                ),
              ],
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 14, left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_rounded,
                      size: 18,
                      color: Colors.orange,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Deliver to',
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  ' 4102 Pretty View Lane',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none_outlined,
                size: 30,
              ),
            ),
          ],
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Let\'s find your best \nfavorite food!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      style: const TextStyle(color: Colors.white),
                      // White text inside TextField
                      decoration: InputDecoration(
                        hintText: 'Find for food or restaurant...',
                        hintStyle: const TextStyle(color: Colors.grey),
                        // Grey hint text
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey, // Grey search icon
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor:
                            Colors.grey[800], // Darker background for TextField
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FoodCategoryCard(image: Assets.imagesPizza, label: 'Pizza'),
                        FoodCategoryCard(image: Assets.imagesDonut, label: 'Donut'),
                        FoodCategoryCard(
                            image: Assets.imagesBurger, label: 'Burger'),
                        FoodCategoryCard(
                            image: Assets.imagesMexican, label: 'Mexican'),
                        FoodCategoryCard(image: Assets.imagesAsian, label: 'Asian'),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange[100],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: AspectRatio(
                              aspectRatio: 16 / 22,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                                child: Image.asset(
                                  Assets.imagesNoodles,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Special for you',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Fried Noodles With\nSpecial Chicken\nKatsura',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black.withOpacity(0.5),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.orange,
                                    ),
                                    child:  const Text('Buy Now'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Popular',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'see the most popular food in town',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'See All',
                            style: TextStyle(color: Colors.orange),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 250,
                      child: FoodCardList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
