import 'package:flutter/material.dart';

class DividerOpacity extends StatelessWidget {
  final bool? isSelected;
  const DividerOpacity({this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: isSelected ?? false ? 1 : 0.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Container(
            height: 11,
            width: 2,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(4))),
      ),
    );
  }
}
