import '/components/temporary_lock_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'temporary_lock_page_widget.dart' show TemporaryLockPageWidget;
import 'package:flutter/material.dart';

class TemporaryLockPageModel extends FlutterFlowModel<TemporaryLockPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for temporaryLock component.
  late TemporaryLockModel temporaryLockModel;

  @override
  void initState(BuildContext context) {
    temporaryLockModel = createModel(context, () => TemporaryLockModel());
  }

  @override
  void dispose() {
    temporaryLockModel.dispose();
  }
}
