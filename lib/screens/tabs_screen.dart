import 'package:flutter/material.dart';
import '../widgets/drawer.dart';
import 'category_screen.dart';
import '../screens/favorite.dart';


class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _bottomIndex=0;
  List<Map<String, Object>> _selectBottom=[
    {
      'title': 'Category Screen',
      'page': CategoryScreen(),
    },
    {
      'title': 'Favorite Screen',
      'page': Favorite(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_selectBottom[_bottomIndex]['title']}'),
      ),
      body: _selectBottom[_bottomIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          setState(() {
            _bottomIndex=value;
          });
        },
        currentIndex: _bottomIndex,
        elevation: 8,
        iconSize: 30,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            label: 'Category',
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            label: 'Favorite',
            icon: Icon(Icons.star),
          ),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
