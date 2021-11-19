import 'package:athenacx_flutter_demo/data/local_prefs.dart';
import 'package:athenacx_flutter_demo/screens/dashboard/dashboard.dart';
import 'package:athenacx_flutter_demo/screens/terms_privacy/terms_privacy.dart';
import 'package:flutter/material.dart';

int initScreen = 0;

LocalPreferences localPreferences = new LocalPreferences();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isTermsChecked =
      await localPreferences.getBoolToPref(TermsPrivacy.TERMS_CHECKED_KEY);
  bool isPrivacyChecked =
      await localPreferences.getBoolToPref(TermsPrivacy.PRIVACY_CHECKED_KEY);
  if (isTermsChecked != null &&
      isPrivacyChecked != null &&
      isTermsChecked &&
      isPrivacyChecked) {
    initScreen = 1;
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: initScreen == 1
          ? DashboardScreen.DASHBOARD_SCREEN
          : TermsPrivacy.TERMS_PRIVACY,
      routes: {
        TermsPrivacy.TERMS_PRIVACY: (context) => TermsPrivacy(),
        DashboardScreen.DASHBOARD_SCREEN: (context) => DashboardScreen()
      },
    );
  }
}
