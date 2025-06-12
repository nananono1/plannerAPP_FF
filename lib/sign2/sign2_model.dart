import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'sign2_widget.dart' show Sign2Widget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:signature/signature.dart';

class Sign2Model extends FlutterFlowModel<Sign2Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  String uploadedSignatureUrl1 = '';
  String uploadedSignatureUrl2 = '';
  // State field(s) for displayname widget.
  FocusNode? displaynameFocusNode;
  TextEditingController? displaynameTextController;
  String? Function(BuildContext, String?)? displaynameTextControllerValidator;
  // State field(s) for TextFieldschool widget.
  FocusNode? textFieldschoolFocusNode;
  TextEditingController? textFieldschoolTextController;
  String? Function(BuildContext, String?)?
      textFieldschoolTextControllerValidator;
  // State field(s) for DropDownGrade widget.
  String? dropDownGradeValue;
  FormFieldController<String>? dropDownGradeValueController;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  // State field(s) for TextFielddad widget.
  FocusNode? textFielddadFocusNode;
  TextEditingController? textFielddadTextController;
  late MaskTextInputFormatter textFielddadMask;
  String? Function(BuildContext, String?)? textFielddadTextControllerValidator;
  // State field(s) for TextFieldmom widget.
  FocusNode? textFieldmomFocusNode;
  TextEditingController? textFieldmomTextController;
  late MaskTextInputFormatter textFieldmomMask;
  String? Function(BuildContext, String?)? textFieldmomTextControllerValidator;
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
  // State field(s) for userName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameTextController;
  String? Function(BuildContext, String?)? userNameTextControllerValidator;
  String? _userNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hhvhoswd' /* 성함을 입력해주세요 */,
      );
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  // State field(s) for Signature widget.
  SignatureController? signatureController1;
  // State field(s) for parentsName widget.
  FocusNode? parentsNameFocusNode;
  TextEditingController? parentsNameTextController;
  String? Function(BuildContext, String?)? parentsNameTextControllerValidator;
  String? _parentsNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'gx282sgi' /* 성함을 입력해주세요 */,
      );
    }

    return null;
  }

  // State field(s) for Signature widget.
  SignatureController? signatureController2;

  @override
  void initState(BuildContext context) {
    userNameTextControllerValidator = _userNameTextControllerValidator;
    parentsNameTextControllerValidator = _parentsNameTextControllerValidator;
  }

  @override
  void dispose() {
    displaynameFocusNode?.dispose();
    displaynameTextController?.dispose();

    textFieldschoolFocusNode?.dispose();
    textFieldschoolTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();

    textFielddadFocusNode?.dispose();
    textFielddadTextController?.dispose();

    textFieldmomFocusNode?.dispose();
    textFieldmomTextController?.dispose();

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

    userNameFocusNode?.dispose();
    userNameTextController?.dispose();

    signatureController1?.dispose();
    parentsNameFocusNode?.dispose();
    parentsNameTextController?.dispose();

    signatureController2?.dispose();
  }
}
