import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final String imagePath;

  final String title;

  final bool isActive;

  final Function onTapCallback;

  DrawerTile(this.imagePath, this.title, this.isActive, this.onTapCallback);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 30,
          minHeight: 30,
          maxWidth: 30,
          maxHeight: 30,
        ),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
      title: Text(
        title,
        style: TextStyle(color: this.isActive ? Colors.blue : Colors.black),
      ),
      onTap: () {
        onTapCallback(title);
        Navigator.pop(context);
      },
    );
  }
}
