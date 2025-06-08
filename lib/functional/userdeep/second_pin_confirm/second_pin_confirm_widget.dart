import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'second_pin_confirm_model.dart';
export 'second_pin_confirm_model.dart';

class SecondPinConfirmWidget extends StatefulWidget {
  const SecondPinConfirmWidget({super.key});

  @override
  State<SecondPinConfirmWidget> createState() => _SecondPinConfirmWidgetState();
}

class _SecondPinConfirmWidgetState extends State<SecondPinConfirmWidget>
    with TickerProviderStateMixin {
  late SecondPinConfirmModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SecondPinConfirmModel());

    animationsMap.addAll({
      'rowOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            hz: 10,
            offset: Offset(0.0, 0.0),
            rotation: 0.035,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(200.0, 80.0, 200.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            AutoSizeText(
              FFLocalizations.of(context).getText(
                'xqcjvivv' /* 현재 2차 비밀번호를 입력해 주세요. */,
              ),
              minFontSize: 30.0,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                    fontSize: 40.0,
                    letterSpacing: 0.0,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.circle_sharp,
                    color: _model.insertedCount >= 1
                        ? Color(0xFF282828)
                        : Color(0xFFB1B1B1),
                    size: 50.0,
                  ),
                  Icon(
                    Icons.circle_sharp,
                    color: _model.insertedCount >= 2
                        ? Color(0xFF282828)
                        : Color(0xFFB1B1B1),
                    size: 50.0,
                  ),
                  Icon(
                    Icons.circle_sharp,
                    color: _model.insertedCount >= 3
                        ? Color(0xFF282828)
                        : Color(0xFFB1B1B1),
                    size: 50.0,
                  ),
                  Icon(
                    Icons.circle_sharp,
                    color: _model.insertedCount >= 4
                        ? Color(0xFF282828)
                        : Color(0xFFB1B1B1),
                    size: 50.0,
                  ),
                  Icon(
                    Icons.circle_sharp,
                    color: _model.insertedCount >= 5
                        ? Color(0xFF282828)
                        : Color(0xFFB1B1B1),
                    size: 50.0,
                  ),
                  Icon(
                    Icons.circle_sharp,
                    color: _model.insertedCount >= 6
                        ? Color(0xFF282828)
                        : Color(0xFFB1B1B1),
                    size: 50.0,
                  ),
                ].divide(SizedBox(width: 10.0)),
              ).animateOnActionTrigger(
                animationsMap['rowOnActionTriggerAnimation']!,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.insertedCount = _model.insertedCount + 1;
                          _model.insertedPassword =
                              functions.appendPin(_model.insertedPassword, 7);
                          safeSetState(() {});
                          if ((_model.insertedPassword ==
                                  valueOrDefault(
                                      currentUserDocument?.secondPin, 0)) &&
                              (_model.insertedCount == 6)) {
                            Navigator.pop(context);
                          } else if ((_model.insertedPassword !=
                                  valueOrDefault(
                                      currentUserDocument?.secondPin, 0)) &&
                              (_model.insertedCount == 6)) {
                            if (animationsMap['rowOnActionTriggerAnimation'] !=
                                null) {
                              await animationsMap[
                                      'rowOnActionTriggerAnimation']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            _model.insertedCount = 0;
                            _model.insertedPassword = null;
                            safeSetState(() {});
                          }
                        },
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.circle_sharp,
                                  color: Color(0xFF555555),
                                  size: 100.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '6cdy96xb' /* 7 */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 50.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.insertedCount = _model.insertedCount + 1;
                          _model.insertedPassword =
                              functions.appendPin(_model.insertedPassword, 8);
                          safeSetState(() {});
                          if ((_model.insertedPassword ==
                                  valueOrDefault(
                                      currentUserDocument?.secondPin, 0)) &&
                              (_model.insertedCount == 6)) {
                            Navigator.pop(context);
                          } else if ((_model.insertedPassword !=
                                  valueOrDefault(
                                      currentUserDocument?.secondPin, 0)) &&
                              (_model.insertedCount == 6)) {
                            if (animationsMap['rowOnActionTriggerAnimation'] !=
                                null) {
                              await animationsMap[
                                      'rowOnActionTriggerAnimation']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            _model.insertedCount = 0;
                            _model.insertedPassword = null;
                            safeSetState(() {});
                          }
                        },
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.circle_sharp,
                                  color: Color(0xFF555555),
                                  size: 100.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'dd3sf1kv' /* 8 */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 50.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.insertedCount = _model.insertedCount + 1;
                          _model.insertedPassword =
                              functions.appendPin(_model.insertedPassword, 9);
                          safeSetState(() {});
                          if ((_model.insertedPassword ==
                                  valueOrDefault(
                                      currentUserDocument?.secondPin, 0)) &&
                              (_model.insertedCount == 6)) {
                            Navigator.pop(context);
                          } else if ((_model.insertedPassword !=
                                  valueOrDefault(
                                      currentUserDocument?.secondPin, 0)) &&
                              (_model.insertedCount == 6)) {
                            if (animationsMap['rowOnActionTriggerAnimation'] !=
                                null) {
                              await animationsMap[
                                      'rowOnActionTriggerAnimation']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            _model.insertedCount = 0;
                            _model.insertedPassword = null;
                            safeSetState(() {});
                          }
                        },
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.circle_sharp,
                                  color: Color(0xFF555555),
                                  size: 100.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'nss7y5c4' /* 9 */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 50.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 40.0)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.insertedCount = _model.insertedCount + 1;
                          _model.insertedPassword =
                              functions.appendPin(_model.insertedPassword, 4);
                          safeSetState(() {});
                          if ((_model.insertedPassword ==
                                  valueOrDefault(
                                      currentUserDocument?.secondPin, 0)) &&
                              (_model.insertedCount == 6)) {
                            Navigator.pop(context);
                          } else if ((_model.insertedPassword !=
                                  valueOrDefault(
                                      currentUserDocument?.secondPin, 0)) &&
                              (_model.insertedCount == 6)) {
                            if (animationsMap['rowOnActionTriggerAnimation'] !=
                                null) {
                              await animationsMap[
                                      'rowOnActionTriggerAnimation']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            _model.insertedCount = 0;
                            _model.insertedPassword = null;
                            safeSetState(() {});
                          }
                        },
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.circle_sharp,
                                  color: Color(0xFF555555),
                                  size: 100.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'f1g79k6i' /* 4 */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 50.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.insertedCount = _model.insertedCount + 1;
                          _model.insertedPassword =
                              functions.appendPin(_model.insertedPassword, 5);
                          safeSetState(() {});
                          if ((_model.insertedPassword ==
                                  valueOrDefault(
                                      currentUserDocument?.secondPin, 0)) &&
                              (_model.insertedCount == 6)) {
                            Navigator.pop(context);
                          } else if ((_model.insertedPassword !=
                                  valueOrDefault(
                                      currentUserDocument?.secondPin, 0)) &&
                              (_model.insertedCount == 6)) {
                            if (animationsMap['rowOnActionTriggerAnimation'] !=
                                null) {
                              await animationsMap[
                                      'rowOnActionTriggerAnimation']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            _model.insertedCount = 0;
                            _model.insertedPassword = null;
                            safeSetState(() {});
                          }
                        },
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.circle_sharp,
                                  color: Color(0xFF555555),
                                  size: 100.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'nafdttfw' /* 5 */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 50.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.insertedCount = _model.insertedCount + 1;
                          _model.insertedPassword =
                              functions.appendPin(_model.insertedPassword, 6);
                          safeSetState(() {});
                          if ((_model.insertedPassword ==
                                  valueOrDefault(
                                      currentUserDocument?.secondPin, 0)) &&
                              (_model.insertedCount == 6)) {
                            Navigator.pop(context);
                          } else if ((_model.insertedPassword !=
                                  valueOrDefault(
                                      currentUserDocument?.secondPin, 0)) &&
                              (_model.insertedCount == 6)) {
                            if (animationsMap['rowOnActionTriggerAnimation'] !=
                                null) {
                              await animationsMap[
                                      'rowOnActionTriggerAnimation']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            _model.insertedCount = 0;
                            _model.insertedPassword = null;
                            safeSetState(() {});
                          }
                        },
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.circle_sharp,
                                  color: Color(0xFF555555),
                                  size: 100.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'dea3pguq' /* 6 */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 50.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 40.0)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.insertedCount = _model.insertedCount + 1;
                          _model.insertedPassword =
                              functions.appendPin(_model.insertedPassword, 1);
                          safeSetState(() {});
                          if ((_model.insertedPassword ==
                                  valueOrDefault(
                                      currentUserDocument?.secondPin, 0)) &&
                              (_model.insertedCount == 6)) {
                            Navigator.pop(context);
                          } else if ((_model.insertedPassword !=
                                  valueOrDefault(
                                      currentUserDocument?.secondPin, 0)) &&
                              (_model.insertedCount == 6)) {
                            if (animationsMap['rowOnActionTriggerAnimation'] !=
                                null) {
                              await animationsMap[
                                      'rowOnActionTriggerAnimation']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            _model.insertedCount = 0;
                            _model.insertedPassword = null;
                            safeSetState(() {});
                          }
                        },
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.circle_sharp,
                                  color: Color(0xFF555555),
                                  size: 100.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'ubpi7h2c' /* 1 */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 50.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.insertedCount = _model.insertedCount + 1;
                          _model.insertedPassword =
                              functions.appendPin(_model.insertedPassword, 2);
                          safeSetState(() {});
                          if ((_model.insertedPassword ==
                                  valueOrDefault(
                                      currentUserDocument?.secondPin, 0)) &&
                              (_model.insertedCount == 6)) {
                            Navigator.pop(context);
                          } else if ((_model.insertedPassword !=
                                  valueOrDefault(
                                      currentUserDocument?.secondPin, 0)) &&
                              (_model.insertedCount == 6)) {
                            if (animationsMap['rowOnActionTriggerAnimation'] !=
                                null) {
                              await animationsMap[
                                      'rowOnActionTriggerAnimation']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            _model.insertedCount = 0;
                            _model.insertedPassword = null;
                            safeSetState(() {});
                          }
                        },
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.circle_sharp,
                                  color: Color(0xFF555555),
                                  size: 100.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '43lz3twn' /* 2 */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 50.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.insertedCount = _model.insertedCount + 1;
                          _model.insertedPassword =
                              functions.appendPin(_model.insertedPassword, 3);
                          safeSetState(() {});
                          if ((_model.insertedPassword ==
                                  valueOrDefault(
                                      currentUserDocument?.secondPin, 0)) &&
                              (_model.insertedCount == 6)) {
                            Navigator.pop(context);
                          } else if ((_model.insertedPassword !=
                                  valueOrDefault(
                                      currentUserDocument?.secondPin, 0)) &&
                              (_model.insertedCount == 6)) {
                            if (animationsMap['rowOnActionTriggerAnimation'] !=
                                null) {
                              await animationsMap[
                                      'rowOnActionTriggerAnimation']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            _model.insertedCount = 0;
                            _model.insertedPassword = null;
                            safeSetState(() {});
                          }
                        },
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.circle_sharp,
                                  color: Color(0xFF555555),
                                  size: 100.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '5hghs8cs' /* 3 */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 50.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 40.0)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.insertedPassword = null;
                          _model.insertedCount = 0;
                          safeSetState(() {});
                        },
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.circle_sharp,
                                  color: Color(0xFF555555),
                                  size: 100.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    't7dlgw99' /* C */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 50.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.insertedCount = _model.insertedCount + 1;
                          _model.insertedPassword =
                              functions.appendPin(_model.insertedPassword, 0);
                          safeSetState(() {});
                          if ((_model.insertedPassword ==
                                  valueOrDefault(
                                      currentUserDocument?.secondPin, 0)) &&
                              (_model.insertedCount == 6)) {
                            Navigator.pop(context);
                          } else if ((_model.insertedPassword !=
                                  valueOrDefault(
                                      currentUserDocument?.secondPin, 0)) &&
                              (_model.insertedCount == 6)) {
                            if (animationsMap['rowOnActionTriggerAnimation'] !=
                                null) {
                              await animationsMap[
                                      'rowOnActionTriggerAnimation']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            _model.insertedCount = 0;
                            _model.insertedPassword = null;
                            safeSetState(() {});
                          }
                        },
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.circle_sharp,
                                  color: Color(0xFF555555),
                                  size: 100.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '5zyx490l' /* 0 */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        fontSize: 50.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.insertedPassword = functions
                              .removeLastDigit(_model.insertedPassword);
                          _model.insertedCount = _model.insertedCount + -1;
                          safeSetState(() {});
                        },
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.circle_sharp,
                                  color: Color(0xFF555555),
                                  size: 100.0,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 50.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 40.0)),
                  ),
                ].divide(SizedBox(height: 20.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
