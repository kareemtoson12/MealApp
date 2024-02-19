import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meal/providers/filter_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  bool _glutenfree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;

  @override
  void initState() {
    super.initState();
    final Map<Filter, bool> activetFliter = ref.read(filtersemealsProvider);

    _glutenfree = activetFliter[Filter.glutenfree]!;
    isLactoseFree = activetFliter[Filter.lactoseFree]!;
    isVegan = activetFliter[Filter.veganfree]!;
    isVegetarian = activetFliter[Filter.vegetarianfree]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          ref.read(filtersemealsProvider.notifier).setFilters({
            Filter.glutenfree: _glutenfree,
            Filter.lactoseFree: isLactoseFree,
            Filter.veganfree: isVegan,
            Filter.vegetarianfree: isVegetarian,
          });

          return true;
        },
        child: Column(
          children: [
            filtersButton(context, _glutenfree, "Gluten", "Gluten free"),
            filtersButton(context, isLactoseFree, 'Lactos', 'Lactos free'),
            filtersButton(context, isVegan, 'vegan', 'Vegan free'),
            filtersButton(
                context, isVegetarian, 'Vegetarian', 'Vegetarian free'),
          ],
        ),
      ),
    );
  }

  SwitchListTile filtersButton(
      BuildContext context, bool filterValue, String subname, String name) {
    return SwitchListTile(
      contentPadding: const EdgeInsets.all(8),
      subtitle: Text("only include $name",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 15, color: Theme.of(context).colorScheme.onBackground)),
      value: filterValue,
      onChanged: (value) {
        setState(() {
          // Update the respective filter variable based on the switch
          if (name == 'Gluten free') {
            _glutenfree = value;
          } else if (name == 'Lactos free') {
            isLactoseFree = value;
          } else if (name == 'Vegan free') {
            isVegan = value;
          } else if (name == 'Vegetarian free') {
            isVegetarian = value;
          }
        });
      },
      title: Text(name,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground)),
    );
  }
}
