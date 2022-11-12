import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shop_pet/core/const.dart';
import 'package:shop_pet/page/home/cart_page.dart';
import 'package:shop_pet/page/home/fav_page.dart';
import 'package:shop_pet/page/home/home_page.dart';
import 'package:shop_pet/page/home/person_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _bottomNavIndex = 0;

  _selectedIndex(index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  List<IconData> _icons = [
    Icons.home,
    Icons.favorite,
    Icons.diamond,
    Icons.person
  ];
  List<Widget> _body = [HomePage(), FavPage(), CartPage(), PersonPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: AnimatedBottomNavigationBar(
            icons: _icons,
            backgroundColor: Colors.purple,
            splashColor: Colors.red,
            activeColor: Colors.red,
            inactiveColor: Colors.grey,
            activeIndex: _bottomNavIndex,
            height: 60,
            gapLocation: GapLocation.none,
            onTap: _selectedIndex,
          ),
        ),
      ),
      body: _body[_bottomNavIndex],
    );
  }
}
