import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      unselectedLabelColor: Colors.black54,
      labelColor: Colors.blue,
      tabs: [
        Tab(icon: Icon(Icons.breakfast_dining), text: 'Breakfast'),
        Tab(icon: Icon(Icons.lunch_dining), text: 'Lunch'),
        Tab(icon: Icon(Icons.dinner_dining), text: 'Dinner'),
      ],
    );
  }
}
