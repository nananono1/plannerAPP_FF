import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_seat_change_bottom_sheet_widget.dart'
    show AdminSeatChangeBottomSheetWidget;
import 'package:flutter/material.dart';

class AdminSeatChangeBottomSheetModel
    extends FlutterFlowModel<AdminSeatChangeBottomSheetWidget> {
  ///  Local state fields for this component.

  bool loading = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? asdd;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? duplicateCheck;
  // Stores action output result for [Backend Call - API (Sheet seatChange)] action in Button widget.
  ApiCallResponse? apiResultchange;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
