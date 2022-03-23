import 'dart:ui';
import 'package:clist/features/clist/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class GlassHome extends StatelessWidget {
  final double start;
  final double end;
  const GlassHome({
    Key? key,
    required this.start,
    required this.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(0.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Gradient pastel color.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView.builder(itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: GlassContainer(
                opacity: 0.17,
                shadowStrength: 7,
                child: Center(child: Text("List item")),
                height: 130,
                width: 10,
              ),
            );
          })
        ],
      ),
    );
  }
}
