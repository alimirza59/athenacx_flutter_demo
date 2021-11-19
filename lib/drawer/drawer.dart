import 'package:flutter/material.dart';
import 'drawer_constants.dart';
import 'drawer_tile.dart';

class MyDrawer extends StatelessWidget {

  final Function onDrawerClicked;

  final DrawerItems currentItem;

  MyDrawer({this.currentItem, this.onDrawerClicked});

  bool checkActiveItem(DrawerItems item) {
    return item == this.currentItem;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(top: 0.0),
        children: [
          Container(
            height: MediaQuery.of(context).padding.top +
                AppBar().preferredSize.height,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Image.asset(
                'assets/images/bgd_repeat.png',
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
          DrawerTile(
              checkActiveItem(DrawerItems.MY_STUDIES)
                  ? "assets/images/home_active.png"
                  : "assets/images/home.png",
              DrawerItems.MY_STUDIES.displayDrawerName,
              checkActiveItem(DrawerItems.MY_STUDIES), (title) {
            onDrawerClicked(DrawerItems.MY_STUDIES);
          }),
          DrawerTile(
              checkActiveItem(DrawerItems.JOIN_CLOSED_STUDY)
                  ? "assets/images/lock_active.png"
                  : "assets/images/lock.png",
              DrawerItems.JOIN_CLOSED_STUDY.displayDrawerName,
              checkActiveItem(DrawerItems.JOIN_CLOSED_STUDY), (title) {
            onDrawerClicked(DrawerItems.JOIN_CLOSED_STUDY);
          }),
          DrawerTile(
              checkActiveItem(DrawerItems.FIND_OPEN_STUDY)
                  ? "assets/images/search_active.png"
                  : "assets/images/search.png",
              DrawerItems.FIND_OPEN_STUDY.displayDrawerName,
              checkActiveItem(DrawerItems.FIND_OPEN_STUDY), (title) {
            onDrawerClicked(DrawerItems.FIND_OPEN_STUDY);
          }),
          DrawerTile(
              checkActiveItem(DrawerItems.VIEW_ANALYTICS)
                  ? "assets/images/analytics_active.png"
                  : "assets/images/analytics.png",
              DrawerItems.VIEW_ANALYTICS.displayDrawerName,
              checkActiveItem(DrawerItems.VIEW_ANALYTICS), (title) {
            onDrawerClicked(DrawerItems.VIEW_ANALYTICS);
          }),
          DrawerTile(
              checkActiveItem(DrawerItems.SYNC_FITBIT)
                  ? "assets/images/fitbit_active.png"
                  : "assets/images/fitbit.png",
              DrawerItems.SYNC_FITBIT.displayDrawerName,
              checkActiveItem(DrawerItems.SYNC_FITBIT), (title) {
            onDrawerClicked(DrawerItems.SYNC_FITBIT);
          }),
        ],
      ),
    );
  }
}
