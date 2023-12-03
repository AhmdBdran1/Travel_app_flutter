import 'package:flutter/material.dart';
import 'package:traveling_app/screens/categories_screen.dart';
import 'package:traveling_app/screens/category_trips_screen.dart';

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
        '/': (ctx) => CategoriesScreen(),
        CategoryTripScreen.screenRoute:(ctx) => CategoryTripScreen()
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
