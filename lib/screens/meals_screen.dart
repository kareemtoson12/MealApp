import 'package:flutter/material.dart';
import 'package:meal/data/meal%20(1).dart';
import 'package:meal/screens/meal_details.dart';
import 'package:meal/widgets/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key,
    this.title,
    required this.meals,
  });
  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return title == null
        ? content(context)
        : Scaffold(
            appBar: AppBar(
              title: Text(title!),
              centerTitle: true,
            ),
            body: content(context),
          );
  }

  Center content(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: meals
              .map((meal) => MealIteam(
                    meal: meal,
                    Onselect: (meal) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MealDetailScreen(
                          meal: meal,
                        ),
                      ));
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
