import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/models/meal.dart';

class FavorieMealsMotifier extends StateNotifier<List<Meal>> {
  FavorieMealsMotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavorieMealsMotifier, List<Meal>>((ref) {
  return FavorieMealsMotifier();
});
