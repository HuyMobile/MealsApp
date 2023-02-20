import 'package:appmeals/category_meals_screen.dart';
import 'package:flutter/material.dart';


class CategoriesItem extends StatelessWidget {
  final String id;
final String title;
final Color color;
CategoriesItem(this.id,this.title,this.color);

void selectCategory(BuildContext ctx){
  Navigator.of(ctx).push(MaterialPageRoute(builder: (_)=>
  CategoryMealsScreen(id,title)));
}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title,style: Theme.of(context).textTheme.titleMedium,),
        decoration: BoxDecoration(gradient:LinearGradient(
          colors: [color.withOpacity(0.7),
          color,],
        begin:Alignment.topLeft,
        end:Alignment.bottomRight ),
          borderRadius: BorderRadius.circular(15),

        ),
      ),
    );
  }
}
