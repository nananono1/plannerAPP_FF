import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'webviewer_model.dart';
export 'webviewer_model.dart';

class WebviewerWidget extends StatefulWidget {
  const WebviewerWidget({
    super.key,
    required this.passedLink,
  });

  final String? passedLink;

  @override
  State<WebviewerWidget> createState() => _WebviewerWidgetState();
}

class _WebviewerWidgetState extends State<WebviewerWidget> {
  late WebviewerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WebviewerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: custom_widgets.FilteredWebView(
          width: double.infinity,
          height: double.infinity,
          initialUrl: widget.passedLink,
        ),
      ),
    );
  }
}
