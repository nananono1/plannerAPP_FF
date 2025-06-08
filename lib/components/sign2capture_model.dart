import '/flutter_flow/flutter_flow_util.dart';
import 'sign2capture_widget.dart' show Sign2captureWidget;
import 'package:flutter/material.dart';

class Sign2captureModel extends FlutterFlowModel<Sign2captureWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldage widget.
  FocusNode? textFieldageFocusNode;
  TextEditingController? textFieldageTextController;
  String? Function(BuildContext, String?)? textFieldageTextControllerValidator;
  // State field(s) for CheckboxCSAT widget.
  bool? checkboxCSATValue;
  // State field(s) for Checkboxsusi widget.
  bool? checkboxsusiValue;
  // State field(s) for CheckboxJungsi widget.
  bool? checkboxJungsiValue;
  // State field(s) for CheckboxHARDWAY widget.
  bool? checkboxHARDWAYValue;
  // State field(s) for CheckboxETC widget.
  bool? checkboxETCValue;
  // State field(s) for CheckboxConsulting widget.
  bool? checkboxConsultingValue;
  // State field(s) for CheckboxPlannerCoaching widget.
  bool? checkboxPlannerCoachingValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldageFocusNode?.dispose();
    textFieldageTextController?.dispose();
  }
}
