import 'package:flutter/material.dart';
import 'package:provider_example/layout/default_layout.dart';
import 'package:provider_example/screen/state_notifier_provider_screen.dart';
import 'package:provider_example/screen/state_provicer_screen.dart';

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
        ],
      ),
    );
  }
}
