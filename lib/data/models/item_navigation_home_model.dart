import 'package:flutter/material.dart';

class ItemNavigationHomeModel {
  IconData icon;
  String label;
  bool? isSelected;

  ItemNavigationHomeModel(
      {required this.icon, required this.label, this.isSelected});

  ItemNavigationHomeModel copyWith(
          {IconData? icon, String? label, bool? isSelected}) =>
      ItemNavigationHomeModel(
          icon: icon ?? this.icon,
          label: label ?? this.label,
          isSelected: isSelected ?? this.isSelected);
}
