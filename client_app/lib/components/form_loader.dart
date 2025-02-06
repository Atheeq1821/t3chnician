import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class QFormLoader extends StatelessWidget {
  final String formUrl;
  const QFormLoader({super.key, required this.formUrl});

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
            initialUrlRequest: URLRequest(
              url: WebUri(formUrl), // Replace with your URL
            ),
            onLoadStart: (controller, url) {
              CircularProgressIndicator();
              // print("Loading: $url");
            },
            onLoadStop: (controller, url) {
              // print("Finished Loading: $url");
            },
          );
  }
}