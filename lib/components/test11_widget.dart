import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'test11_model.dart';
export 'test11_model.dart';

class Test11Widget extends StatefulWidget {
  const Test11Widget({super.key});

  @override
  State<Test11Widget> createState() => _Test11WidgetState();
}

class _Test11WidgetState extends State<Test11Widget> {
  late Test11Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Test11Model());

    _model.textField34TextController ??= TextEditingController();
    _model.textField34FocusNode ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

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
      width: 1350.0,
      height: 1020.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 20.0),
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
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [],
                      ),
                      Spacer(flex: 2),
                      Expanded(
                        flex: 45,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 5.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 209.0,
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
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                              '5r844jkp' /* 수면시간 :  */,
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
                                                          TextSpan(
                                                            text:
                                                                valueOrDefault<
                                                                    String>(
                                                              FFAppState()
                                                                  .pageStateSchemaVariable
                                                                  .dailyStartPara
                                                                  .sleepTime
                                                                  ?.toString(),
                                                              '23:30',
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
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          )
                                                        ],
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
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                              'aw3o0rf9' /* 기상시간 :  */,
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
                                                          TextSpan(
                                                            text:
                                                                valueOrDefault<
                                                                    String>(
                                                              FFAppState()
                                                                  .pageStateSchemaVariable
                                                                  .dailyStartPara
                                                                  .getupTime
                                                                  ?.toString(),
                                                              '08:30',
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
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          )
                                                        ],
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
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                              '7dx33ngy' /* 목표공부시간 :  */,
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
                                                          TextSpan(
                                                            text:
                                                                valueOrDefault<
                                                                    String>(
                                                              FFAppState()
                                                                  .pageStateSchemaVariable
                                                                  .dailyStartPara
                                                                  .goalTime,
                                                              '10시간 30분',
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
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          )
                                                        ],
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
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                              '5v9wil78' /* 현재공부시간 :  */,
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
                                                          TextSpan(
                                                            text:
                                                                valueOrDefault<
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
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          )
                                                        ],
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
                                                  ],
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'roztzh13' /* 오늘의 한마디 : */,
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
                                                            TextSpan(
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'uheamk68' /*  */,
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
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            )
                                                          ],
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
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .textField34TextController,
                                                            focusNode: _model
                                                                .textField34FocusNode,
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                      ),
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'i2he2l3f' /* 오늘의 다짐, 고민거리, 건의사항등
하고싶은 말을 자유... */
                                                                ,
                                                              ),
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).labelMediumIsCustom,
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
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                            maxLines: 4,
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .textField34TextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 10.0)),
                                            ),
                                          ),
                                        ],
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
                                      borderRadius: BorderRadius.circular(15.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        width: 2.0,
                                      ),
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 5.0, 10.0, 5.0),
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            child: custom_widgets.DailyPieChart(
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
                                      borderRadius: BorderRadius.circular(15.0),
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 5.0, 10.0, 5.0),
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: Container(
                                            width: double.infinity,
                                            height: double.infinity,
                                            child:
                                                custom_widgets.StudyGaugeChart(
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
          Expanded(
            flex: 8,
            child: Container(
              width: 100.0,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBackground,
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 30.0, 0.0),
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
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
                                        AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            currentUserDisplayName,
                                            style: FlutterFlowTheme.of(context)
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
                                        Text(
                                          valueOrDefault<String>(
                                            dateTimeFormat(
                                              "yyyy\'년 \'M\'월 \'d\'일\'",
                                              FFAppState().plannerDateSelected,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            '오늘의 날짜를 선택하세요',
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
                                          functions.calculateTotalStudyTime(
                                              FFAppState()
                                                  .pageStateSchemaVariable
                                                  .inputListState
                                                  .toList()),
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
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 15,
                                child: Container(
                                  width: 100.0,
                                  height: 552.0,
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
                                              'fdfri5xu' /* TO DO LIST */,
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
                                                  'u0e77cll' /* STUDY PLAN */,
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
                                                  'axn0nvw7' /* SUB */,
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
                                            height: 480.0,
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
                                                                    plannerinputchildLoadItem
                                                                        .subjectNamePlanner
                                                                        .maybeHandleOverflow(
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
                                                                          plannerinputchildLoadItem
                                                                              .whatIDid,
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
                                                                            functions.calculateStudyTime(plannerinputchildLoadItem.studyStartTime.toList(),
                                                                                plannerinputchildLoadItem.studyEndTime.toList()),
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
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  if (plannerinputchildLoadItem
                                                                          .isdone ==
                                                                      'done') {
                                                                    FFAppState()
                                                                        .updatePageStateSchemaVariableStruct(
                                                                      (e) => e
                                                                        ..updateInputListState(
                                                                          (e) => e[
                                                                              plannerinputchildLoadIndex]
                                                                            ..isdone =
                                                                                'notyet',
                                                                        ),
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                  } else if (plannerinputchildLoadItem
                                                                          .isdone ==
                                                                      'notyet') {
                                                                    FFAppState()
                                                                        .updatePageStateSchemaVariableStruct(
                                                                      (e) => e
                                                                        ..updateInputListState(
                                                                          (e) => e[
                                                                              plannerinputchildLoadIndex]
                                                                            ..isdone =
                                                                                'unfinish',
                                                                        ),
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                  } else {
                                                                    FFAppState()
                                                                        .updatePageStateSchemaVariableStruct(
                                                                      (e) => e
                                                                        ..updateInputListState(
                                                                          (e) => e[
                                                                              plannerinputchildLoadIndex]
                                                                            ..isdone =
                                                                                'done',
                                                                        ),
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                },
                                                                child:
                                                                    Container(
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
                                                                    border:
                                                                        Border
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
                                                                        if (plannerinputchildLoadItem.isdone ==
                                                                            'done') {
                                                                          return Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Icon(
                                                                              Icons.circle_outlined,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                          );
                                                                        } else if (plannerinputchildLoadItem.isdone ==
                                                                            'notyet') {
                                                                          return Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Icon(
                                                                              Icons.change_history,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                          );
                                                                        } else {
                                                                          return FaIcon(
                                                                            FontAwesomeIcons.times,
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
                                  height: 550.0,
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
                                  child: SingleChildScrollView(
                                    primary: false,
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
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '7qz27fko' /* TimeTable */,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
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
                                                              !FlutterFlowTheme
                                                                      .of(context)
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
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: AutoSizeText(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '5ztpeni7' /* 5 */,
                                                      ),
                                                      minFontSize: 10.0,
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell051',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell052',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell053',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell054',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell055',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell056',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: AutoSizeText(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '29c0v8j1' /* 6 */,
                                                      ),
                                                      minFontSize: 10.0,
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell061',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell062',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell063',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell064',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell065',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell066',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: AutoSizeText(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '3miqgwki' /* 7 */,
                                                      ),
                                                      minFontSize: 10.0,
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell071',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell072',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell073',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell074',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell075',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell076',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: AutoSizeText(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'np7lk07u' /* 8 */,
                                                      ),
                                                      minFontSize: 10.0,
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell081',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell082',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell083',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell084',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell085',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell086',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                      'mijzuzgu' /* 9 */,
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
                                                      'h4dduz9o' /* 10 */,
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
                                                      '6eti23xq' /* 11 */,
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
                                                      'wvcx6ymq' /* 12 */,
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
                                                      'u0zebo96' /* 13 */,
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
                                                      'x2xypj0r' /* 14 */,
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
                                                      '8ompatdx' /* 15 */,
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
                                                      '6v22bofn' /* 16 */,
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
                                                      'a9e9ksdk' /* 17 */,
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
                                                      'f1d49ztv' /* 18 */,
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
                                                      'pn7uynt6' /* 19 */,
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
                                                      '28yfiqj6' /* 20 */,
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
                                                      'gl30r3l5' /* 21 */,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.only(
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
                                                      'vr31i4lj' /* 22 */,
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
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(
                                                            valueOrDefault<
                                                                double>(
                                                      FFAppState().PlannerEndTime ==
                                                              22
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
                                                      bottomLeft:
                                                          Radius.circular(
                                                              valueOrDefault<
                                                                  double>(
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
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: AutoSizeText(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '1gl7t18o' /* 23 */,
                                                      ),
                                                      minFontSize: 10.0,
                                                      style: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell231',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell232',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell233',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell234',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell235',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                                                    color:
                                                        valueOrDefault<Color>(
                                                      functions.getCellColorFromInputListState(
                                                          'cell236',
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                                      color: FlutterFlowTheme
                                                              .of(context)
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
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 50,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 0.0),
                                      child: Container(
                                        width: 100.0,
                                        height: 120.0,
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
                                            bottomLeft: Radius.circular(20.0),
                                            bottomRight: Radius.circular(20.0),
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0),
                                          ),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    18.0, 0.0, 18.0, 0.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.textController2,
                                              focusNode:
                                                  _model.textFieldFocusNode1,
                                              autofocus: false,
                                              textInputAction:
                                                  TextInputAction.next,
                                              readOnly: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '897mgbwa' /* Good Things */,
                                                ),
                                                labelStyle:
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
                                                hintStyle:
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
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                              ),
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
                                              maxLines: 5,
                                              minLines: 1,
                                              validator: _model
                                                  .textController2Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 50,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Container(
                                        width: 100.0,
                                        height: 120.0,
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
                                            bottomLeft: Radius.circular(20.0),
                                            bottomRight: Radius.circular(20.0),
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0),
                                          ),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                        ),
                                        child: Slider(
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          inactiveColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          min: 0.0,
                                          max: 100.0,
                                          value: _model.sliderValue ??= 0.0,
                                          label: _model.sliderValue
                                              ?.toStringAsFixed(0),
                                          divisions: 20,
                                          onChanged: (newValue) {
                                            newValue = double.parse(
                                                newValue.toStringAsFixed(0));
                                            safeSetState(() =>
                                                _model.sliderValue = newValue);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 50,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 5.0, 0.0),
                                      child: Container(
                                        width: 100.0,
                                        height: 120.0,
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
                                            bottomLeft: Radius.circular(20.0),
                                            bottomRight: Radius.circular(20.0),
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0),
                                          ),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 1.0,
                                          ),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    18.0, 0.0, 18.0, 0.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.textController3,
                                              focusNode:
                                                  _model.textFieldFocusNode2,
                                              autofocus: false,
                                              readOnly: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '2q0e29ub' /* Improvement */,
                                                ),
                                                labelStyle:
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
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                focusedErrorBorder:
                                                    InputBorder.none,
                                              ),
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
                                              maxLines: 5,
                                              minLines: 1,
                                              validator: _model
                                                  .textController3Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 50,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 10.0, 0.0, 0.0),
                                      child: Container(
                                        width: 100.0,
                                        height: 120.0,
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
                                            bottomLeft: Radius.circular(20.0),
                                            bottomRight: Radius.circular(20.0),
                                            topLeft: Radius.circular(20.0),
                                            topRight: Radius.circular(20.0),
                                          ),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(
                                              valueOrDefault<double>(
                                                () {
                                                  if (valueOrDefault<bool>(
                                                        FFAppState()
                                                            .pageStateSchemaVariable
                                                            .isSubmittedPara,
                                                        false,
                                                      ) &&
                                                      FFAppState()
                                                          .pageStateSchemaVariable
                                                          .adminCheckedPara) {
                                                    return -1.0;
                                                  } else if (valueOrDefault<
                                                          bool>(
                                                        FFAppState()
                                                            .pageStateSchemaVariable
                                                            .isSubmittedPara,
                                                        false,
                                                      ) &&
                                                      !FFAppState()
                                                          .pageStateSchemaVariable
                                                          .adminCheckedPara) {
                                                    return -1.0;
                                                  } else {
                                                    return 0.0;
                                                  }
                                                }(),
                                                0.0,
                                              ),
                                              0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    valueOrDefault<double>(
                                                      () {
                                                        if (valueOrDefault<
                                                                bool>(
                                                              FFAppState()
                                                                  .pageStateSchemaVariable
                                                                  .isSubmittedPara,
                                                              false,
                                                            ) &&
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .adminCheckedPara) {
                                                          return 20.0;
                                                        } else if (valueOrDefault<
                                                                bool>(
                                                              FFAppState()
                                                                  .pageStateSchemaVariable
                                                                  .isSubmittedPara,
                                                              false,
                                                            ) &&
                                                            !FFAppState()
                                                                .pageStateSchemaVariable
                                                                .adminCheckedPara) {
                                                          return 20.0;
                                                        } else {
                                                          return 0.0;
                                                        }
                                                      }(),
                                                      0.0,
                                                    ),
                                                    0.0,
                                                    valueOrDefault<double>(
                                                      () {
                                                        if (valueOrDefault<
                                                                bool>(
                                                              FFAppState()
                                                                  .pageStateSchemaVariable
                                                                  .isSubmittedPara,
                                                              false,
                                                            ) &&
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .adminCheckedPara) {
                                                          return 20.0;
                                                        } else if (valueOrDefault<
                                                                bool>(
                                                              FFAppState()
                                                                  .pageStateSchemaVariable
                                                                  .isSubmittedPara,
                                                              false,
                                                            ) &&
                                                            !FFAppState()
                                                                .pageStateSchemaVariable
                                                                .adminCheckedPara) {
                                                          return 20.0;
                                                        } else {
                                                          return 0.0;
                                                        }
                                                      }(),
                                                      0.0,
                                                    ),
                                                    0.0),
                                            child: Text(
                                              () {
                                                if ((valueOrDefault<bool>(
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .isSubmittedPara,
                                                          false,
                                                        ) ==
                                                        true) &&
                                                    (valueOrDefault<bool>(
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .adminCheckedPara,
                                                          false,
                                                        ) ==
                                                        true)) {
                                                  return valueOrDefault<String>(
                                                    FFAppState()
                                                        .pageStateSchemaVariable
                                                        .teacherquoteState,
                                                    '고생하셨습니다!',
                                                  );
                                                } else if ((valueOrDefault<
                                                            bool>(
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .isSubmittedPara,
                                                          false,
                                                        ) ==
                                                        true) &&
                                                    (valueOrDefault<bool>(
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .adminCheckedPara,
                                                          false,
                                                        ) ==
                                                        false)) {
                                                  return '플래너가 제출되었습니다!';
                                                } else {
                                                  return '플래너 제출하기';
                                                }
                                              }(),
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
                                        ),
                                      ),
                                    ),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
