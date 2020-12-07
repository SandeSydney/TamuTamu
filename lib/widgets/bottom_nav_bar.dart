import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.breakfast_dining), label: 'Breakfast'),
        BottomNavigationBarItem(icon: Icon(Icons.lunch_dining), label: 'Lunch'),
        BottomNavigationBarItem(
            icon: Icon(Icons.dinner_dining), label: 'Dinner')
      ],
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
    );
  }
}
