import 'package:flutter/material.dart';

class OpenStudyListTile extends StatelessWidget {
  final double cardRadius = 5;

  final Function onTap;

  final String title;

  final String description;

  final int position;

  OpenStudyListTile({this.title, this.description, this.position, this.onTap});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(position);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Card(
          color: Colors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: new BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(cardRadius),
                      topRight: Radius.circular(cardRadius),
                    )),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    title,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black54,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
