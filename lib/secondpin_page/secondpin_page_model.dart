import '/flutter_flow/flutter_flow_util.dart';
import '/functional/userdeep/second_pin_confirm/second_pin_confirm_widget.dart';
import 'secondpin_page_widget.dart' show SecondpinPageWidget;
import 'package:flutter/material.dart';

class SecondpinPageModel extends FlutterFlowModel<SecondpinPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for secondPinConfirm component.
  late SecondPinConfirmModel secondPinConfirmModel;

  @override
  void initState(BuildContext context) {
    secondPinConfirmModel = createModel(context, () => SecondPinConfirmModel());
  }

  @override
  void dispose() {
    secondPinConfirmModel.dispose();
  }
}
