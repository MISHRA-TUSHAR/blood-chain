import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LocateHPScreen extends StatefulWidget {
  const LocateHPScreen({Key? key}) : super(key: key);

  @override
  _LocateHPScreenState createState() => _LocateHPScreenState();
}

class _LocateHPScreenState extends State<LocateHPScreen> {
  late WebViewController _controller;

  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://www.bing.com/maps'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nearest Hospitals')),
      body: WebViewWidget(controller: controller),
    );
  }
}
