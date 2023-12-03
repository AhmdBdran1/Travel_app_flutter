import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';
import 'package:traveling_app/widgets/trip_item.dart';

class CategoryTripScreen extends StatelessWidget {
  static const screenRoute='/category_trips';
  // final String categoryId;
  // final String categoryTitle;
  // CategoryTripScreen( this.categoryId, this.categoryTitle);
  @override
  Widget build(BuildContext context) {
    final routeArgument = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId=routeArgument['id'];
    final categoryTitle=routeArgument['title'];
    final filterdTrips=Trips_data.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),

      body: ListView.builder(
          itemBuilder: (context, index) {
            return TripItem(
                title: filterdTrips[index].title,
                imageUrl: filterdTrips[index].imageUrl,
                duration: filterdTrips[index].duration,
                tripType:filterdTrips[index].tripType,
                season: filterdTrips[index].season);
          },
        itemCount: filterdTrips.length ,
      ),
    );
  }
}
