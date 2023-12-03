import 'package:flutter/material.dart';
import 'package:traveling_app/models/trip.dart';

class TripItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;

   TripItem({super.key, required this.title, required this.imageUrl,
    required this.duration, required this.tripType, required this.season});

  String get seasonText{
    switch(season) {
      case Season.Winter:
        return 'شتاء';
        break;
      case Season.Autumn:
        return 'خريف';
        break;
      case Season.Spring:
        return 'ربيع';
        break;
      case Season.Summer:
        return 'صيف';
        break;
      default:
        return 'unKnown';
    }
  }

  String get tripTypeText{
    switch(tripType) {
      case TripType.Exploration:
        return 'أستكشاف';
        break;
      case TripType.Recovery:
        return 'نقاهة';
        break;
      case TripType.Activities:
        return 'أنشطة';
        break;
      case TripType.Therapy:
        return 'معالجة';
        break;
      default:
        return 'unKnown';
    }
  }


  void selectTrip(){}
  @override
  Widget build(BuildContext context) {


    return InkWell(
      onTap: selectTrip,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin:  EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                     height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
                  height: 250,
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black.withOpacity(0),Colors.black.withOpacity(0.8)],
                      stops: [
                        0.6,1
                      ],

                    ),
                  ),
                  child: Text(title,
                  style:Theme.of(context).textTheme.headline6,
                  overflow:TextOverflow.fade,
                  ),
                ),
              ],
            ),
             Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(children: [
                      Icon(Icons.today,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${duration} أيام'),


                    ],),
                    Row(children: [
                      Icon(Icons.wb_sunny,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(seasonText,),


                    ],),
                    Row(children: [
                      Icon(Icons.family_restroom,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(tripTypeText),


                    ],),
                  ],
                ),
            ),

          ],
        ),
      ),
    );
  }
}


