// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

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
  InAppWebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(
            widget.initialUrl ?? 'https://pf.kakao.com/_cLWxgxj',
          ),
        ),
        initialSettings: InAppWebViewSettings(
          javaScriptEnabled: true,
          // ✅ 버전 6.1.x에서는 MixedContentMode (공통 enum) 사용!
          mixedContentMode: MixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW,
        ),
        onWebViewCreated: (controller) {
          _webViewController = controller;
        },
        shouldOverrideUrlLoading: (controller, navigationAction) async {
          final uri = navigationAction.request.url;

          final isAllowedHost =
              uri?.host == 'pf.kakao.com' || uri?.host == 'k.kakaocdn.net';
          final isAllowedPath = uri?.host == 'pf.kakao.com'
              ? (uri?.path.startsWith('/_cLWxgxj') ?? false)
              : true;

          if (isAllowedHost && isAllowedPath) {
            return NavigationActionPolicy.ALLOW;
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('허용되지 않은 링크입니다.')),
            );
            return NavigationActionPolicy.CANCEL;
          }
        },
      ),
    );
  }
}
