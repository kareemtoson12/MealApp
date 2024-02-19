import 'package:flutter_riverpod/flutter_riverpod.dart' show Provider;
import 'package:meal/data/dummy_data%20(3).dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
