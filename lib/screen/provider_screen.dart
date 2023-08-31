import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_example/layout/default_layout.dart';

import '../riverpod/provider.dart';
import '../riverpod/state_notifier_provider.dart';

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ShoppingListNotifier shoppingListNotifier = ref.read(shoppingListProvider.notifier);
    final state = ref.watch(filteredShoppingListProvider);

    return DefaultLayout(
      title: 'Provider Screen',
      actions: [
        PopupMenuButton(
          itemBuilder: (context) => FilterState.values.map((e) =>
              PopupMenuItem(
                child: Text(e.name),
                value: e,
              )
          ).toList(),
          onSelected: (value) {
            ref.read(filterProvider.notifier).update((state) => value);
          },
        )
      ],
      body: ListView(
        children: state.map((e) =>
            CheckboxListTile(
                value: e.hasBought,
                onChanged: (value) {
                  shoppingListNotifier.toggleHasBought(name: e.name);
                },
                title: Text(e.name)
            )
        ).toList(),
      ),
    );
  }
}
