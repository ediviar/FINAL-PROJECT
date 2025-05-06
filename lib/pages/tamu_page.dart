import 'package:flutter/material.dart';

class TamuPage extends StatelessWidget {
  const TamuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tamu Page'),
      ),
      body: Center(
        child: Text('Welcome to Tamu Page'),
      ),
    );
  }
}