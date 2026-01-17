import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_seat_configure_bottom_sheet_widget.dart'
    show AdminSeatConfigureBottomSheetWidget;
import 'package:flutter/material.dart';

class AdminSeatConfigureBottomSheetModel
    extends FlutterFlowModel<AdminSeatConfigureBottomSheetWidget> {
  ///  Local state fields for this component.

  bool loading = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? duplicateCheck2;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? aaa;
  // Stores action output result for [Backend Call - API (Sheet seatAndtimetable)] action in Button widget.
  ApiCallResponse? apiResulnew;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
