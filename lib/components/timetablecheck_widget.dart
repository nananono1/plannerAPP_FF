import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'timetablecheck_model.dart';
export 'timetablecheck_model.dart';

class TimetablecheckWidget extends StatefulWidget {
  const TimetablecheckWidget({super.key});

  @override
  State<TimetablecheckWidget> createState() => _TimetablecheckWidgetState();
}

class _TimetablecheckWidgetState extends State<TimetablecheckWidget> {
  late TimetablecheckModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimetablecheckModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 30.0),
      child: Container(
        width: 600.0,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: AuthUserStreamWidget(
          builder: (context) => Container(
            width: double.infinity,
            height: double.infinity,
            child: custom_widgets.WeeklyPlannerWidget3(
              width: double.infinity,
              height: double.infinity,
              pickedData: currentUserDocument?.scheduleToChange,
            ),
          ),
        ),
      ),
    );
  }
}
