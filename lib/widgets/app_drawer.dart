import 'package:flutter/material.dart';
import 'package:traveling_app/screens/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});


  ListTile buildListTile(String title,IconData icon,Function fun){
   return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),

      title: Text(
       title,// 'الرحلات'
        style: TextStyle(
          fontFamily: 'ElMessiri',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),

      ),

      onTap: (){
        fun();
      },

    );


  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.amber,
            child: Text('دليلك السياحي',
            style: Theme.of(context).textTheme.headline6,
            ),
          ),

          SizedBox(height: 20,),

          buildListTile('الرحلات', Icons.card_travel, (){
            Navigator.of(context).pushReplacementNamed('/');
          }),



          buildListTile('التصفية', Icons.filter_list, (){
            Navigator.of(context).pushReplacementNamed(FiltersScreen.screenRoute);
          }),




        ],
      ),
    );
  }
}

