import 'package:dakhil/tabs/map.dart';
import 'package:dakhil/tabs/manage.dart';
import 'package:dakhil/tabs/profile.dart';
import 'package:dakhil/tabs/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currIndex = 1;

  //tabs
  Restaurant restaurantTab;
  MapView mapTab;
  Manage manageOrder;
  Profile profileTab;

  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
    // call the fetch method on food
    // widget.foodModel.fetchFoods();

    //orderPage = OrderPage();
    restaurantTab = Restaurant();
    mapTab = MapView();
    manageOrder = Manage();
    profileTab = Profile();

    pages = [mapTab, restaurantTab, manageOrder, profileTab];

    currentPage = restaurantTab;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.map),
              title: Text("Map"),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant),
              title: Text("Restaurant"),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Zocial.cart),
              title: Text("Manage"),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              backgroundColor: Colors.blue),
        ],
        onTap: (index) {
          setState(() {
            currIndex = index;
            currentPage = pages[index];
          });
        },
      ),
      body: currentPage,
    );
  }
}
