import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../dummy_data.dart';
import 'meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {

  static final String route = '/CategoryMealsScreen';

  @override
  CategoryMealsScreenState createState() => CategoryMealsScreenState();
}

class CategoryMealsScreenState extends State<CategoryMealsScreen> {

  late Map<String, String> _argument;
  late List<Meal> categoryMeals;
  static bool glutenFree = false;
  static bool lactoseFree = false;
  static bool vegetarian = false;
  static bool vegan = false;

  @override
  void didChangeDependencies() {
    _argument = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(_argument['id']);
    }).toList();
    _removeMeal();
    super.didChangeDependencies();
  }

  void _removeMeal(){
    setState(() {
      glutenFree? categoryMeals.removeWhere((meal) => !meal.isGlutenFree)
      :lactoseFree? categoryMeals.removeWhere((meal) => !meal.isLactoseFree)
      :vegetarian? categoryMeals.removeWhere((meal) => !meal.isVegetarian)
      :vegan? categoryMeals.removeWhere((meal) => !meal.isVegan)
      :vegan=vegan;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('${_argument['title']}'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index){
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
