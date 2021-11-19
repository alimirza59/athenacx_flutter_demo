import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermPrivacyAlert extends StatefulWidget {
  final String title;

  final String url;

  TermPrivacyAlert({this.title, @required this.url});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State(title: title, url: url);
  }
}

class _State extends State<TermPrivacyAlert> {
  final String title;

  final String url;

  _State({this.title, this.url});

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: Container(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    WebView(
                      initialUrl: url,
                      javascriptMode: JavascriptMode.unrestricted,
                      onPageFinished: (finish) {
                        setState(() {
                          isLoading = false;
                        });
                      },
                    ),
                    isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Stack(),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                child: Container(
                  width: double.infinity,
                  color: Colors.grey,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        'Confirm',
                        style: TextStyle(fontSize: 12, color: Colors.black87),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
