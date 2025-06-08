// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:webview_flutter/webview_flutter.dart';

class FilteredWebView extends StatefulWidget {
  const FilteredWebView({
    super.key,
    this.width,
    this.height,
    this.initialUrl,
  });

  final double? width;
  final double? height;
  final String? initialUrl;

  @override
  State<FilteredWebView> createState() => _FilteredWebViewState();
}

class _FilteredWebViewState extends State<FilteredWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            final uri = Uri.parse(request.url);

            // 허용할 도메인 및 경로
            final isAllowedHost = uri.host == 'pf.kakao.com';
            final isAllowedPath = uri.path.startsWith('/_cLWxgxj');

            if (isAllowedHost && isAllowedPath) {
              return NavigationDecision.navigate;
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('허용되지 않은 링크입니다.')),
              );
              return NavigationDecision.prevent;
            }
          },
        ),
      )
      ..loadRequest(
          Uri.parse(widget.initialUrl ?? 'https://pf.kakao.com/_cLWxgxj'));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: WebViewWidget(controller: _controller),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
