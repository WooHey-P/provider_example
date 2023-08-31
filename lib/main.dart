import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_example/riverpod/provider_observer.dart';
import 'package:provider_example/screen/home_screen.dart';

void main() {
  runApp(
    ProviderScope(
      // provider 들을 관찰할 수 있음
      observers: [
        Logger(),
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    )
  );
}

