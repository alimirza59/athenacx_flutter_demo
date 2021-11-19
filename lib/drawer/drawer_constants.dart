import 'package:flutter/foundation.dart';

enum DrawerItems {
  MY_STUDIES,
  JOIN_CLOSED_STUDY,
  FIND_OPEN_STUDY,
  VIEW_ANALYTICS,
  SYNC_FITBIT
}

extension DrawerItemExtension on DrawerItems {

  String get name => describeEnum(this);

  String get displayDrawerName {
    switch (this) {
      case DrawerItems.MY_STUDIES:
        return "My Studies";
      case DrawerItems.JOIN_CLOSED_STUDY:
        return "Join Closed Study";
      case DrawerItems.FIND_OPEN_STUDY:
        return "Find Open Study";
      case DrawerItems.VIEW_ANALYTICS:
        return "View Analytics";
      case DrawerItems.SYNC_FITBIT:
        return "Sync Fitbit";
      default:
        return "My Studies";
    }
  }
}