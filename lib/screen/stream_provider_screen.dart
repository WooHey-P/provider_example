import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_example/layout/default_layout.dart';
import 'package:provider_example/riverpod/stream_provider.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch 를 통해 multipleStreamProvider 의 값이 변경되면 다시 build 됨
    final state = ref.watch(multipleStreamProvider);

    return DefaultLayout(
      title: 'Stream Provider',
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
