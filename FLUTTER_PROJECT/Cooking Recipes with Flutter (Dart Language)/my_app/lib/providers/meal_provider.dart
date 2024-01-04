import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_app/dummy_data.dart/dummy_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
