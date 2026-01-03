import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'non_specificated_p_wcheck_widget.dart'
    show NonSpecificatedPWcheckWidget;
import 'package:flutter/material.dart';

class NonSpecificatedPWcheckModel
    extends FlutterFlowModel<NonSpecificatedPWcheckWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<UsersRecord>? query;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? tf;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
