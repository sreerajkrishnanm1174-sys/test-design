import 'package:flutter/material.dart';

class NavItemModel {

  final String label;
  final IconData icon;
  final Widget screen;

  NavItemModel({
    required this.label,
    required this.icon,
    required this.screen,
  });
}