import 'package:flutter/material.dart';

import 'data/dummy_data.dart';
import 'models/meal.dart';
import 'models/settings.dart';
import 'pages/categories_meals_page.dart';
import 'pages/meal_detail_page.dart';
import 'pages/settings_page.dart';
import 'pages/tabs_page.dart';
import 'utils/app_routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree! && !meal.isGlutenFree!;
        final filterLactose = settings.isLactoseFree! && !meal.isLactoseFree!;
        final filterVegetarian = settings.isVegetarian! && !meal.isVegetarian!;
        final filterVegan = settings.isVegan! && !meal.isVegan!;
        return !filterGluten && !filterLactose && !filterVegan && filterVegetarian;
      }).toList();
    });
  }

  void _toggleFfavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal) ? _favoriteMeals.remove(meal) : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Let\'s cook ',
      theme: ThemeData(
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: const TextStyle(
                fontSize: 20,
                fontFamily: 'RoboroCondensed',
              ))).copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: Colors.amber,
              primary: Colors.pink,
            ),
      ),
      initialRoute: '/',
      routes: {
        AppRoutes.HOME: (context) => TabsPage(_favoriteMeals),
        AppRoutes.MEAL_DETAIL: (context) => MaelDetailPage(_toggleFfavorite, _isFavorite),
        AppRoutes.CATEGORIES_MEALS: (context) => CategoriesMealsPage(_availableMeals),
        AppRoutes.SETTINGS: (context) => SettingsPage(_filterMeals, settings),
      },
    );
  }
}
