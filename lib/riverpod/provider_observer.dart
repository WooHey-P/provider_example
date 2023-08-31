import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  // ProviderScope 하위의 모든 provider 들이 update 되었을 때 호출됨
  @override
  void didUpdateProvider(
      // 어떤 provider 가 update 되었는지 알 수 있음
      ProviderBase<Object?> provider,
      // 이전 값
      Object? previousValue,
      // 새로운 값
      Object? newValue,
      // ProviderContainer 는 ProviderScope 하위의 모든 provider 들을 가지고 있음
      ProviderContainer container
      ) {
    // print('[Provider Updated] provider: $provider, previousValue: $previousValue, newValue: $newValue');
  }
  // Provider 가 추가되었을 때 호출됨
  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value, ProviderContainer container) {
    // print('[Provider Added] provider: $provider, value: $value');
  }
  // Provider 가 삭제되었을 때 호출됨
  @override
  void didDisposeProvider(ProviderBase<Object?> provider, ProviderContainer container) {
    // print('[Provider Disposed] provider: $provider');
  }
}