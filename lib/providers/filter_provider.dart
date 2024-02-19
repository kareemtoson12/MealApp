import 'package:flutter_riverpod/flutter_riverpod.dart'
    show StateNotifier, StateNotifierProvider;

enum Filter {
  glutenfree,
  lactoseFree,
  veganfree,
  vegetarianfree,
}

class FiltersMealsNotifire extends StateNotifier<Map<Filter, bool>> {
  FiltersMealsNotifire()
      : super({
          Filter.glutenfree: false,
          Filter.lactoseFree: false,
          Filter.veganfree: false,
          Filter.vegetarianfree: false
        });

  void setFilters(Map<Filter, bool> chocienFilters) {
    state = chocienFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersemealsProvider =
    StateNotifierProvider<FiltersMealsNotifire, Map<Filter, bool>>((ref) {
  return FiltersMealsNotifire();
});
