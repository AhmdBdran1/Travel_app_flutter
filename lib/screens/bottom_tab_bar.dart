import 'package:flutter/material.dart';
import 'package:traveling_app/screens/categories_screen.dart';
import 'package:traveling_app/screens/favorites_screen.dart';
import 'package:traveling_app/widgets/app_drawer.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key});

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

  final List<Map<String, Object>> _screens = [
    {
      'Screen': CategoriesScreen(),
      'Title': 'تصنيفات الرحلات',
    },
    {
      'Screen': FavoritesScreen(),
      'Title': 'الرحلات ألمفضلة',
    },
  ];

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
