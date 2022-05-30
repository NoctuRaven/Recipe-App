import 'package:flutter/material.dart';
import '../models/category.dart';
import '../components/meal_item.dart';
import '../models/meal.dart';

class CategoriesMealsPage extends StatelessWidget {
  final List<Meal> meals;

  const CategoriesMealsPage(this.meals);

  @override
  Widget build(BuildContext context) {
    //ModalRoute é usado para pegar a "categoria" no lugar do construtor
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(categoryMeals[index]);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
