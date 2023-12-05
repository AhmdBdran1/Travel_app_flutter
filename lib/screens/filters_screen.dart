import 'package:flutter/material.dart';
import 'package:traveling_app/widgets/app_drawer.dart';


class FiltersScreen extends StatefulWidget {
  static const screenRoute='/filters';
  final Function saveFilters;
  final Map<String,bool> currentFilters;
  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isInSummer=false;
  var _isInWinter=false;
  var _isForFamily=false;

  @override
  void initState() {
    _isInSummer=widget.currentFilters['summer']!;
    _isInWinter=widget.currentFilters['winter']!;
    _isForFamily=widget.currentFilters['family']!;
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الفلترة'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              final selectedFilters={
                'summer':_isInSummer,
                'winter':_isInWinter,
                'family':_isForFamily,
              };
              widget.saveFilters(selectedFilters);

              Navigator.of(context).pushReplacementNamed('/');
            }
            ,)
        ],
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

