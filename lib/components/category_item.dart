import 'package:flutter/material.dart';

import '../models/category.dart';

import '../utils/app_routes.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category);

  void _selectCategory(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoriesMealsPage(category);
    //     },
    //   ),
    // );

    Navigator.of(context).pushNamed(
      AppRoutes.CATEGORIES_MEALS,
      //arguments é usado para alimentar o ModalRoute em categories_meals_page !
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            //criando degradê de uma cor no conteiner da esquerda para a direita
            gradient: LinearGradient(colors: [
              category.color.withOpacity(0.5),
              category.color,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      ),
    );
  }
}
