import 'package:flutter/material.dart';
import '../../models/categories.dart';
import '../../widgets/categories/categories_item.dart';

class CategoryOverviewScreen extends StatelessWidget {
  static const routeName = '/category-detail';
  late Future<Categories> futureCategories;
  final List<Categories> loadCategories = [
    Categories(
        id: '1',
        category: 'Groceries',
        description: 'Grocery List',
        imageUrl:
            'https://www.supermarketperimeter.com/ext/resources/2021/07/21/0721---delivery.jpg?t=1626878856&width=1080'),
    Categories(
        id: '2',
        category: 'To Do List',
        description: 'To Do List',
        imageUrl:
            'https://www.pinclipart.com/picdir/big/321-3212809_check-clipart-todo-list-cartoon-to-do-list.png'),
    Categories(
        id: '3',
        category: 'Matt\'s List',
        description: 'Matt\'s List',
        imageUrl: 'http://mattarnold13.com/Content/smokehouse.jpg'),
    Categories(
        id: '4',
        category: 'Doria\'s List',
        description: 'Doria\'s List',
        imageUrl:
            'https://p7.hiclipart.com/preview/149/696/857/cartoon-drawing-royalty-free-woman.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matt and Doria\'s List'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: loadCategories.length,
        itemBuilder: (ctx, i) => CategoryItem(
            loadCategories[i].id,
            loadCategories[i].category,
            loadCategories[i].description,
            loadCategories[i].imageUrl),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            //childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
      ),
    );
  }
}

// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, must_be_immutable