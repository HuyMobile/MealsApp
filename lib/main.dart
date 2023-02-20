import 'package:appmeals/screens/categories_screen.dart';
import 'package:appmeals/screens/category_meals_screen.dart';
import 'package:appmeals/screens/meal_detail_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        '/':(context)=>CategoriesScreen(),
        CategoryMealsScreen.routeName:(context)=>CategoryMealsScreen(),
        MealDetailScreen.routeName:(context)=>MealDetailScreen(),
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




