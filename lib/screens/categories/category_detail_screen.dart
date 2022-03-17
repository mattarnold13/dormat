// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/categories.dart';

// ignore: must_be_immutable
class CategoryDetailScreen extends StatelessWidget {
  static const routeName = '/category-detail';
  late Future<Categories> futureCategories;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats/rNHaFNj89IJL4ZPIAL6L/messages')
            .snapshots(),
        builder: ((BuildContext context,
            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final documents = streamSnapshot.data?.docs;

          return ListView.builder(
            itemCount: documents?.length,
            itemBuilder: (ctx, index) => Container(
              padding: EdgeInsets.all(8),
              child: Text(documents![index]['text']),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/rNHaFNj89IJL4ZPIAL6L/messages')
              .add({'text': 'this was added by clicking the button'});
        },
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors
// ignore_for_file: use_key_in_widget_constructors, 