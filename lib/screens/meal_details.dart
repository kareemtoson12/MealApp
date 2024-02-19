import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/data/meal%20(1).dart';
import 'package:meal/providers/favorite_provider.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({
    super.key,
    required this.meal,
  });
  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoraitMeals = ref.watch(favoritemealsProvider);
    final bool isfavorite = favoraitMeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          Builder(
            builder: (BuildContext context) => IconButton(
              onPressed: () {
                final wasAdded = ref
                    .read(favoritemealsProvider.notifier)
                    .toggleMealFev(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(wasAdded
                        ? "Added to favorites !"
                        : "Deleted from favorites !")));
              },
              icon: isfavorite
                  ? const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    )
                  : const Icon(
                      Icons.star_border_outlined,
                      color: Colors.white,
                    ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                fit: BoxFit.cover,
                image: NetworkImage(meal.imageUrl)),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
            const SizedBox(
              height: 15,
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).primaryColorLight,
                      fontSize:
                          18, // Adjust the value according to your preference
                    ),
              ),
            const SizedBox(
              height: 24,
            ),
            Text(
              'Steps',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
            const SizedBox(
              height: 15,
            ),
            for (final steps in meal.steps)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  steps,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).primaryColorLight,
                        fontSize:
                            18, // Adjust the value according to your preference
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
