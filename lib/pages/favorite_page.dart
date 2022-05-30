import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../components/meal_item.dart';

class Favorite extends StatelessWidget {
  final List<Meal> favoritosMeals;

  const Favorite(this.favoritosMeals);

  @override
  Widget build(BuildContext context) {
    if (favoritosMeals.isEmpty) {
      return Center(
        child: Text('Nenhuma refeição foi marcada como favorita'),
      );
    } else {
      return ListView.builder(
        itemCount: favoritosMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(favoritosMeals[index]);
        },
      );
    }
  }
}
