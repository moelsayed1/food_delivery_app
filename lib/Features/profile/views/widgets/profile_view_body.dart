import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utils/app_bar_icons/app_bar_icons.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 16.0),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const AppBarIcons(),
                  const SizedBox(
                    height: 24,
                  ),
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.orange,
                    child: Icon(Icons.person, color: Colors.white, size: 40),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Selenay',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField('Name', 'Your Name'),
                  const SizedBox(height: 10),
                  _buildTextField('Birthday', 'MM/DD/YYYY', isDate: true),
                  const SizedBox(height: 10),
                  _buildTextField('Address', 'Chicago'),
                  const SizedBox(height: 10),
                  _buildTextField('State', 'Select State', isDropdown: true),
                  const SizedBox(height: 10),
                  _buildTextField('City', 'Select City', isDropdown: true),
                  const SizedBox(height: 10),
                  _buildTextField('Street (Include House Member)', 'Street', isDropdown: true),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 14,
            left: 100,
            right: 100,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 22),
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {
                // Handle Add to Cart action
              },
              child: const Text(
                'Save',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildTextField(String label, String hint, {bool isDate = false, bool isDropdown = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white54,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          readOnly: isDate || isDropdown,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white38),
            suffixIcon: isDate
                ? const Icon(Icons.calendar_today, color: Colors.white38)
                : isDropdown
                ? const Icon(Icons.arrow_forward_ios, color: Colors.white38, size: 16)
                : null,
            filled: true,
            fillColor: Colors.grey[850],
            contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
