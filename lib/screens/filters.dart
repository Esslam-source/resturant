import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import 'category_meals_screen.dart';

class Filters extends StatefulWidget {
  static final route = '/Filters';

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filters',
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  title: Text('Gluten Free',
                    style: Theme.of(context).textTheme.subtitle1,),
                  subtitle: Text('Only include Gluten Free meals',),
                  value: CategoryMealsScreenState.glutenFree,
                  onChanged: (_){
                    setState(() {
                      CategoryMealsScreenState.glutenFree=!CategoryMealsScreenState.glutenFree;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Lactose Free',
                    style: Theme.of(context).textTheme.subtitle1,),
                  subtitle: Text('Only include Lactose Free meals',),
                  value: CategoryMealsScreenState.lactoseFree,
                  onChanged: (_){
                    setState(() {
                      CategoryMealsScreenState.lactoseFree=!CategoryMealsScreenState.lactoseFree;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegetarian',
                    style: Theme.of(context).textTheme.subtitle1,),
                  subtitle: Text('Only include Vegetarian meals',),
                  value: CategoryMealsScreenState.vegetarian,
                  onChanged: (_){
                    setState(() {
                      CategoryMealsScreenState.vegetarian=!CategoryMealsScreenState.vegetarian;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegan',
                    style: Theme.of(context).textTheme.subtitle1,),
                  subtitle: Text('Only include Vegan meals',),
                  value: CategoryMealsScreenState.vegan,
                  onChanged: (_){
                    setState(() {
                      CategoryMealsScreenState.vegan=!CategoryMealsScreenState.vegan;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
