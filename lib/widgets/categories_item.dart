// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../screens/category_detail_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String category;
  final String description;
  final String imageUrl;

  const CategoryItem(this.id, this.category, this.description, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              CategoryDetailScreen.routeName,
              arguments: category,
            );
          },
          child: Image.network(
            imageUrl,
            fit: BoxFit.fill,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(
            category,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
