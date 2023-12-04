import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';
import 'package:traveling_app/widgets/trip_item.dart';

import '../models/trip.dart';

class CategoryTripScreen extends StatefulWidget {
  static const screenRoute='/category_trips';


  @override
  State<CategoryTripScreen> createState() => _CategoryTripScreenState();
}

class _CategoryTripScreenState extends State<CategoryTripScreen> {
  // final String categoryId;
    String categoryTitle='';
   List<Trip> displayTrips=[];
   int flag=0;

  void _removeTrip(String tripId){
    setState(() {
      displayTrips.removeWhere((trip) => trip.id==tripId);
      print('After removal: $displayTrips');
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(flag==0){
      flag=1;
    final routeArgument = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId=routeArgument['id'];
     categoryTitle=routeArgument['title']!;
     displayTrips=Trips_data.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();}
    super.didChangeDependencies();


  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),

      body: ListView.builder(
          itemBuilder: (context, index) {
            return TripItem(
                id: displayTrips[index].id,
                title: displayTrips[index].title,
                imageUrl: displayTrips[index].imageUrl,
                duration: displayTrips[index].duration,
                tripType:displayTrips[index].tripType,
                season: displayTrips[index].season,
               removeItem: _removeTrip,
            );
          },
        itemCount: displayTrips.length ,
      ),
    );
  }
}
