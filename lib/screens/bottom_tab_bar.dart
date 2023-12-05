import 'package:flutter/material.dart';
import 'package:traveling_app/screens/categories_screen.dart';
import 'package:traveling_app/screens/favorites_screen.dart';
import 'package:traveling_app/widgets/app_drawer.dart';

import '../models/trip.dart';

class BottomTabBar extends StatefulWidget {


  final List<Trip> favoriteTrips;
  BottomTabBar(this.favoriteTrips);

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int _selectedScreenIndex=0;
  void _selectScreen(int index){
    setState(() {
      _selectedScreenIndex=index;
    });
  }

  late List<Map<String, Object>> _screens ;


  @override
  void initState() {
    _screens = [
      {
        'Screen': CategoriesScreen(),
        'Title': 'تصنيفات الرحلات',
      },
      {
        'Screen': FavoritesScreen(widget.favoriteTrips),
        'Title': 'الرحلات ألمفضلة',
      },
    ];
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['Title'] as String),
      ),


      drawer: AppDrawer(),

      body: (_screens[_selectedScreenIndex]['Screen'] as Widget),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        backgroundColor: Colors.blue,


        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
            label: 'التصنيفات'
          ),



          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'المفضلة'
          ),
        ],
      ),

    );
  }
}
