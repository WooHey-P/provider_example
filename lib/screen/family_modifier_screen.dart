import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_example/riverpod/family_modifier.dart';

import '../layout/default_layout.dart';

class FamilyModifierScreen extends ConsumerWidget {
  const FamilyModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(familyModifierProvider(3));

    return DefaultLayout(
      title: 'Family Modifier',
      body: Center(
        child: state.when(
          data: (data) => Text(data.toString()),
          loading: () => CircularProgressIndicator(),
          error: (error, stackTrace) => Text(error.toString()),
        ),
      ),
    );
  }
}
