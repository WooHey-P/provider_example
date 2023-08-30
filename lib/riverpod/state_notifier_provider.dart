import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_example/model/shopping_item_model.dart';

final shoppingListProvider = StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>((ref) => ShoppingListNotifier());

class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  ShoppingListNotifier() : super([
    ShoppingItemModel(name: '김치', quantity: 3, hasBought: false, isSpicy: true),
    ShoppingItemModel(name: '라면', quantity: 6, hasBought: false, isSpicy: true),
    ShoppingItemModel(name: '삼겹살', quantity: 1, hasBought: false, isSpicy: false),
    ShoppingItemModel(name: '수박', quantity: 2, hasBought: false, isSpicy: false),
    ShoppingItemModel(name: '카스테라', quantity: 5, hasBought: false, isSpicy: false),
  ]);

  void toggleHasBought({required String name}) {
    // state 는 StateNotifier 의 값임
    state = state.map((e) => e.name == name ? e.copyWith(hasBought: !e.hasBought) : e).toList();
  }
}