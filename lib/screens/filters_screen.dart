import 'package:flutter/material.dart';
import 'package:traveling_app/widgets/app_drawer.dart';


class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});
  static const screenRoute='/filters';


  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isInSummer=false;
  var _isInWinter=false;
  var _isForFamily=false;







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الفلترة'),
        ),

      drawer: AppDrawer(),

      body:Column(
        children: [
          SizedBox(height: 50,),




          Expanded(

              child: ListView(
                children: [



                  SwitchListTile(
                    title: Text('الرحلات الصيفية'),
                    subtitle: Text('اظهار الرحلات في فصل الصيف فقط'),
                    value: _isInSummer,
                    onChanged: (newValue){
                      setState(() {
                        _isInSummer=newValue;
                      });
                    },

                    activeColor: Colors.amber,

                  ),
                  SwitchListTile(
                    title: Text('الرحلات الشتوية'),
                    subtitle: Text('اظهار الرحلات في فصل الشتاء فقط'),
                    value: _isInWinter,
                    onChanged: (newValue){
                      setState(() {
                        _isInWinter=newValue;
                      });
                    },

                    activeColor: Colors.amber,

                  ),
                  SwitchListTile(
                    title: Text('للعائلات'),
                    subtitle: Text('اظهار الرحلات التي للعائلات فقط'),
                    value: _isForFamily,
                    onChanged: (newValue){
                      setState(() {
                        _isForFamily=newValue;
                      });
                    },

                    activeColor: Colors.amber,

                  ),

                ],
              ),
          ),
        ],
      ),

      );
  }
}


