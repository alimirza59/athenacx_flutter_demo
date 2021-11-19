import 'package:flutter/material.dart';
import 'studies_content.dart';

class Studies {
  final String title;
  List<StudiesContent> contents = [];
  bool isExpanded = false;
  Color primaryColor;
  Color secondaryColor;


  Studies({
    this.title,
    this.contents,
    this.isExpanded,
    this.primaryColor,
    this.secondaryColor,
  });
}
