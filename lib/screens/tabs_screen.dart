import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meal/data/meal%20(1).dart';
import 'package:meal/providers/favorite_provider.dart';
import 'package:meal/providers/filter_provider.dart';
import 'package:meal/providers/meal_provider.dart';
import 'package:meal/screens/catigories_screen.dart';
import 'package:meal/screens/filter_screen.dart';
import 'package:meal/screens/meals_screen.dart';
import 'package:meal/widgets/mian_drawer.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedpageindex = 0;

  void _showMessage(String message) {}

  void _selectpage(int index) {
    setState(() {
      _selectedpageindex = index;
    });
  }

  void _setScreen(String identifier) {
    if (identifier == 'filters') {
      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => FiltersScreen(),
      ));
    }
    if (identifier != 'filters') {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final filters = ref.watch(filtersemealsProvider);
    final List<Meal> availableMeals = meals.where((meal) {
      if (filters[Filter.glutenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (filters[Filter.lactoseFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (filters[Filter.veganfree]! && !meal.isVegan) {
        return false;
      }
      if (filters[Filter.veganfree]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    Widget activepage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';
    if (_selectedpageindex == 1) {
      final favmeal = ref.watch(favoritemealsProvider);
      activePageTitle = 'Favorites ';
      activepage = MealScreen(
        meals: favmeal,
      );
    }

    return Scaffold(
      drawer: MainDrawer(onSelectScreen: _setScreen),
      appBar: AppBar(title: Text(activePageTitle)),
      body: activepage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectpage,
          currentIndex: _selectedpageindex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.star), label: 'Favorites '),
          ]),
    );
  }
}
