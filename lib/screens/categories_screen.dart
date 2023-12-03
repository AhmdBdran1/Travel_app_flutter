import 'package:flutter/material.dart';
import 'package:traveling_app/app_data.dart';
import 'package:traveling_app/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('دليل سياحي',
        style: TextStyle(
          color: Colors.white,
        ),

        ),
        backgroundColor: Colors.blue,
      ),
      body: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
          childAspectRatio: 7/8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),

        children:
          Categories_data.map((categoryData)=>CategoryItem(categoryData.id,categoryData.title, categoryData.imageUrl),).toList(),

      ),

    );
  }
}
