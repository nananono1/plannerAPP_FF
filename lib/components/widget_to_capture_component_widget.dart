import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'widget_to_capture_component_model.dart';
export 'widget_to_capture_component_model.dart';

class WidgetToCaptureComponentWidget extends StatefulWidget {
  const WidgetToCaptureComponentWidget({super.key});

  @override
  State<WidgetToCaptureComponentWidget> createState() =>
      _WidgetToCaptureComponentWidgetState();
}

class _WidgetToCaptureComponentWidgetState
    extends State<WidgetToCaptureComponentWidget> {
  late WidgetToCaptureComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WidgetToCaptureComponentModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(
      () async {
        FFAppState().updatePageStateSchemaVariableStruct(
          (e) => e..teacherquoteState = _model.textController.text,
        );
        safeSetState(() {});
      },
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
    context.watch<FFAppState>();

    return Container(
      width: 1200.0,
      height: 1000.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 20.0),
              child: GestureDetector(
                onVerticalDragEnd: (details) async {
                  Scaffold.of(context).openDrawer();
                },
                child: Container(
                  width: 100.0,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 45,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 40.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 5.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 165.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
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
                                      borderRadius: BorderRadius.circular(15.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'zzre9tcq' /* 수면시간 :  */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                        TextSpan(
                                                          text: valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                              "Hm",
                                                              FFAppState()
                                                                  .pageStateSchemaVariable
                                                                  .dailyStartPara
                                                                  .sleepTime,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            '미작성',
                                                          ),
                                                          style: GoogleFonts
                                                              .readexPro(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 15.0,
                                                          ),
                                                        )
                                                      ],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'yd5mk8er' /* 기상시간 :  */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                        TextSpan(
                                                          text: valueOrDefault<
                                                              String>(
                                                            dateTimeFormat(
                                                              "Hm",
                                                              FFAppState()
                                                                  .pageStateSchemaVariable
                                                                  .dailyStartPara
                                                                  .getupTime,
                                                              locale: FFLocalizations
                                                                      .of(context)
                                                                  .languageCode,
                                                            ),
                                                            '미작성',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        )
                                                      ],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'fwsoq0gy' /* 목표공부시간 :  */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                        TextSpan(
                                                          text: valueOrDefault<
                                                              String>(
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .dailyStartPara
                                                                .goalTime,
                                                            '10h 30m',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        )
                                                      ],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  RichText(
                                                    textScaler:
                                                        MediaQuery.of(context)
                                                            .textScaler,
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'e66tnlml' /* 현재공부시간 :  */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMediumIsCustom,
                                                              ),
                                                        ),
                                                        TextSpan(
                                                          text: valueOrDefault<
                                                              String>(
                                                            functions.calculateTotalStudyTime(
                                                                FFAppState()
                                                                    .pageStateSchemaVariable
                                                                    .inputListState
                                                                    .toList()),
                                                            '0h 0m',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        )
                                                      ],
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 10.0)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 260.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
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
                                            BorderRadius.circular(15.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 2.0,
                                        ),
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 5.0, 5.0, 5.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: custom_widgets
                                              .DailyPieChartBottom(
                                            width: double.infinity,
                                            height: double.infinity,
                                            pageStateSchema: FFAppState()
                                                .pageStateSchemaVariable,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 400.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
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
                                            BorderRadius.circular(15.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 5.0, 10.0, 5.0),
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              child: custom_widgets
                                                  .StudyGaugeChart(
                                                width: double.infinity,
                                                height: double.infinity,
                                                targetStudyTime:
                                                    valueOrDefault<String>(
                                                  FFAppState()
                                                      .pageStateSchemaVariable
                                                      .dailyStartPara
                                                      .goalTime,
                                                  '12h 00m',
                                                ),
                                                pageStateSchema: FFAppState()
                                                    .pageStateSchemaVariable,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 15.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 15.0, 0.0),
              child: Container(
                width: 100.0,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  safeSetState(() {
                                    _model.textController?.text =
                                        valueOrDefault<String>(
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .teacherquoteState,
                                      '코멘트를 남겨주세요',
                                    );
                                  });
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 65.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
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
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            FFAppState()
                                                .pageStateSchemaVariable
                                                .basicInfoState
                                                .userName,
                                            '이름',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            dateTimeFormat(
                                              "yyyy\'년 \'M\'월 \'d\'일\'",
                                              FFAppState()
                                                  .pageStateSchemaVariable
                                                  .submittedDatePlanner,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            '0000년 00월 00일',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 30.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            functions.calculateTotalStudyTime(
                                                FFAppState()
                                                    .pageStateSchemaVariable
                                                    .inputListState
                                                    .toList()),
                                            '12h 30m',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMediumIsCustom,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 15,
                                child: Container(
                                  width: 100.0,
                                  height: 512.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
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
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(
                                      color: Color(0xFFE5E7EB),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 35.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE8BA95),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(15.0),
                                            topRight: Radius.circular(15.0),
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'vy8q87z0' /* TO DO LIST */,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: Colors.white,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 35.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x98E8BA95),
                                        ),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'u1nyg1mj' /* STUDY PLAN */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -0.95, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'vy6atp7g' /* SUB */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            height: 440.0,
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 5,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 50,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 5,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 50,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 5,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 50,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 5,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 50,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 5,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 50,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 5,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 50,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 5,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 50,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 5,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 50,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 5,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 50,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 5,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 50,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          flex: 5,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        20.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 50,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 3,
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        20.0),
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0.0),
                                                              ),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Builder(
                                                  builder: (context) {
                                                    final plannerinputchildLoad =
                                                        FFAppState()
                                                            .pageStateSchemaVariable
                                                            .inputListState
                                                            .toList()
                                                            .take(20)
                                                            .toList();

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
                                                      primary: false,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          plannerinputchildLoad
                                                              .length,
                                                      itemBuilder: (context,
                                                          plannerinputchildLoadIndex) {
                                                        final plannerinputchildLoadItem =
                                                            plannerinputchildLoad[
                                                                plannerinputchildLoadIndex];
                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              flex: 5,
                                                              child: Container(
                                                                height: 40.0,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  minWidth:
                                                                      30.0,
                                                                  minHeight:
                                                                      20.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      AutoSizeText(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      plannerinputchildLoadItem
                                                                          .subjectNamePlanner,
                                                                      '과목명',
                                                                    ).maybeHandleOverflow(
                                                                      maxChars:
                                                                          5,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    minFontSize:
                                                                        8.0,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 50,
                                                              child: Container(
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            plannerinputchildLoadItem.whatIDid,
                                                                            '공부내용',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.circle_rounded,
                                                                            color:
                                                                                plannerinputchildLoadItem.pickedColor,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if (plannerinputchildLoadItem
                                                                        .hasStudyEndTime())
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              20.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              functions.calculateStudyTime(plannerinputchildLoadItem.studyStartTime.toList(), plannerinputchildLoadItem.studyEndTime.toList()),
                                                                              '00:00',
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 3,
                                                              child: Container(
                                                                height: 40.0,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  minWidth:
                                                                      20.0,
                                                                  minHeight:
                                                                      20.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      if (plannerinputchildLoadItem
                                                                              .isdone ==
                                                                          'done') {
                                                                        return Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.circle_outlined,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        );
                                                                      } else if (plannerinputchildLoadItem
                                                                              .isdone ==
                                                                          'notyet') {
                                                                        return Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.change_history,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        return FaIcon(
                                                                          FontAwesomeIcons
                                                                              .times,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              24.0,
                                                                        );
                                                                      }
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              VerticalDivider(
                                thickness: 3.0,
                                color: Colors.white,
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  width: 100.0,
                                  height: 510.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
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
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 35.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE8BA95),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(10.0),
                                            topRight: Radius.circular(10.0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'of4vvwzw' /* TimeTable */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (FFAppState().PlannerStartTime <= 5)
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: AutoSizeText(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'nlk8wjxi' /* 5 */,
                                                    ),
                                                    minFontSize: 10.0,
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
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell051',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell052',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell053',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell054',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell055',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell056',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (FFAppState().PlannerStartTime <= 6)
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: AutoSizeText(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'r38cwv26' /* 6 */,
                                                    ),
                                                    minFontSize: 10.0,
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
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell061',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell062',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell063',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell064',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell065',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell066',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (FFAppState().PlannerStartTime <= 7)
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: AutoSizeText(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'bchh104x' /* 7 */,
                                                    ),
                                                    minFontSize: 10.0,
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
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell071',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell072',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell073',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell074',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell075',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell076',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (FFAppState().PlannerStartTime <= 8)
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: AutoSizeText(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'q9tmue14' /* 8 */,
                                                    ),
                                                    minFontSize: 10.0,
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
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell081',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell082',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell083',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell084',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell085',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell086',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: AutoSizeText(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'o55cz1wn' /* 9 */,
                                                  ),
                                                  minFontSize: 10.0,
                                                  style:
                                                      FlutterFlowTheme.of(
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
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell091',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell092',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell093',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell094',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell095',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell096',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: AutoSizeText(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '6yn8asc4' /* 10 */,
                                                  ),
                                                  minFontSize: 10.0,
                                                  style:
                                                      FlutterFlowTheme.of(
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
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell101',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell102',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell103',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell104',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell105',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell106',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: AutoSizeText(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    't88gmrls' /* 11 */,
                                                  ),
                                                  minFontSize: 10.0,
                                                  style:
                                                      FlutterFlowTheme.of(
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
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell111',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell112',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell113',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell114',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell115',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell116',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: AutoSizeText(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'r86dt2ye' /* 12 */,
                                                  ),
                                                  minFontSize: 10.0,
                                                  style:
                                                      FlutterFlowTheme.of(
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
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell121',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell122',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell123',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell124',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell125',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell126',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: AutoSizeText(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '52g66dts' /* 13 */,
                                                  ),
                                                  minFontSize: 10.0,
                                                  style:
                                                      FlutterFlowTheme.of(
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
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell131',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell132',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell133',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell134',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell135',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell136',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: AutoSizeText(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '8iu42wzd' /* 14 */,
                                                  ),
                                                  minFontSize: 10.0,
                                                  style:
                                                      FlutterFlowTheme.of(
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
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell141',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell142',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell143',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell144',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell145',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell146',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: AutoSizeText(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'n952sgft' /* 15 */,
                                                  ),
                                                  minFontSize: 10.0,
                                                  style:
                                                      FlutterFlowTheme.of(
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
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell151',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell152',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell153',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell154',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell155',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell156',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: AutoSizeText(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '9587mfbd' /* 16 */,
                                                  ),
                                                  minFontSize: 10.0,
                                                  style:
                                                      FlutterFlowTheme.of(
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
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell161',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell162',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell163',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell164',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell165',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell166',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: AutoSizeText(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'qway0kkv' /* 17 */,
                                                  ),
                                                  minFontSize: 10.0,
                                                  style:
                                                      FlutterFlowTheme.of(
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
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell171',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell172',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell173',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell174',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell175',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell176',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: AutoSizeText(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'phg4bqeo' /* 18 */,
                                                  ),
                                                  minFontSize: 10.0,
                                                  style:
                                                      FlutterFlowTheme.of(
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
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell181',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell182',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell183',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell184',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell185',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell186',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: AutoSizeText(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'qa1b6o0q' /* 19 */,
                                                  ),
                                                  minFontSize: 10.0,
                                                  style:
                                                      FlutterFlowTheme.of(
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
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell191',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell192',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell193',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell194',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell195',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell196',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: AutoSizeText(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'pg18up5t' /* 20 */,
                                                  ),
                                                  minFontSize: 10.0,
                                                  style:
                                                      FlutterFlowTheme.of(
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
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell201',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell202',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell203',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell204',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell205',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell206',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: AutoSizeText(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'mfbp548d' /* 21 */,
                                                  ),
                                                  minFontSize: 10.0,
                                                  style:
                                                      FlutterFlowTheme.of(
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
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell211',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell212',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell213',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell214',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell215',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell216',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(
                                                      valueOrDefault<double>(
                                                    FFAppState().PlannerEndTime ==
                                                            22
                                                        ? 10.0
                                                        : 0.0,
                                                    0.0,
                                                  )),
                                                  bottomRight:
                                                      Radius.circular(0.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: AutoSizeText(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'zcrujv4p' /* 22 */,
                                                  ),
                                                  minFontSize: 10.0,
                                                  style:
                                                      FlutterFlowTheme.of(
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
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell221',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell222',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell223',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell224',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell225',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 100.0,
                                              height: functions
                                                  .calculatePlannerCellHeight(
                                                      FFAppState()
                                                          .PlannerStartTime,
                                                      FFAppState()
                                                          .PlannerEndTime),
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  functions
                                                      .getCellColorFromInputListState(
                                                          'cell226',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(0.0),
                                                  bottomRight: Radius.circular(
                                                      valueOrDefault<double>(
                                                    FFAppState().PlannerEndTime ==
                                                            22
                                                        ? 10.0
                                                        : 0.0,
                                                    0.0,
                                                  )),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (FFAppState().PlannerEndTime >= 23)
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft: Radius.circular(
                                                        valueOrDefault<double>(
                                                      FFAppState().PlannerEndTime ==
                                                              23
                                                          ? 10.0
                                                          : 0.0,
                                                      0.0,
                                                    )),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(0.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: AutoSizeText(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '7al0gqno' /* 23 */,
                                                    ),
                                                    minFontSize: 10.0,
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
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell231',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell232',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell233',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell234',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell235',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell236',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(
                                                            valueOrDefault<
                                                                double>(
                                                      FFAppState().PlannerEndTime ==
                                                              23
                                                          ? 10.0
                                                          : 0.0,
                                                      0.0,
                                                    )),
                                                    topLeft:
                                                        Radius.circular(0.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (FFAppState().PlannerEndTime >= 24)
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft: Radius.circular(
                                                        valueOrDefault<double>(
                                                      FFAppState().PlannerEndTime ==
                                                              24
                                                          ? 10.0
                                                          : 0.0,
                                                      0.0,
                                                    )),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(0.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: AutoSizeText(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'j611n2l7' /* 24 */,
                                                    ),
                                                    minFontSize: 10.0,
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
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell001',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell002',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell003',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell004',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell005',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell006',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(
                                                            valueOrDefault<
                                                                double>(
                                                      FFAppState().PlannerEndTime ==
                                                              24
                                                          ? 10.0
                                                          : 0.0,
                                                      0.0,
                                                    )),
                                                    topLeft:
                                                        Radius.circular(0.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (FFAppState().PlannerEndTime >= 25)
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft: Radius.circular(
                                                        valueOrDefault<double>(
                                                      FFAppState().PlannerEndTime ==
                                                              25
                                                          ? 10.0
                                                          : 0.0,
                                                      0.0,
                                                    )),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(0.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: AutoSizeText(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'vh8pi0hy' /* 1 */,
                                                    ),
                                                    minFontSize: 10.0,
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
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell011',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell012',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell013',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell014',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell015',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell016',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(
                                                            valueOrDefault<
                                                                double>(
                                                      FFAppState().PlannerEndTime ==
                                                              25
                                                          ? 10.0
                                                          : 0.0,
                                                      0.0,
                                                    )),
                                                    topLeft:
                                                        Radius.circular(0.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (FFAppState().PlannerEndTime >= 26)
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft: Radius.circular(
                                                        valueOrDefault<double>(
                                                      FFAppState().PlannerEndTime ==
                                                              26
                                                          ? 10.0
                                                          : 0.0,
                                                      0.0,
                                                    )),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(0.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: AutoSizeText(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'q9ho2nvt' /* 2 */,
                                                    ),
                                                    minFontSize: 10.0,
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
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell021',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell022',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell023',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell024',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell025',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell026',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(
                                                            valueOrDefault<
                                                                double>(
                                                      FFAppState().PlannerEndTime ==
                                                              26
                                                          ? 10.0
                                                          : 0.0,
                                                      0.0,
                                                    )),
                                                    topLeft:
                                                        Radius.circular(0.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (FFAppState().PlannerEndTime >= 27)
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft: Radius.circular(
                                                        valueOrDefault<double>(
                                                      FFAppState().PlannerEndTime ==
                                                              27
                                                          ? 10.0
                                                          : 0.0,
                                                      0.0,
                                                    )),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(0.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: AutoSizeText(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'bihkjajt' /* 3 */,
                                                    ),
                                                    minFontSize: 10.0,
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
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell031',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell032',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell033',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell034',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell035',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell036',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(
                                                            valueOrDefault<
                                                                double>(
                                                      FFAppState().PlannerEndTime ==
                                                              27
                                                          ? 10.0
                                                          : 0.0,
                                                      0.0,
                                                    )),
                                                    topLeft:
                                                        Radius.circular(0.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (FFAppState().PlannerEndTime >= 28)
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft: Radius.circular(
                                                        valueOrDefault<double>(
                                                      FFAppState().PlannerEndTime ==
                                                              28
                                                          ? 10.0
                                                          : 0.0,
                                                      0.0,
                                                    )),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(0.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: AutoSizeText(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'xvfw2xz6' /* 4 */,
                                                    ),
                                                    minFontSize: 10.0,
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
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell041',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell042',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell043',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell044',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell045',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 100.0,
                                                height: functions
                                                    .calculatePlannerCellHeight(
                                                        FFAppState()
                                                            .PlannerStartTime,
                                                        FFAppState()
                                                            .PlannerEndTime),
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    functions
                                                        .getCellColorFromInputListState(
                                                            'cell046',
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .toList()),
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(
                                                            valueOrDefault<
                                                                double>(
                                                      FFAppState().PlannerEndTime ==
                                                              28
                                                          ? 10.0
                                                          : 0.0,
                                                      0.0,
                                                    )),
                                                    topLeft:
                                                        Radius.circular(0.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 50,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 3.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'lkv01w57' /* Memo */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMediumIsCustom,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 3.0, 5.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(20.0),
                                                  bottomRight:
                                                      Radius.circular(20.0),
                                                  topLeft:
                                                      Radius.circular(20.0),
                                                  topRight:
                                                      Radius.circular(20.0),
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 1.0,
                                                ),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 10.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .goodThingsPlanner,
                                                          '미작성',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                  ].divide(
                                                      SizedBox(height: 8.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 50,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 3.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'e2u4j23l' /* Encouragement */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMediumIsCustom,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 3.0, 5.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(20.0),
                                                  bottomRight:
                                                      Radius.circular(20.0),
                                                  topLeft:
                                                      Radius.circular(20.0),
                                                  topRight:
                                                      Radius.circular(20.0),
                                                ),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 1.0,
                                                ),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  if (FFAppState()
                                                      .pageStateSchemaVariable
                                                      .adminCheckedPara) {
                                                    return Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    5.0,
                                                                    5.0,
                                                                    5.0),
                                                        child: Text(
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .teacherquoteState,
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
                                                    );
                                                  } else {
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  5.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textController,
                                                          focusNode: _model
                                                              .textFieldFocusNode,
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
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
                                                            hintText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'opxgiksy' /* TextField */,
                                                            ),
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            filled: true,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
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
                                                          maxLines: 5,
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .textControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 10.0)),
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
    );
  }
}
