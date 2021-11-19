import 'package:flutter/foundation.dart';

enum StudyType { URGENT, AVAILABLE, UNAVAILABLE }

extension StudyTypeExtension on StudyType {
  String get name => describeEnum(this);

  String get displayName {
    switch (this) {
      case StudyType.URGENT:
        return "Urgent";
      case StudyType.AVAILABLE:
        return "Available";
      case StudyType.UNAVAILABLE:
        return "UnAvailable";
      default:
        return "Available";
    }
  }
}
