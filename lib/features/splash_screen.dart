import 'package:flutter/material.dart';
class GemBook extends StatelessWidget {
  const GemBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assetName"),),
          ),
        ),
      ),
    );
  }
}
