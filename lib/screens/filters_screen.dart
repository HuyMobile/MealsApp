import 'package:appmeals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';


class FilterSceen extends StatefulWidget {

  static const routeName="/filters";

  @override
  State<FilterSceen> createState() => _FilterSceenState();
}

class _FilterSceenState extends State<FilterSceen> {
  bool _glutenFree=false;
  bool _vegetarian=false;
  bool _vegan=false;
  bool _lactoseFree=false;

  Widget _buildSwitchListTitle(String title,String description,
      bool currentValue, ValueChanged updateValue){
    return          SwitchListTile(
      title: Text(title),
      value:currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters'),),
  drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust your meal selection",
            style: Theme.of(context).textTheme.titleLarge,),
          ),
          Expanded(child: ListView(
            children: [
              _buildSwitchListTitle("Gluten-free", "Only include gluten-free meals", _glutenFree, (newValue) {
                setState((){
                  _glutenFree=newValue;
                });
              }),
              _buildSwitchListTitle("Lactose-free", "Only include lactose-free meals", _lactoseFree, (newValue) {
                setState((){
                  _lactoseFree=newValue;
                });
              }),
              _buildSwitchListTitle("Vegetarian", "Only include Vegetarian meals", _vegetarian, (newValue) {
                setState((){
                  _vegetarian=newValue;
                });
              }),
              _buildSwitchListTitle("Vegan", "Only include Vegan meals", _vegan, (newValue) {
                setState((){
                  _vegan=newValue;
                });
              })

            ],
          ),),
        ],
      )
    );
  }
}
