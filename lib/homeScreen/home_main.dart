import 'dart:async';
import 'dart:io';

import 'package:demoapp/homeScreen/drawer.dart';
import 'package:demoapp/homeScreen/home_component/top_category_grid.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  DateTime currentBackPressTime;

  bool loginShit = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
             Text("HOME", style: TextStyle(color:Colors.blue),),
              Text("Offers", style: TextStyle(color:Colors.blue),),
           ],
         ),
         
        ),
        titleSpacing: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          IconButton(
            icon:
              Icon(
               Icons.shopping_basket,
                color: Colors.black,
              ),
      
            onPressed: () {
              // Navigator.push(
              //     context,
              //     PageTransition(
              //         type: PageTransitionType.rightToLeft, child: CartPage()));
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: WillPopScope(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            TopCategoryGrid(),
          ],
        ),
        onWillPop: onWillPop,
      ),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Press Back Once Again To Exit");
      return Future.value(false);
    }
    exit(0);
    return Future.value(true);
  }
}
