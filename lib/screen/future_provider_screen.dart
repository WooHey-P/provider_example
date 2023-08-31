import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_example/layout/default_layout.dart';

import '../riverpod/future_provider.dart';

// FutureProvider 는 많이는 안쓰일 듯
class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // AsyncValue 에는 when 이 있어서 data, loading, error 가 있음
    final AsyncValue state = ref.watch(multiplesFutureProvider);

    return DefaultLayout(
      title: 'Future Provider Screen',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          state.when(
              data: (data) => Text(data.toString(), textAlign: TextAlign.center),
              loading: () => Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Text(error.toString())
    ,
          )
        ],
      ),
    );
  }
}
