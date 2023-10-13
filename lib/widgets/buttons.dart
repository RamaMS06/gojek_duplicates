// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gojek_duplicates/utils/colors.dart';

enum ButtonTemplateType { primary, secondary }

class ButtonTemplate extends StatelessWidget {
  final String label;
  final ButtonTemplateType type;
  final double? width;
  final bool? isLoading;
  final Function() onPressed;

  late Color textColor;
  late MaterialStateProperty<Color>? backgroundColor;
  late MaterialStateProperty<BorderSide>? side;
  late MaterialStateProperty<TextStyle>? textStyle;

  ButtonTemplate(
      {required this.label,
      required this.type,
      this.width,
      this.isLoading,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ButtonTemplateType.primary:
        backgroundColor = MaterialStateProperty.all(CustomColors.green1);
        side = MaterialStateProperty.all(
            const BorderSide(color: CustomColors.green1));
        textColor = Colors.white;
      case ButtonTemplateType.secondary:
        backgroundColor = MaterialStateProperty.all(Colors.white);
        side = MaterialStateProperty.all(
            const BorderSide(color: CustomColors.green1));
        textColor = CustomColors.green1;
      default:
    }
    return SizedBox(
      width: width,
      height: 45,
      child: FilledButton(
          style: ButtonStyle(side: side, backgroundColor: backgroundColor),
          onPressed: onPressed,
          child: isLoading ?? false
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                      color: Colors.white, strokeWidth: 3))
              : Text(label,
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: textColor,
                      fontSize: 15))),
    );
  }
}
