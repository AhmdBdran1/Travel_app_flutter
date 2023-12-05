import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';
import 'package:traveling_app/screens/bottom_tab_bar.dart';
import 'package:traveling_app/screens/categories_screen.dart';
import 'package:traveling_app/screens/category_trips_screen.dart';
import 'package:traveling_app/screens/filters_screen.dart';
import 'package:traveling_app/screens/tabs_screen.dart';
import 'package:traveling_app/screens/trip_detail_screen.dart';

import 'models/trip.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Map<String,bool> _filters={
    'summer':false,
    'winter':false,
    'family':false,
  };
  List<Trip> _availableTrips=Trips_data;
  List<Trip> _favoriteTrips=[];
  void _changeFiters(Map<String,bool> filtersData){
    setState(() {
      _filters=filtersData;

      _availableTrips=Trips_data.where(
              (trip) {
                if(_filters['summer']==true && trip.isInSummer!=true){
                  return false;
                }

                if(_filters['winter']==true && trip.isInWinter!=true){
                  return false;
                }

                if(_filters['family']==true && trip.isForFamilies!=true){
                  return false;
                }
                return true ;

              }).toList();
    });
  }

  void _manageFavorate(String tripId){
    final existingIndex =_favoriteTrips.indexWhere((Trip) => Trip.id==tripId);
    if(existingIndex >= 0){
      setState(() {
        _favoriteTrips.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        _favoriteTrips.add(Trips_data.firstWhere((Trip) =>  Trip.id==tripId));
      });
    }




    }

  bool _isFavorate(String tripId){
    return _favoriteTrips.any((trip) => tripId==trip.id);
  }

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
        '/': (ctx) => BottomTabBar(_favoriteTrips),
        CategoryTripScreen.screenRoute:(ctx) => CategoryTripScreen(_availableTrips),
        TripDetailScreen.screenRoute: (ctx)=>TripDetailScreen(_manageFavorate,_isFavorate),
        FiltersScreen.screenRoute: (ctx)=> FiltersScreen(_changeFiters,_filters),
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
