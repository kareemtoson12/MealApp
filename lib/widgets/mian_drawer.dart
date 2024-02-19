import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({super.key, required this.onSelectScreen});
  final Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7),
            ])),
            child: Row(
              children: [
                const Icon(
                  Icons.fastfood,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 40,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text("Cooking up .!",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ))
              ],
            ),
          ),
          ListTile(
            onTap: () {
              onSelectScreen('meals');
            },
            leading: const Icon(
              Icons.restaurant,
              size: 30,
            ),
            title: Text(
              "Meals",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: const Color.fromARGB(255, 208, 198, 198),
                  ),
            ),
          ),
          ListTile(
            onTap: () {
              onSelectScreen('filters');
            },
            leading: const Icon(
              Icons.settings,
              size: 30,
            ),
            title: Text(
              "Filters",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: const Color.fromARGB(255, 208, 198, 198),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
