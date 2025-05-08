// lib/pages/home_page.dart

import 'package:flutter/material.dart';
import 'call_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CallPage()),
            );
          },
          child: const Text('Find a match'),
        ),
      ),
    );
  }
}

