import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../utils/app_routes.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem(this.meal);

  void _selectMeal(BuildContext context) {
    //empilhar uma tela em especifico
    Navigator.of(context)
        .pushNamed(
      AppRoutes.MEAL_DETAIL,
      arguments: meal,
    )
        .then((result) {
      if (result == null) {
        print('sem resultado');
      } else {
        print('O resultado é $result');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                //Esse widget em especifico é responsavel por definir as bordas de um widget
                ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                  child: Image.network(
                    meal.imageUrl.toString(),
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                //esse widget so funciona no contexto de uma Stack para posicionar um widget
                Positioned(
                  //posicionamento a pixels de distancia de cada lado
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      meal.title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      //atributo para quebra de linha
                      softWrap: true,
                      //usado para o caso de overflow, cria um fade no texto
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('${meal.duration} min')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(meal.compelexiryText)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.attach_money),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(meal.costText),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
