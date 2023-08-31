import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_example/layout/default_layout.dart';
import 'package:provider_example/riverpod/listen_provider.dart';

class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({super.key});

  @override
  ConsumerState<ListenProviderScreen> createState() => _ListenProviderScreenState();
}

class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen> with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(
      length: 10,
      vsync: this,
      initialIndex: ref.read(listenProvider),
    );
  }

  @override
  Widget build(BuildContext context) {
    // previous 는 이전 상태, next 는 다음 상태
    // generic type 을 지정해주면 어떤 타입이 반환되는지 지정할 수 있음
    ref.listen<int>(listenProvider, (previous, next) {
      print('previous: $previous, next: $next');
      if (previous != next) controller.animateTo(next);
    });

    return DefaultLayout(
      title: 'Listen Provider Screen',
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: List.generate(10, (index) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(index.toString()),
            ElevatedButton(
                onPressed: () {
                  ref.read(listenProvider.notifier).update((state) => state == 9 ? 9 : state + 1);
                },
                child: Text('Next')
            ),
            ElevatedButton(
                onPressed: () {
                  ref.read(listenProvider.notifier).update((state) => state == 0 ? 0 : state - 1);
                },
                child: Text('Prev')
            )
          ],
        )),
      ),
    );
  }
}
