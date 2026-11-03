import 'package:flutter/material.dart';

class AppScreen {
  final String appBarTitle;
  final String drawerTitle;
  final Widget screen;
  final IconData icon;

  const AppScreen({
    required this.appBarTitle,
    required this.drawerTitle,
    required this.screen,
    required this.icon,
  });
}