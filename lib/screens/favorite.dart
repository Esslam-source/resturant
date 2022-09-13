import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../dummy_data.dart';
import 'meal_item.dart';

class Favorite extends StatefulWidget {
  static final route = '/Favourite';

  @override
  FavoriteState createState() => FavoriteState();
}

class FavoriteState extends State<Favorite> {
  static List<Meal> selectedMeals=[];

  @override
  Widget build(BuildContext context) {
    if(selectedMeals.isEmpty)
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have no favorites yet',
              style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
            Text('Start adding some!',
              style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          ],
        )
      );
    else
      return ListView.builder(
        itemBuilder: (ctx, index){
          return MealItem(
            id: selectedMeals[index].id,
            title: selectedMeals[index].title,
            imageUrl: selectedMeals[index].imageUrl,
            duration: selectedMeals[index].duration,
            complexity: selectedMeals[index].complexity,
            affordability: selectedMeals[index].affordability,
          );
        },
        itemCount: selectedMeals.length,
      );
  }
}
