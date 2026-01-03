import '/backend/backend.dart';
import '/components/secure_sign2_capture_widget.dart';
import '/components/sign2capture_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'admin_sign_check_widget.dart' show AdminSignCheckWidget;
import 'package:flutter/material.dart';

class AdminSignCheckModel extends FlutterFlowModel<AdminSignCheckWidget> {
  ///  Local state fields for this page.

  int? selectedIndex;

  DocumentReference? uid;

  bool loading = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - checkUserClaims] action in adminSignCheck widget.
  String? checkUserClaimAction;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<UsersRecord>? dddd;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  UsersRecord? itemListSelected;
  // Model for sign2capture component.
  late Sign2captureModel sign2captureModel;
  // Model for secureSign2Capture component.
  late SecureSign2CaptureModel secureSign2CaptureModel;

  @override
  void initState(BuildContext context) {
    sign2captureModel = createModel(context, () => Sign2captureModel());
    secureSign2CaptureModel =
        createModel(context, () => SecureSign2CaptureModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    sign2captureModel.dispose();
    secureSign2CaptureModel.dispose();
  }
}
