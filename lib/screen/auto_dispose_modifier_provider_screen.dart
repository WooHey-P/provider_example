import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_example/layout/default_layout.dart';

import '../riverpod/auto_dispose_modifier_provider.dart';

// Auto Dispose Modifier Provider 는 자동으로 캐시를 삭제함
class AutoDisposeProviderScreen extends ConsumerWidget {
  const AutoDisposeProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(autoDisposeModifierProvider);

    return DefaultLayout(
      title: 'Auto Dispose Modifier Provider Screen',
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
