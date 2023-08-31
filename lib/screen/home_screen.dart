import 'package:flutter/material.dart';
import 'package:provider_example/layout/default_layout.dart';
import 'package:provider_example/screen/auto_dispose_modifier_provider_screen.dart';
import 'package:provider_example/screen/family_modifier_screen.dart';
import 'package:provider_example/screen/future_provider_screen.dart';
import 'package:provider_example/screen/listen_provider_screen.dart';
import 'package:provider_example/screen/provider_screen.dart';
import 'package:provider_example/screen/state_notifier_provider_screen.dart';
import 'package:provider_example/screen/state_provicer_screen.dart';
import 'package:provider_example/screen/stream_provider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'Home',
      body: ListView(
        children: [
          ElevatedButton(
            child: Text('State Provider Screen'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StateProviderScreen(),
                ),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StateNotifierProviderScreen(),
                ),
              );
            },
            child: Text('State Notifier Provider Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FutureProviderScreen(),
                ),
              );
            },
            child: Text('Future Provider Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StreamProviderScreen(),
                ),
              );
            },
            child: Text('Stream Provider Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FamilyModifierScreen(),
                ),
              );
            },
            child: Text('Family Modifier Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AutoDisposeModifierProviderScreen(),
                ),
              );
            },
            child: Text('Auto Dispose Modifier Provider Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ListenProviderScreen(),
                ),
              );
            },
            child: Text('Listen Provider Screen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProviderScreen(),
                ),
              );
            },
            child: Text('Provider Screen'),
          )
        ],
      ),
    );
  }
}
