import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_example/riverpod/state_notifier_provider.dart';

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
final filteredShoppingListProvider = Provider(
    (ref) {
      final shoppingListState = ref.watch(shoppingListProvider);

      switch (ref.watch(filterProvider)) {
        case FilterState.notSpicy:
          return shoppingListState.where((element) => !element.isSpicy).toList();
        case FilterState.spicy:
          return shoppingListState.where((element) => element.isSpicy).toList();
        case FilterState.all:
          return shoppingListState;
      }
    }
);

enum FilterState {
  notSpicy,
  spicy,
  all,
}

