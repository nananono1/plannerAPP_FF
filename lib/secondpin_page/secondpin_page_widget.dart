import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/functional/userdeep/second_pin_confirm/second_pin_confirm_widget.dart';
import 'package:flutter/material.dart';
import 'secondpin_page_model.dart';
export 'secondpin_page_model.dart';

class SecondpinPageWidget extends StatefulWidget {
  const SecondpinPageWidget({super.key});

  static String routeName = 'secondpinPage';
  static String routePath = '/secondpinPage';

  @override
  State<SecondpinPageWidget> createState() => _SecondpinPageWidgetState();
}

class _SecondpinPageWidgetState extends State<SecondpinPageWidget> {
  late SecondpinPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SecondpinPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: wrapWithModel(
              model: _model.secondPinConfirmModel,
              updateCallback: () => safeSetState(() {}),
              child: SecondPinConfirmWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
