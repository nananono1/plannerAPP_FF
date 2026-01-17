import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/timermode_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/functional/call_while_study/call_while_study_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'timer_page_model.dart';
export 'timer_page_model.dart';

class TimerPageWidget extends StatefulWidget {
  const TimerPageWidget({
    super.key,
    required this.subNameParameter,
    required this.studiedDetailsParameter,
    required this.indexIDParameter,
  });

  final String? subNameParameter;
  final String? studiedDetailsParameter;
  final int? indexIDParameter;

  static String routeName = 'timerPage';
  static String routePath = '/timerPage';

  @override
  State<TimerPageWidget> createState() => _TimerPageWidgetState();
}

class _TimerPageWidgetState extends State<TimerPageWidget> {
  late TimerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimerPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.didChangeAppLifecycleState(
        true,
      );
      if (FFAppState().crashed) {
        await Future.delayed(
          Duration(
            milliseconds: 500,
          ),
        );
        _model.timerController.timer.setPresetTime(
          mSec: getCurrentTimestamp.millisecondsSinceEpoch -
              FFAppState()
                  .pageStateSchemaVariable
                  .inputListState
                  .elementAtOrNull(widget.indexIDParameter!)!
                  .studyStartTime
                  .lastOrNull!
                  .millisecondsSinceEpoch,
          add: false,
        );
        _model.timerController.onResetTimer();

        await Future.delayed(
          Duration(
            milliseconds: 500,
          ),
        );
        _model.timerController.onStartTimer();
        return;
      }
      FFAppState().dailyInfoList = functions
          .makeDailyList(FFAppState().pageStateSchemaVariable)!
          .toList()
          .cast<DailyInfoEachStruct>();
      FFAppState().update(() {});
      if (FFAppState().dailyInfoList.length == 0) {
        FFAppState().addToDailyInfoList(DailyInfoEachStruct(
          starttime: getCurrentTimestamp,
          subject: '공부를 시작해봅시다!',
        ));
        FFAppState().update(() {});
      }
      _model.locationtimerpage = await actions.getCurrentLocation();
      await Future.delayed(
        Duration(
          milliseconds: 3000,
        ),
      );
      _model.widgetOn = false;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    // On page dispose action.
    () async {
      await actions.didChangeAppLifecycleState(
        false,
      );
    }();

    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<NotificationRecord>>(
      stream: queryNotificationRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<NotificationRecord> timerPageNotificationRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final timerPageNotificationRecord =
            timerPageNotificationRecordList.isNotEmpty
                ? timerPageNotificationRecordList.first
                : null;

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
              body: NestedScrollView(
                floatHeaderSlivers: false,
                headerSliverBuilder: (context, _) => [
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                  ))
                    SliverAppBar(
                      pinned: true,
                      floating: false,
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryBackground,
                      automaticallyImplyLeading: false,
                      leading: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          if (FFAppState().timeIsGoing) {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('공부중!'),
                                  content: Text('타이머를 정지한 후 다시 시도해주세요'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Ok'),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            context.goNamed(PageeeeWidget.routeName);
                          }
                        },
                      ),
                      actions: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 35.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderRadius: 15.0,
                              borderWidth: 3.0,
                              buttonSize: 48.0,
                              icon: Icon(
                                Icons.question_mark_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                        ),
                      ],
                      toolbarHeight: 40.0,
                      elevation: 0.0,
                    )
                ],
                body: Builder(
                  builder: (context) {
                    return SafeArea(
                      top: false,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            30.0, 0.0, 30.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Container(
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      30.0, 10.0, 0.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(
                                                        0.0,
                                                        2.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          widget
                                                              .subNameParameter,
                                                          'Subname',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              fontSize: 30.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: AutoSizeText(
                                                        valueOrDefault<String>(
                                                          widget
                                                              .studiedDetailsParameter,
                                                          '공부내용',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              fontSize: 30.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Builder(
                                              builder: (context) => InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (FFAppState()
                                                      .timeIsGoing) {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      dialogContext)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: Container(
                                                              height: double
                                                                  .infinity,
                                                              width: double
                                                                  .infinity,
                                                              child:
                                                                  TimermodeWidget(
                                                                passedTime: DateTime
                                                                    .fromMillisecondsSinceEpoch(
                                                                        _model
                                                                            .timerMilliseconds),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  }
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(),
                                                  child: Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    20.0,
                                                                    0.0,
                                                                    20.0),
                                                        child: FlutterFlowTimer(
                                                          initialTime: _model
                                                              .timerInitialTimeMs,
                                                          getDisplayTime: (value) =>
                                                              StopWatchTimer
                                                                  .getDisplayTime(
                                                                      value,
                                                                      milliSecond:
                                                                          false),
                                                          controller: _model
                                                              .timerController,
                                                          updateStateInterval:
                                                              Duration(
                                                                  milliseconds:
                                                                      1000),
                                                          onChanged: (value,
                                                              displayTime,
                                                              shouldUpdate) {
                                                            _model.timerMilliseconds =
                                                                value;
                                                            _model.timerValue =
                                                                displayTime;
                                                            if (shouldUpdate)
                                                              safeSetState(
                                                                  () {});
                                                          },
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .notoSansJp(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 60.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                      if (_model.widgetOn)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, 0.0),
                                                          child: Container(
                                                            width: 330.4,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Lottie.asset(
                                                                  'assets/jsons/rlrx0PkNZ1.json',
                                                                  width: 100.0,
                                                                  height: 200.0,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                  frameRate:
                                                                      FrameRate(
                                                                          60.0),
                                                                  animate: true,
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.75),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '0xxj46rj' /* 타이머 시간을 클릭하여 확대가능 */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          fontSize:
                                                                              15.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Builder(
                                                  builder: (context) {
                                                    if (!FFAppState()
                                                        .timeIsGoing) {
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              FFAppState()
                                                                      .timeIsGoing =
                                                                  true;
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              FFAppState()
                                                                  .updatePageStateSchemaVariableStruct(
                                                                (e) => e
                                                                  ..updateInputListState(
                                                                    (e) => e[widget
                                                                        .indexIDParameter!]
                                                                      ..updateStudyStartTime(
                                                                        (e) => e
                                                                            .add(getCurrentTimestamp),
                                                                      )
                                                                      ..updateInNaegong(
                                                                        (e) => e
                                                                            .add(true),
                                                                      ),
                                                                  ),
                                                              );
                                                              FFAppState()
                                                                      .currentIndexIDParameter =
                                                                  widget
                                                                      .indexIDParameter!;
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                              await Future
                                                                  .delayed(
                                                                Duration(
                                                                  milliseconds:
                                                                      200,
                                                                ),
                                                              );
                                                              _model
                                                                  .timerController
                                                                  .onStartTimer();
                                                              unawaited(
                                                                () async {
                                                                  _model.apiResultc1j =
                                                                      await ChangeCellColorCall
                                                                          .call(
                                                                    studentname:
                                                                        currentUserDisplayName,
                                                                    isgoing:
                                                                        true,
                                                                    spotSheetLink: timerPageNotificationRecord
                                                                        ?.spotdatas
                                                                        .where((e) =>
                                                                            e.spot ==
                                                                            valueOrDefault(currentUserDocument?.spot,
                                                                                ''))
                                                                        .toList()
                                                                        .firstOrNull
                                                                        ?.sheetRoot,
                                                                    action:
                                                                        'attendance',
                                                                    storekey: timerPageNotificationRecord
                                                                        ?.spotdatas
                                                                        .where((e) =>
                                                                            e.spot ==
                                                                            valueOrDefault(currentUserDocument?.spot,
                                                                                ''))
                                                                        .toList()
                                                                        .firstOrNull
                                                                        ?.spotid,
                                                                  );
                                                                }(),
                                                              );
                                                              await Future
                                                                  .delayed(
                                                                Duration(
                                                                  milliseconds:
                                                                      200,
                                                                ),
                                                              );
                                                              _model.widgetOn =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
                                                              await Future
                                                                  .delayed(
                                                                Duration(
                                                                  milliseconds:
                                                                      5000,
                                                                ),
                                                              );
                                                              _model.widgetOn =
                                                                  false;
                                                              safeSetState(
                                                                  () {});

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Icon(
                                                              Icons.play_circle,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 70.0,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'm1671iaz' /* 공부시작 */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    } else {
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Builder(
                                                            builder:
                                                                (context) =>
                                                                    InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
                                                                      insetPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0)
                                                                          .resolve(
                                                                              Directionality.of(context)),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          FocusScope.of(dialogContext)
                                                                              .unfocus();
                                                                          FocusManager
                                                                              .instance
                                                                              .primaryFocus
                                                                              ?.unfocus();
                                                                        },
                                                                        child:
                                                                            CallWhileStudyWidget(),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .circle_notifications,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 70.0,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'pqklq3cd' /* 관리자 호출 */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    }
                                                  },
                                                ),
                                                if (FFAppState().timeIsGoing ==
                                                    true)
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            FFAppState()
                                                                    .timeIsGoing =
                                                                false;
                                                            FFAppState()
                                                                .update(() {});
                                                            FFAppState()
                                                                .updatePageStateSchemaVariableStruct(
                                                              (e) => e
                                                                ..updateInputListState(
                                                                  (e) => e[widget
                                                                      .indexIDParameter!]
                                                                    ..updateStudyEndTime(
                                                                      (e) => e.add(
                                                                          getCurrentTimestamp),
                                                                    ),
                                                                ),
                                                            );
                                                            FFAppState()
                                                                    .crashed =
                                                                false;
                                                            FFAppState()
                                                                .update(() {});
                                                            await Future
                                                                .delayed(
                                                              Duration(
                                                                milliseconds:
                                                                    200,
                                                              ),
                                                            );
                                                            _model
                                                                .timerController
                                                                .onStopTimer();
                                                            await Future
                                                                .delayed(
                                                              Duration(
                                                                milliseconds:
                                                                    200,
                                                              ),
                                                            );
                                                            await ChangeCellColorCall
                                                                .call(
                                                              studentname:
                                                                  currentUserDisplayName,
                                                              isgoing: false,
                                                              spotSheetLink: timerPageNotificationRecord
                                                                  ?.spotdatas
                                                                  .where((e) =>
                                                                      e.spot ==
                                                                      valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.spot,
                                                                          ''))
                                                                  .toList()
                                                                  .firstOrNull
                                                                  ?.sheetRoot,
                                                              action:
                                                                  'attendance',
                                                              storekey: timerPageNotificationRecord
                                                                  ?.spotdatas
                                                                  .where((e) =>
                                                                      e.spot ==
                                                                      valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.spot,
                                                                          ''))
                                                                  .toList()
                                                                  .firstOrNull
                                                                  ?.spotid,
                                                            );
                                                          },
                                                          onDoubleTap:
                                                              () async {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  content: Text(
                                                                      '더블클릭방지'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          },
                                                          child: Icon(
                                                            Icons.pause_circle,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 70.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'ax25wo46' /* 일시정지 */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                if (FFAppState().timeIsGoing ==
                                                    true)
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          FFAppState()
                                                                  .timeIsGoing =
                                                              false;
                                                          FFAppState().crashed =
                                                              false;
                                                          FFAppState()
                                                              .update(() {});
                                                          FFAppState()
                                                              .updatePageStateSchemaVariableStruct(
                                                            (e) => e
                                                              ..updateInputListState(
                                                                (e) => e[widget
                                                                    .indexIDParameter!]
                                                                  ..updateStudyEndTime(
                                                                    (e) => e.add(
                                                                        getCurrentTimestamp),
                                                                  ),
                                                              ),
                                                          );
                                                          FFAppState()
                                                              .update(() {});
                                                          await Future.delayed(
                                                            Duration(
                                                              milliseconds: 200,
                                                            ),
                                                          );
                                                          _model.timerController
                                                              .onStopTimer();
                                                          _model.timerController
                                                              .onResetTimer();

                                                          await Future.delayed(
                                                            Duration(
                                                              milliseconds: 200,
                                                            ),
                                                          );

                                                          context.goNamed(
                                                              PageeeeWidget
                                                                  .routeName);

                                                          await ChangeCellColorCall
                                                              .call(
                                                            studentname:
                                                                currentUserDisplayName,
                                                            isgoing: false,
                                                            spotSheetLink: timerPageNotificationRecord
                                                                ?.spotdatas
                                                                .where((e) =>
                                                                    e.spot ==
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.spot,
                                                                        ''))
                                                                .toList()
                                                                .firstOrNull
                                                                ?.sheetRoot,
                                                            action:
                                                                'attendance',
                                                            storekey: timerPageNotificationRecord
                                                                ?.spotdatas
                                                                .where((e) =>
                                                                    e.spot ==
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.spot,
                                                                        ''))
                                                                .toList()
                                                                .firstOrNull
                                                                ?.spotid,
                                                          );
                                                        },
                                                        onDoubleTap: () async {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    '더블클릭방지'),
                                                                content: Text(
                                                                    '한번만 클릭해주세요.'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        'Ok'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Icon(
                                                          Icons.stop_circle,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 70.0,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    5.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'n06wp2nl' /* 공부중지 */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                              ].divide(SizedBox(width: 20.0)),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          40.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'wlepzmkd' /* 현재공부기록 */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(30.0,
                                                                20.0, 0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 300.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 4.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                              0.0,
                                                              2.0,
                                                            ),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    30.0,
                                                                    0.0,
                                                                    30.0,
                                                                    0.0),
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '7kxuoqd1' /* 시작시각 */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final studyEachParameterTimerPage = FFAppState().pageStateSchemaVariable.inputListState.elementAtOrNull(widget.indexIDParameter!)?.studyStartTime.toList() ?? [];

                                                                              return Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: List.generate(studyEachParameterTimerPage.length, (studyEachParameterTimerPageIndex) {
                                                                                  final studyEachParameterTimerPageItem = studyEachParameterTimerPage[studyEachParameterTimerPageIndex];
                                                                                  return Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 100.0,
                                                                                      height: 50.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Text(
                                                                                          dateTimeFormat(
                                                                                            "jm",
                                                                                            studyEachParameterTimerPageItem,
                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '5npdubtt' /* 종료시각 */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final studyEachParameterTimerPage2 = FFAppState().pageStateSchemaVariable.inputListState.elementAtOrNull(widget.indexIDParameter!)?.studyEndTime.toList() ?? [];

                                                                              return Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: List.generate(studyEachParameterTimerPage2.length, (studyEachParameterTimerPage2Index) {
                                                                                  final studyEachParameterTimerPage2Item = studyEachParameterTimerPage2[studyEachParameterTimerPage2Index];
                                                                                  return Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 100.0,
                                                                                      height: 50.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Text(
                                                                                          dateTimeFormat(
                                                                                            "jm",
                                                                                            studyEachParameterTimerPage2Item,
                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '0ocuuju1' /* 공부시간 */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final studyEachParameterTimerPage2 = FFAppState().pageStateSchemaVariable.inputListState.elementAtOrNull(widget.indexIDParameter!)?.studyEndTime.toList() ?? [];

                                                                              return Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: List.generate(studyEachParameterTimerPage2.length, (studyEachParameterTimerPage2Index) {
                                                                                  final studyEachParameterTimerPage2Item = studyEachParameterTimerPage2[studyEachParameterTimerPage2Index];
                                                                                  return Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 100.0,
                                                                                      height: 50.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Text(
                                                                                          functions.calculateStudyTimeList2(FFAppState().pageStateSchemaVariable.inputListState.elementAtOrNull(widget.indexIDParameter!)!.studyStartTime.toList(), FFAppState().pageStateSchemaVariable.inputListState.elementAtOrNull(widget.indexIDParameter!)!.studyEndTime.toList()).elementAtOrNull(studyEachParameterTimerPage2Index)!,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible(
                                  child: Stack(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 3.0, 0.0),
                                          child: Container(
                                            width: 30.0,
                                            height: 600.0,
                                            decoration: BoxDecoration(),
                                            child: Visibility(
                                              visible: _model.widgetOn == true,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 5.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/up.gif',
                                                        width: 200.0,
                                                        height: 300.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/down.gif',
                                                        width: 200.0,
                                                        height: 300.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            3.0, 0.0, 3.0, 0.0),
                                        child: Container(
                                          width: 30.0,
                                          height: 600.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xE8F1F4F8),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 15.0, 0.0, 0.0),
                                    child: SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'iqmzf0xo' /* 오늘의 공부 타임라인 */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final dailyInfoListChild =
                                                    FFAppState()
                                                        .dailyInfoList
                                                        .toList();

                                                return SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        dailyInfoListChild
                                                            .length,
                                                        (dailyInfoListChildIndex) {
                                                      final dailyInfoListChildItem =
                                                          dailyInfoListChild[
                                                              dailyInfoListChildIndex];
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 300.0,
                                                              height: 200.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        4.0,
                                                                    color: Color(
                                                                        0x33000000),
                                                                    offset:
                                                                        Offset(
                                                                      0.0,
                                                                      2.0,
                                                                    ),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          20.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          20.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20.0),
                                                                ),
                                                                border:
                                                                    Border.all(
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    dailyInfoListChildItem
                                                                        .colorPicked,
                                                                    Color(
                                                                        0xFFE2F9FC),
                                                                  ),
                                                                  width: 5.0,
                                                                ),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    dailyInfoListChildItem
                                                                        .subject,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    dailyInfoListChildItem
                                                                        .details,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      dateTimeFormat(
                                                                        "jm",
                                                                        dailyInfoListChildItem
                                                                            .starttime,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      '0',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      dateTimeFormat(
                                                                        "jm",
                                                                        dailyInfoListChildItem
                                                                            .endtime,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      '1',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        10.0)),
                                                              ),
                                                            ),
                                                            if (valueOrDefault<
                                                                bool>(
                                                              dailyInfoListChildIndex <
                                                                  FFAppState()
                                                                      .dailyInfoList
                                                                      .length,
                                                              false,
                                                            ))
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            10.0,
                                                                            0.0,
                                                                            10.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .arrow_downward_sharp,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
