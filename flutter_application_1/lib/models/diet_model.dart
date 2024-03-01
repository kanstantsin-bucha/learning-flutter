import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool isSelected;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxColor,
    this.isSelected = false,
  });

  static List<DietModel> getDiets() {
    return [ 
      DietModel(
        name: "Honey Pancake",
        iconPath: "assets/icons/honey-pancakes.svg",
        level: "Easy",
        duration: "30min",
        calorie: "180kCal",
        boxColor: const Color(0xFF92A3FD),
        isSelected: true,
      ),
      DietModel(
        name: "Canai Bread",
        iconPath: "assets/icons/canai-bread.svg",
        level: "Easy",
        duration: "20min",
        calorie: "230kCal",
        boxColor: const Color(0xFFC58BF2),
      ),
    ];
  }
}