

import 'package:flutter/material.dart';

class BorderContainer extends StatelessWidget {
  BorderContainer({
    required this.myWidget,
    super.key});

  Widget myWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black12)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: myWidget
        ),
    );
  }
}
