import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';

Future webNotification(BuildContext context) async {
  ApiCallResponse? accessTokenCall;
  ApiCallResponse? refreshTokenCall;

  accessTokenCall = await ACall.call();

  if (!(accessTokenCall.succeeded ?? true)) {
    refreshTokenCall = await CallWriteByStudentCall.call();

    if (!(refreshTokenCall.succeeded ?? true)) {
      context.goNamed(AuthWelcomeScreenWidget.routeName);
    }
  }
}
