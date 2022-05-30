import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import 'categories_page.dart';
import 'favorite_page.dart';
import '../models/meal.dart';

class TabsPage extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsPage(this.favoriteMeals);

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedPageIndex = 0;
  List<Map<String, dynamic>>? _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        'title': 'Lista de Categorias',
        'page': CategoriesPage(),
      },
      {
        'title': 'Meus Favoritos',
        'page': Favorite(widget.favoriteMeals),
      },
    ];
  }

  _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_pages![_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages![_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          //Indica o index atual da tela
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).colorScheme.primary,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categorias'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favoritos'),
          ]),
    );
  }
}
