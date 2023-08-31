import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_example/riverpod/state_notifier_provider.dart';

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
final filteredShoppingListProvider = Provider(
    (ref) {
      // filterProvider 및 shoppingListProvider 값이 변경될 때마다 Provider() 가 다시 호출됨 (왜냐하면 ref.watch() 를 사용했기 때문)
      // 마치 build() 함수가 호출되는 것과 같음
      final filterState = ref.watch(filterProvider);
      final shoppingListState = ref.watch(shoppingListProvider);

      switch (filterState) {
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

