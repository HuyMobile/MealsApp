import 'package:appmeals/dummy_data.dart';
import 'package:appmeals/screens/categories_screen.dart';
import 'package:appmeals/screens/category_meals_screen.dart';
import 'package:appmeals/screens/filters_screen.dart';
import 'package:appmeals/screens/meal_detail_screen.dart';
import 'package:appmeals/screens/tabs_screen.dart';
import 'package:flutter/material.dart';

import 'models/meal.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool>  _filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };

  List<Meal> _availableMeals=DUMMY_MEALS;

  void _setFilters(Map<String,bool> filterData){
        setState((){
            _filters=filterData;
            _availableMeals=DUMMY_MEALS.where((meal) {
                if(_filters['gluten']! && !meal.isGlutenFree){
                  return false;
                }
                if(_filters['lactose']! && !meal.isLactoseFree){
                  return false;
                }
                if(_filters['vegan']! && !meal.isVegan){
                   return false;
                }
                if(_filters['vegetarian']! && !meal.isVegetarian) {
                  return false;
                }
                return true;
            }).toList();
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DeliMeals",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255,254, 229,1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyMedium: TextStyle(color: Color.fromRGBO(20, 51, 51, 1),
          ),
    titleMedium: TextStyle(
    fontSize: 20,
    fontFamily: "RobotoCondensed",
      fontWeight: FontWeight.bold
    )

      ),
      ),
    //  home: CategoriesScreen(),
      initialRoute: '/',  //default
      routes: {
        '/':(context)=>TabScreen(),
        CategoryMealsScreen.routeName:(context)=>CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName:(context)=>MealDetailScreen(),
        FilterSceen.routeName:(context)=>FilterSceen(_filters,_setFilters),
      },
      onGenerateRoute: (settings){
        print((settings.arguments));
        return MaterialPageRoute(builder: (context)=>CategoriesScreen());
      },
      onUnknownRoute:(settings){
        return MaterialPageRoute(builder: (context)=> CategoriesScreen());
      },
    );
  }
}




