import 'package:flutter/material.dart';

class CustomBottomnavigationbar extends StatefulWidget {
   int currentIndex;
  CustomBottomnavigationbar({super.key, required this.currentIndex});

  @override
  State<CustomBottomnavigationbar> createState() => _CustomBottomnavigationbarState();
}

class _CustomBottomnavigationbarState extends State<CustomBottomnavigationbar> {
  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
        onTap: (index) {
         setState(() {
           widget.currentIndex=index;
         });
        },
        currentIndex: widget.currentIndex,
        items: [
          BottomNavigationBarItem(
              label: "home",
              icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: "Shop", icon: Icon(Icons.shopping_bag)),
          BottomNavigationBarItem(icon: Icon(Icons.explore),
          label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.person),
          label: "Account")
        ]);
  }
}
