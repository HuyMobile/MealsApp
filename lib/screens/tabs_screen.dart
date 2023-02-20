import 'package:appmeals/screens/categories_screen.dart';
import 'package:appmeals/screens/favorites_screen.dart';
import 'package:flutter/material.dart';


class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  final List<Map<String,dynamic>>_pages=[
    {
      'page': CategoriesScreen(),
      'title':"Categories",

    },
    {
      'page':FavoritesScreen(),
      'title':"Favorite",
    }
  ];

  int _selectedPageIndex=0;

  void _selectPage(int index){
    setState((){
      _selectedPageIndex=index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('${_pages[_selectedPageIndex]['title']}'),
        ),
       body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap:_selectPage ,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,  // biet dc tag nao đc chọn
        //type: BottomNavigationBarType.shifting,
        items:  [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
          label:"Categories" ),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label:"Favorites" ),
        ],
      ),
      );

  }
}
