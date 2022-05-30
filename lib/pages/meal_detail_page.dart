import 'package:cursoapp/models/meal.dart';
import 'package:flutter/material.dart';

class MaelDetailPage extends StatelessWidget {
  final Function(Meal) onToggleFavorite;
  final bool Function(Meal) isFavorite;

  const MaelDetailPage(this.onToggleFavorite, this.isFavorite);

  _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
        width: 300,
        height: 260,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl.toString(),
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle(context, 'Ingredientes'),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.ingredients!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(meal.ingredients![index]),
                    ),
                    color: Theme.of(context).colorScheme.secondary,
                  );
                },
              ),
            ),
            _createSectionTitle(context, 'Passos'),
            _createSectionContainer(
              ListView.builder(
                itemCount: meal.steps!.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text(meal.steps![index]),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(meal) ? Icons.star : Icons.star_border),
        onPressed: () {
          //desempilhar a tela , vc pode usar o parâmetro para passar um onjeto
          onToggleFavorite(meal);
        },
      ),
    );
  }
}
