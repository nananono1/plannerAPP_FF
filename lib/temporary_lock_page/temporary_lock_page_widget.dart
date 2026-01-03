import '/components/temporary_lock_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'temporary_lock_page_model.dart';
export 'temporary_lock_page_model.dart';

class TemporaryLockPageWidget extends StatefulWidget {
  const TemporaryLockPageWidget({super.key});

  static String routeName = 'temporaryLockPage';
  static String routePath = '/temporaryLockPage';

  @override
  State<TemporaryLockPageWidget> createState() =>
      _TemporaryLockPageWidgetState();
}

class _TemporaryLockPageWidgetState extends State<TemporaryLockPageWidget> {
  late TemporaryLockPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TemporaryLockPageModel());

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
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
              child: wrapWithModel(
                model: _model.temporaryLockModel,
                updateCallback: () => safeSetState(() {}),
                child: TemporaryLockWidget(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
