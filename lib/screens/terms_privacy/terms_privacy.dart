import 'package:athenacx_flutter_demo/screens/dashboard/dashboard.dart';
import 'package:athenacx_flutter_demo/screens/terms_privacy/terms_privacy_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:athenacx_flutter_demo/data/local_prefs.dart';
import 'package:athenacx_flutter_demo/screens/terms_privacy/term_privacy_switch.dart';
import 'package:athenacx_flutter_demo/screens/terms_privacy/term_privacy_text.dart';

class TermsPrivacy extends StatefulWidget {

  static const String TERMS_PRIVACY = "/term_privacy";

  static const String TERMS_CHECKED_KEY = "isTermsChecked";

  static const String PRIVACY_CHECKED_KEY = "isPrivacyChecked";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }
}

class _State extends State<TermsPrivacy> {
  bool isTermChecked = false;

  bool isPrivacyChecked = false;

  double confirmButtonOpacity = 0.5;

  bool isConfirmButtonEnabled = false;

  LocalPreferences localPreferences = new LocalPreferences();

  void setConfirmButtonStatus() {
    if (isTermChecked && isPrivacyChecked) {
      enableConfirmButton();
    } else {
      disableConfirmButton();
    }
  }

  void enableConfirmButton() {
    setState(() {
      isConfirmButtonEnabled = true;
      confirmButtonOpacity = 1;
    });
  }

  void disableConfirmButton() {
    setState(() {
      isConfirmButtonEnabled = false;
      confirmButtonOpacity = 0.5;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/logobg.png"),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 100, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 20,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      height: 70,
                      width: double.infinity,
                      color: Colors.blue,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/bgd_repeat.png',
                            repeat: ImageRepeat.repeat,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Welcome to AthenaCX",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              )),
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: 15, left: 15, right: 15, bottom: 15),
                        child: Text(
                          "Before we get started we just need to acknowledge that you agree with our up to date policies.",
                          style: TextStyle(fontSize: 10, color: Colors.black45),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TermsPrivacySwitch(
                            isChecked: isTermChecked,
                            onSwitchChanged: (value) {
                              setState(() {
                                isTermChecked = value;
                                setConfirmButtonStatus();
                              });
                            }),
                        TermsPrivacySwitch(
                            isChecked: isPrivacyChecked,
                            onSwitchChanged: (value) {
                              setState(() {
                                isPrivacyChecked = value;
                                setConfirmButtonStatus();
                              });
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TermsPrivacyText(
                          text: "Terms of Use",
                          onClicked: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return TermPrivacyAlert(
                                    title: 'Terms of Use',
                                    url: 'https://www.thesuccesscf.com/terms',
                                  );
                                });
                          },
                        ),
                        TermsPrivacyText(
                          text: "Privacy Policy",
                          onClicked: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return TermPrivacyAlert(
                                    title: 'Terms of Use',
                                    url: 'https://www.thesuccesscf.com/privacy',
                                  );
                                });
                          },
                        ),
                      ],
                    ),
                    Opacity(
                      opacity: confirmButtonOpacity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // background color
                              onPrimary: Colors.blue,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15),
                            ),
                            onPressed: () {
                              if (isConfirmButtonEnabled) {
                                localPreferences.setBoolToPref(
                                    TermsPrivacy.TERMS_CHECKED_KEY, true);
                                localPreferences.setBoolToPref(
                                    TermsPrivacy.PRIVACY_CHECKED_KEY, true);
                                Navigator.pop(context);
                                Navigator.pushNamed(
                                    context, DashboardScreen.DASHBOARD_SCREEN);
                              }
                            },
                            child: Text(
                              "Confirm",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white),
                            )),
                      ),
                    )
                  ],
                ),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
