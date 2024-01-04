import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/providers/favorite_provider.dart';
import 'package:my_app/providers/meal_provider.dart';
import 'package:my_app/screen/Categories.dart';
import 'package:my_app/screen/filter.dart';
import 'package:my_app/screen/meals.dart';
import 'package:my_app/widgets/main_drawer.dart';
import 'package:my_app/providers/filters_provider.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vagetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final avaliableMeals = ref.watch(filteredMealsProvider);
    Widget activePage = CategoriesScreen(
      avaliable: avaliableMeals,
    );
    var ActivePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealScreen(
        meals: favoriteMeals,
      );
      ActivePageTitle = 'Your Favorite';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(ActivePageTitle),
      ),
      drawer: MainDrawer(
        onselectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite'),
        ],
      ),
    );
  }
}
