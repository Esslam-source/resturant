import 'package:flutter/material.dart';
import 'meal_detail_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  String get complexityText{
    switch(complexity){
      case Complexity.Simple: return 'Simple';
      case Complexity.Challenging: return 'Challenging';
      case Complexity.Hard: return 'Hard';
      default: return 'Unknown';
    }
  }

  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable: return 'Affordable';
      case Affordability.Pricey: return 'Pricey';
      case Affordability.Luxurious: return 'Luxurious';
      default: return 'Unknown';
    }
  }

  void _selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetailScreen.route,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(10),
        elevation: 10,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imageUrl,width: double.infinity,height: 200,fit: BoxFit.cover,),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black54,),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 25, color: Colors.white,),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6,),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6,),
                      Text('$complexityText')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6,),
                      Text('$affordabilityText')
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
