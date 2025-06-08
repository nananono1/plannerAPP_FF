import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'auth_create_widget.dart' show AuthCreateWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthCreateModel extends FlutterFlowModel<AuthCreateWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode1;
  TextEditingController? emailAddressTextController1;
  String? Function(BuildContext, String?)? emailAddressTextController1Validator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for password3 widget.
  FocusNode? password3FocusNode;
  TextEditingController? password3TextController;
  late bool password3Visibility;
  String? Function(BuildContext, String?)? password3TextControllerValidator;
  // State field(s) for password2 widget.
  FocusNode? password2FocusNode;
  TextEditingController? password2TextController;
  late bool password2Visibility;
  String? Function(BuildContext, String?)? password2TextControllerValidator;
  // State field(s) for displayName widget.
  FocusNode? displayNameFocusNode1;
  TextEditingController? displayNameTextController1;
  String? Function(BuildContext, String?)? displayNameTextController1Validator;
  // State field(s) for DropDown1 widget.
  String? dropDown1Value;
  FormFieldController<String>? dropDown1ValueController;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode2;
  TextEditingController? emailAddressTextController2;
  String? Function(BuildContext, String?)? emailAddressTextController2Validator;
  // State field(s) for DropDown2 widget.
  String? dropDown2Value;
  FormFieldController<String>? dropDown2ValueController;
  // State field(s) for displayName widget.
  FocusNode? displayNameFocusNode2;
  TextEditingController? displayNameTextController2;
  final displayNameMask2 = MaskTextInputFormatter(mask: '###-####-####');
  String? Function(BuildContext, String?)? displayNameTextController2Validator;
  // State field(s) for displayName widget.
  FocusNode? displayNameFocusNode3;
  TextEditingController? displayNameTextController3;
  final displayNameMask3 = MaskTextInputFormatter(mask: '####/##/##');
  String? Function(BuildContext, String?)? displayNameTextController3Validator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    password3Visibility = false;
    password2Visibility = false;
  }

  @override
  void dispose() {
    emailAddressFocusNode1?.dispose();
    emailAddressTextController1?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    password3FocusNode?.dispose();
    password3TextController?.dispose();

    password2FocusNode?.dispose();
    password2TextController?.dispose();

    displayNameFocusNode1?.dispose();
    displayNameTextController1?.dispose();

    emailAddressFocusNode2?.dispose();
    emailAddressTextController2?.dispose();

    displayNameFocusNode2?.dispose();
    displayNameTextController2?.dispose();

    displayNameFocusNode3?.dispose();
    displayNameTextController3?.dispose();
  }
}
