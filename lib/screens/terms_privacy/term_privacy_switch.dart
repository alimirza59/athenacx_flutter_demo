import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermsPrivacySwitch extends StatelessWidget{

  final bool isChecked;

  final Function onSwitchChanged;

  TermsPrivacySwitch({@required this.isChecked,this.onSwitchChanged});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Switch(
      value: isChecked,
      onChanged: (value) {
        onSwitchChanged(value);
      },
      activeTrackColor: Colors.blue,
      activeColor: Colors.white,
    );
  }

}
