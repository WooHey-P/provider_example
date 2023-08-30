import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_example/layout/default_layout.dart';
import 'package:provider_example/model/shopping_item_model.dart';
import 'package:provider_example/riverpod/state_notifier_provider.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // state 가 그대로 주입되기 때문에 반환 값은 List<ShoppingItemModel> 이 됨
    final List<ShoppingItemModel> state = ref.watch(shoppingListProvider);
    // .notifier 로 읽어오면 class 가 옴
    final ShoppingListNotifier notifier = ref.read(shoppingListProvider.notifier);

    return DefaultLayout(
        title: 'State NotifierProvider Screen',
        body: ListView(
          children: state.map((e) =>
            CheckboxListTile(
              value: e.hasBought,
              onChanged: (value) {
                notifier.toggleHasBought(name: e.name);
              },
              title: Text(e.name)
            )
          ).toList(),
        )
    );
  }
}
