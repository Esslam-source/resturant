import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  static final String route = '/CategoryScreen';

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map(
            (e) => CategoryItem(e.id, e.title, e.color),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 3 / 2,
      ),
    );
  }
}
