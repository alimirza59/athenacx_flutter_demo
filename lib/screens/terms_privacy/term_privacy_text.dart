import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermsPrivacyText extends StatelessWidget {

  final String text;

  final Function onClicked;

  TermsPrivacyText({@required this.text,this.onClicked});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onClicked,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          color: Colors.blueAccent,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
