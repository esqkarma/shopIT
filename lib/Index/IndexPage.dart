import 'package:flutter/material.dart';
import 'package:shopIT/Screens/Cart/UI/CartScreen.dart';
import 'package:shopIT/Screens/Home/UI/Home.dart';
import 'package:shopIT/Utils/Custom_Widgets/BottomNavigationBar.dart';

class Indexpage extends StatefulWidget {
  const Indexpage({super.key});

  @override
  State<Indexpage> createState() => _IndexpageState();
}

class _IndexpageState extends State<Indexpage> {
  int currentIndex = 0;
  final List<Widget> screens = [
    HomeScreen(),
    Cartscreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar:
      BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentIndex=index;
            });
          },
          currentIndex: currentIndex,
          selectedItemColor: Colors.black54,
          mouseCursor: MouseCursor.uncontrolled,
          items: [
            BottomNavigationBarItem(

              backgroundColor: Colors.purple[100],
                label: "home",
                icon: Icon(Icons.home)),
            BottomNavigationBarItem(icon: Icon(Icons.explore),
                label: "Explore"),
            BottomNavigationBarItem(
                label: "Shop", icon: Icon(Icons.shopping_bag)),
            BottomNavigationBarItem(icon: Icon(Icons.person),
                label: "Account")
          ])
    );
  }
}
