import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_seat_change_bottom_sheet_widget.dart'
    show AdminSeatChangeBottomSheetWidget;
import 'package:flutter/material.dart';

class AdminSeatChangeBottomSheetModel
    extends FlutterFlowModel<AdminSeatChangeBottomSheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  UsersRecord? asdd;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
