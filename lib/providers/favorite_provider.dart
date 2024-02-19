import 'package:flutter_riverpod/flutter_riverpod.dart'
    show StateNotifier, StateNotifierProvider;

import 'package:meal/data/meal%20(1).dart';

class FavoriteMealsNotifire extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifire() : super([]);

  bool toggleMealFev(Meal meal) {
    final isExist = state.contains(meal);
    if (isExist) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoritemealsProvider =
    StateNotifierProvider<FavoriteMealsNotifire, List<Meal>>((ref) {
  return FavoriteMealsNotifire();
});
