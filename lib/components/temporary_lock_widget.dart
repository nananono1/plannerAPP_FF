import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'temporary_lock_model.dart';
export 'temporary_lock_model.dart';

class TemporaryLockWidget extends StatefulWidget {
  const TemporaryLockWidget({super.key});

  @override
  State<TemporaryLockWidget> createState() => _TemporaryLockWidgetState();
}

class _TemporaryLockWidgetState extends State<TemporaryLockWidget>
    with TickerProviderStateMixin {
  late TemporaryLockModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TemporaryLockModel());

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
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 30.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  '37db1j6j' /* Insert PIN */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      fontSize: 40.0,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
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
                              await actions.setLandscapeMode();
                              context.safePop();
                            } else if ((_model.insertedPassword !=
                                    valueOrDefault(
                                        currentUserDocument?.secondPin, 0)) &&
                                (_model.insertedCount == 6)) {
                              if (animationsMap[
                                      'rowOnActionTriggerAnimation'] !=
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
                                      '1imgg2qw' /* 7 */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                              await actions.setLandscapeMode();
                              context.safePop();
                            } else if ((_model.insertedPassword !=
                                    valueOrDefault(
                                        currentUserDocument?.secondPin, 0)) &&
                                (_model.insertedCount == 6)) {
                              if (animationsMap[
                                      'rowOnActionTriggerAnimation'] !=
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
                                      'xbuxgy0w' /* 8 */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                              await actions.setLandscapeMode();
                              context.safePop();
                            } else if ((_model.insertedPassword !=
                                    valueOrDefault(
                                        currentUserDocument?.secondPin, 0)) &&
                                (_model.insertedCount == 6)) {
                              if (animationsMap[
                                      'rowOnActionTriggerAnimation'] !=
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
                                      'vtt3s5xg' /* 9 */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                      ].divide(SizedBox(width: 35.0)),
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
                              await actions.setLandscapeMode();
                              context.safePop();
                            } else if ((_model.insertedPassword !=
                                    valueOrDefault(
                                        currentUserDocument?.secondPin, 0)) &&
                                (_model.insertedCount == 6)) {
                              if (animationsMap[
                                      'rowOnActionTriggerAnimation'] !=
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
                                      'pwp35wds' /* 4 */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                              await actions.setLandscapeMode();
                              context.safePop();
                            } else if ((_model.insertedPassword !=
                                    valueOrDefault(
                                        currentUserDocument?.secondPin, 0)) &&
                                (_model.insertedCount == 6)) {
                              if (animationsMap[
                                      'rowOnActionTriggerAnimation'] !=
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
                                      'lylvn4g0' /* 5 */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                              await actions.setLandscapeMode();
                              context.safePop();
                            } else if ((_model.insertedPassword !=
                                    valueOrDefault(
                                        currentUserDocument?.secondPin, 0)) &&
                                (_model.insertedCount == 6)) {
                              if (animationsMap[
                                      'rowOnActionTriggerAnimation'] !=
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
                                      'ggjj2azl' /* 6 */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                      ].divide(SizedBox(width: 35.0)),
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
                              await actions.setLandscapeMode();
                              context.safePop();
                            } else if ((_model.insertedPassword !=
                                    valueOrDefault(
                                        currentUserDocument?.secondPin, 0)) &&
                                (_model.insertedCount == 6)) {
                              if (animationsMap[
                                      'rowOnActionTriggerAnimation'] !=
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
                                      'h6dkx1b5' /* 1 */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                              await actions.setLandscapeMode();
                              await actions.setLandscapeMode();
                              context.safePop();
                            } else if ((_model.insertedPassword !=
                                    valueOrDefault(
                                        currentUserDocument?.secondPin, 0)) &&
                                (_model.insertedCount == 6)) {
                              if (animationsMap[
                                      'rowOnActionTriggerAnimation'] !=
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
                                      'oy46b296' /* 2 */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                              await actions.setLandscapeMode();
                              context.safePop();
                            } else if ((_model.insertedPassword !=
                                    valueOrDefault(
                                        currentUserDocument?.secondPin, 0)) &&
                                (_model.insertedCount == 6)) {
                              if (animationsMap[
                                      'rowOnActionTriggerAnimation'] !=
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
                                      'ym54vorg' /* 3 */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                      ].divide(SizedBox(width: 35.0)),
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
                                      'j0pnremt' /* C */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                              await actions.setLandscapeMode();
                              context.safePop();
                            } else if ((_model.insertedPassword !=
                                    valueOrDefault(
                                        currentUserDocument?.secondPin, 0)) &&
                                (_model.insertedCount == 6)) {
                              if (animationsMap[
                                      'rowOnActionTriggerAnimation'] !=
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
                                      '752yiia7' /* 0 */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                      ].divide(SizedBox(width: 35.0)),
                    ),
                  ].divide(SizedBox(height: 25.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
