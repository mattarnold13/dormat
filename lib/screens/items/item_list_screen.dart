// ignore_for_file: use_key_in_widget_constructors

import 'package:chat_app/models/categories.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ItemListScreen extends StatelessWidget {
  static const routeName = '/category-detail';
  late Future<Categories> futureCategories;

  // TODO - Create new Database
  // TODO - Create New API for database
  // TODO - Change URL

  Future<String> loadItems() async {
    final response =
        await http.get(Uri.parse('http://mattarnold13.com/api/workout'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load items');
    }
  }

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as String;
    return MaterialApp(
      title: 'DorMat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(category),
        ),
        body: Center(
          child: FutureBuilder<String>(
            future: loadItems(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.toString());
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

// ignore_for_file:  todo, must_be_immutable