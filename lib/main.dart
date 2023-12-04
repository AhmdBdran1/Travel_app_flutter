import 'package:flutter/material.dart';
import 'package:traveling_app/screens/bottom_tab_bar.dart';
import 'package:traveling_app/screens/categories_screen.dart';
import 'package:traveling_app/screens/category_trips_screen.dart';
import 'package:traveling_app/screens/filters_screen.dart';
import 'package:traveling_app/screens/tabs_screen.dart';
import 'package:traveling_app/screens/trip_detail_screen.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(


        primaryColor: Colors.blue,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.white,

          ),
          tabBarTheme: TabBarTheme(
            unselectedLabelColor: Colors.white,
            labelColor: Colors.amber,
            indicatorColor: Colors.amber,
          ),



          appBarTheme: AppBarTheme(
            color: Colors.blue,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
            //  fontWeight: FontWeight.bold,
              fontFamily: 'ElMessiri'
            ),
          ),
          fontFamily: 'ElMessiri',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline5: TextStyle(
            color: Colors.blue,
            fontSize: 24.0,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
          ),


          headline6: TextStyle(
            color: Colors.white,
            fontSize: 26.0,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
          ),



        )

      ),

      initialRoute: '/',
      routes: {
        '/': (ctx) => BottomTabBar(),
        CategoryTripScreen.screenRoute:(ctx) => CategoryTripScreen(),
        TripDetailScreen.screenRoute: (ctx)=>TripDetailScreen(),
        FiltersScreen.screenRoute: (ctx)=> FiltersScreen(),
      },

      builder: (context, child) {
        return Directionality(
            textDirection: TextDirection.rtl,
            child: child!
        );
      },

    );
  }

}
