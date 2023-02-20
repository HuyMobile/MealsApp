import 'package:appmeals/screens/categories_screen.dart';
import 'package:appmeals/screens/favorites_screen.dart';
import 'package:flutter/material.dart';


class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
     // initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.category),text: "Categories",),
              Tab(icon: Icon(Icons.star),text: "Favorites",),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),FavoritesScreen(),
          ],
        ),
      ),

    );
  }
}
