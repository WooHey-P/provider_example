import 'package:flutter_riverpod/flutter_riverpod.dart';

// 어떤 provider 든 상관없음, 여기서는 FutureProvider 를 사용
// provider 를 생성할 때, 데이터를 받아서 내부 로직을 변경해야 할 때 사용
final familyModifierProvider = FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(Duration(seconds: 2));

  return List.generate(5, (index) => index * data);
});