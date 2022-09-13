import 'package:flutter/material.dart';
import './screens/tabs_screen.dart';
import './screens/category_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/favorite.dart';
import './screens/filters.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1:  TextStyle(
                color: Color.fromRGBO(20, 50, 30, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 50, 30, 1),
              ),
              subtitle1:  TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: TabsScreen(),
      routes: {
        CategoryScreen.route: (context) => CategoryScreen(),
        CategoryMealsScreen.route: (context) => CategoryMealsScreen(),
        MealDetailScreen.route: (context) => MealDetailScreen(),
        Favorite.route: (context) => Favorite(),
        Filters.route: (context) => Filters(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal App'),
      ),
      body: null,
    );
  }
}
