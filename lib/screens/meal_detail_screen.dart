import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../screens/favorite.dart';

class MealDetailScreen extends StatefulWidget {
  static final String route = '/MealDetailScreen';

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final routArg = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeals = DUMMY_MEALS.firstWhere((meal) => meal.id == routArg);

    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeals.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                //margin: EdgeInsets.all(8),
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeals.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                child: Text(
                  'Ingredients',
                  style: Theme
                      .of(context)
                      .textTheme
                      .subtitle1,
                ),
              ),
              Container(
                width: 350,
                height: 200,
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  itemBuilder: (ctx, index) =>
                      Card(
                        color: Theme
                            .of(context)
                            .colorScheme.secondary,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Text(
                            selectedMeals.ingredients[index],
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                  itemCount: selectedMeals.ingredients.length,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  border: Border.all(color: Colors.blue, width: 3),
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                child: Text(
                  'Steps',
                  style: Theme
                      .of(context)
                      .textTheme
                      .subtitle1,
                ),
              ),
              Container(
                width: 350,
                height: 250,
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  itemBuilder: (ctx, index) =>
                      Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text('#${index + 1}'),
                            ),
                            title: Text(
                              selectedMeals.steps[index],
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Divider(color: Colors.grey,),
                        ],
                      ),
                  itemCount: selectedMeals.steps.length,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  border: Border.all(color: Colors.blue, width: 3),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Theme
                .of(context)
                .primaryColor,
            onPressed: () {
              setState(() {
                FavoriteState.selectedMeals.contains(selectedMeals)?
                  FavoriteState.selectedMeals.removeWhere((meal) =>
                  meal.id == routArg)
                    :FavoriteState.selectedMeals.add(selectedMeals);
              });
            },
            child: Icon(FavoriteState.selectedMeals.contains(selectedMeals)?
                Icons.star:Icons.star_border),
        )
    ,
    );
  }
}
