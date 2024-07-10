import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewRoute extends StatefulWidget {
  const WebViewRoute({super.key, required this.jobTitle});
  final String jobTitle;

  @override
  State<WebViewRoute> createState() => _WebViewRouteState();
}

class _WebViewRouteState extends State<WebViewRoute> {
  late final WebViewController controller;
  var loadingPercentage = 0;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
          });
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ))
      ..loadRequest(
        Uri.parse(
            'https://www.google.com/search?q=${widget.jobTitle.replaceAll(' ', '+')}'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter WebView'),
        ),
        body: Stack(children: [
          WebViewWidget(
            controller: controller,
          ),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
            ),
        ]));
  }
}
