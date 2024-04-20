import 'package:flutter/material.dart';

class loading extends StatefulWidget {
  const loading({super.key});

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.red,
          strokeAlign: CircularProgressIndicator.strokeAlignCenter,
          valueColor: AlwaysStoppedAnimation(Colors.white),
          strokeWidth: 5,
        ),
      ),
    );
  }
}
