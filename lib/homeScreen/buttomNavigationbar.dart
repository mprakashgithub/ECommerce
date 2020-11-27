import 'package:demoapp/homeScreen/home_main.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<BottomNavigationBarItem> bottomNavs = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text(
          "Home",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        )),
    BottomNavigationBarItem(
        icon: Icon(Icons.highlight),
        title: Text(
          "Offers",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        )),
    BottomNavigationBarItem(
        icon: Icon(Icons.search),
        title: Text(
          "Search",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        )),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        title: Text(
          "Cart",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        )),
    BottomNavigationBarItem(
        icon: Icon(Icons.more),
        title: Text(
          "More",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        )),
  ];
  int selectedIndex = 0;
  final List<dynamic> widgetOptions = [
    HomeMain(),
    HomeMain(),
    HomeMain(),
    HomeMain(),
    HomeMain(),
  ];
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: bottomNavs,
        currentIndex: selectedIndex,
        fixedColor: Colors.blue,
        onTap: onItemTapped,
      ),
    );
  }
}