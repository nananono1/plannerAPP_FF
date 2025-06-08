import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'sign2component_widget.dart' show Sign2componentWidget;
import 'package:flutter/material.dart';

class Sign2componentModel extends FlutterFlowModel<Sign2componentWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldage widget.
  FocusNode? textFieldageFocusNode;
  TextEditingController? textFieldageTextController;
  String? Function(BuildContext, String?)? textFieldageTextControllerValidator;
  // State field(s) for CheckboxCSAT widget.
  bool? checkboxCSATValue;
  // State field(s) for Checkboxsusi widget.
  bool? checkboxsusiValue;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for CheckboxJungsi widget.
  bool? checkboxJungsiValue;
  // State field(s) for CheckboxHARDWAY widget.
  bool? checkboxHARDWAYValue;
  // State field(s) for TextFieldHardWay widget.
  FocusNode? textFieldHardWayFocusNode;
  TextEditingController? textFieldHardWayTextController;
  String? Function(BuildContext, String?)?
      textFieldHardWayTextControllerValidator;
  // State field(s) for CheckboxETC widget.
  bool? checkboxETCValue;
  // State field(s) for TextFieldETC widget.
  FocusNode? textFieldETCFocusNode;
  TextEditingController? textFieldETCTextController;
  String? Function(BuildContext, String?)? textFieldETCTextControllerValidator;
  // State field(s) for selectKorean widget.
  String? selectKoreanValue;
  FormFieldController<String>? selectKoreanValueController;
  // State field(s) for gradeKorean widget.
  FocusNode? gradeKoreanFocusNode;
  TextEditingController? gradeKoreanTextController;
  String? Function(BuildContext, String?)? gradeKoreanTextControllerValidator;
  // State field(s) for selectMath widget.
  String? selectMathValue;
  FormFieldController<String>? selectMathValueController;
  // State field(s) for gradeMath widget.
  FocusNode? gradeMathFocusNode;
  TextEditingController? gradeMathTextController;
  String? Function(BuildContext, String?)? gradeMathTextControllerValidator;
  // State field(s) for select11 widget.
  String? select11Value;
  FormFieldController<String>? select11ValueController;
  // State field(s) for select111 widget.
  String? select111Value;
  FormFieldController<String>? select111ValueController;
  // State field(s) for grade111 widget.
  FocusNode? grade111FocusNode;
  TextEditingController? grade111TextController;
  String? Function(BuildContext, String?)? grade111TextControllerValidator;
  // State field(s) for selectEnglsih widget.
  String? selectEnglsihValue;
  FormFieldController<String>? selectEnglsihValueController;
  // State field(s) for gradeEnglish widget.
  FocusNode? gradeEnglishFocusNode;
  TextEditingController? gradeEnglishTextController;
  String? Function(BuildContext, String?)? gradeEnglishTextControllerValidator;
  // State field(s) for selectHistory widget.
  String? selectHistoryValue;
  FormFieldController<String>? selectHistoryValueController;
  // State field(s) for gradeHistory widget.
  FocusNode? gradeHistoryFocusNode;
  TextEditingController? gradeHistoryTextController;
  String? Function(BuildContext, String?)? gradeHistoryTextControllerValidator;
  // State field(s) for select22 widget.
  String? select22Value;
  FormFieldController<String>? select22ValueController;
  // State field(s) for select222 widget.
  String? select222Value;
  FormFieldController<String>? select222ValueController;
  // State field(s) for grade222 widget.
  FocusNode? grade222FocusNode;
  TextEditingController? grade222TextController;
  String? Function(BuildContext, String?)? grade222TextControllerValidator;
  // State field(s) for CheckboxConsulting widget.
  bool? checkboxConsultingValue;
  // State field(s) for CheckboxPlannerCoaching widget.
  bool? checkboxPlannerCoachingValue;
  // State field(s) for TextFields1 widget.
  FocusNode? textFields1FocusNode1;
  TextEditingController? textFields1TextController1;
  String? Function(BuildContext, String?)? textFields1TextController1Validator;
  // State field(s) for TextFields1 widget.
  FocusNode? textFields1FocusNode2;
  TextEditingController? textFields1TextController2;
  String? Function(BuildContext, String?)? textFields1TextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldageFocusNode?.dispose();
    textFieldageTextController?.dispose();

    textFieldHardWayFocusNode?.dispose();
    textFieldHardWayTextController?.dispose();

    textFieldETCFocusNode?.dispose();
    textFieldETCTextController?.dispose();

    gradeKoreanFocusNode?.dispose();
    gradeKoreanTextController?.dispose();

    gradeMathFocusNode?.dispose();
    gradeMathTextController?.dispose();

    grade111FocusNode?.dispose();
    grade111TextController?.dispose();

    gradeEnglishFocusNode?.dispose();
    gradeEnglishTextController?.dispose();

    gradeHistoryFocusNode?.dispose();
    gradeHistoryTextController?.dispose();

    grade222FocusNode?.dispose();
    grade222TextController?.dispose();

    textFields1FocusNode1?.dispose();
    textFields1TextController1?.dispose();

    textFields1FocusNode2?.dispose();
    textFields1TextController2?.dispose();
  }
}
