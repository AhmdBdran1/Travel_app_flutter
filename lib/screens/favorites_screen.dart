import 'package:flutter/material.dart';

import '../models/trip.dart';
import '../widgets/trip_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Trip> favoriteTrips;
  FavoritesScreen(this.favoriteTrips);
  @override
  Widget build(BuildContext context) {
    if(favoriteTrips.isEmpty) {
      return Center(
        child: Text('ليس لديك أي رحلة في قائمة ألمفضلة'),
      );
    }else{
      return ListView.builder(
        itemBuilder: (context, index) {
          return TripItem(
            id: favoriteTrips[index].id,
            title: favoriteTrips[index].title,
            imageUrl: favoriteTrips[index].imageUrl,
            duration: favoriteTrips[index].duration,
            tripType:favoriteTrips[index].tripType,
            season: favoriteTrips[index].season,

          );
        },
        itemCount: favoriteTrips.length ,
      );
    }
  }
}
