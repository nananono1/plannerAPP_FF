import '/components/widget_to_capture_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'backup_widget.dart' show BackupWidget;
import 'package:flutter/material.dart';

class BackupModel extends FlutterFlowModel<BackupWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for WidgetToCaptureComponent component.
  late WidgetToCaptureComponentModel widgetToCaptureComponentModel;

  @override
  void initState(BuildContext context) {
    widgetToCaptureComponentModel =
        createModel(context, () => WidgetToCaptureComponentModel());
  }

  @override
  void dispose() {
    widgetToCaptureComponentModel.dispose();
  }
}
