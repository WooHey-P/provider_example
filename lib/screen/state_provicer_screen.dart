import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_example/layout/default_layout.dart';

import '../riverpod/state_provider.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(numberProvider);

    return DefaultLayout(
      title: 'State Provider Screen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state.toString()),
            ElevatedButton(
                onPressed: () {
                  ref.read(numberProvider.notifier).update((state) => state + 1);
                },
                child: Text('Increment')),
            ElevatedButton(
              onPressed: () {
                ref.read(numberProvider.notifier).state--;
              },
              child: Text('Down')),
          ],
        ),
      ),
    );
  }
}

