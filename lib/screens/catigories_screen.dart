import 'package:flutter/material.dart';
import 'package:meal/data/dummy_data%20(3).dart';
import 'package:meal/data/meal%20(1).dart';

import 'package:meal/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 3 / 2),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              availableMeals: availableMeals,
            ),
        ]);
  }
}
