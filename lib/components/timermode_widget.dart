import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'timermode_model.dart';
export 'timermode_model.dart';

class TimermodeWidget extends StatefulWidget {
  const TimermodeWidget({
    super.key,
    required this.passedTime,
  });

  final DateTime? passedTime;

  @override
  State<TimermodeWidget> createState() => _TimermodeWidgetState();
}

class _TimermodeWidgetState extends State<TimermodeWidget> {
  late TimermodeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimermodeModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.timer.setPresetTime(
        mSec: widget.passedTime!.millisecondsSinceEpoch,
        add: false,
      );
      _model.timerController.onResetTimer();

      _model.timerController.onStartTimer();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              content: Text('두번터치 : 나가기,   꾹누르기 : 다크모드/라이트모드 전환'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
      },
      onDoubleTap: () async {
        Navigator.pop(context);
      },
      onLongPress: () async {
        _model.nightmode = !_model.nightmode;
        safeSetState(() {});
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: !_model.nightmode
              ? FlutterFlowTheme.of(context).primaryBackground
              : Color(0xFF121212),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: FlutterFlowTimer(
            initialTime: _model.timerInitialTimeMs,
            getDisplayTime: (value) =>
                StopWatchTimer.getDisplayTime(value, milliSecond: false),
            controller: _model.timerController,
            updateStateInterval: Duration(milliseconds: 1000),
            onChanged: (value, displayTime, shouldUpdate) {
              _model.timerMilliseconds = value;
              _model.timerValue = displayTime;
              if (shouldUpdate) safeSetState(() {});
            },
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                  color: _model.nightmode
                      ? FlutterFlowTheme.of(context).primaryBackground
                      : Color(0xFF121212),
                  fontSize: 60.0,
                  letterSpacing: 0.0,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).headlineSmallIsCustom,
                ),
          ),
        ),
      ),
    );
  }
}
