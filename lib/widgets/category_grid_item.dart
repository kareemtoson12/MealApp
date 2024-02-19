import 'package:meal/data/meal%20(1).dart';
import 'package:meal/models/Category.dart';
import 'package:flutter/material.dart';
import 'package:meal/screens/meals_screen.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.category, required this.availableMeals});
  final Category category;

  final List<Meal> availableMeals;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final filterdMeal = availableMeals
            .where(
              (element) => element.categories.contains(category.id),
            )
            .toList();
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return MealScreen(
              title: category.title,
              meals: filterdMeal,
            );
          },
        ));
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 2.5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                  colors: [category.color, category.color.withOpacity(0.7)])),
          padding: const EdgeInsets.all(16),
          child: Text(
            category.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
          )),
    );
  }
}
