import 'package:flutter/material.dart';
import '../screens/filters.dart';

class MyDrawer extends StatelessWidget {

  Widget buildTile(String title, IconData icon, Function() x) {
    return ListTile(
      onTap: x,
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
        ),
      ),
      leading: Icon(icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme
                .of(context)
                .accentColor,
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up!',
              style: TextStyle(fontSize: 30, color: Theme
                  .of(context)
                  .primaryColor, fontWeight: FontWeight.w900,),
            ),
          ),
          SizedBox(height: 20,),
          buildTile('Meal', Icons.restaurant, () {Navigator.of(context).pushReplacementNamed('/');}),
          buildTile('Filters', Icons.settings, () {Navigator.of(context).pushReplacementNamed(Filters.route);}),
        ],
      ),
    );
  }
}
