import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/timetablestart_user_set_widget.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'timetable_select_page_model.dart';
export 'timetable_select_page_model.dart';

class TimetableSelectPageWidget extends StatefulWidget {
  const TimetableSelectPageWidget({
    super.key,
    this.passed,
  });

  final WeeklyTimeTableStruct? passed;

  static String routeName = 'timetableSelectPage';
  static String routePath = '/timetableSelectPage';

  @override
  State<TimetableSelectPageWidget> createState() =>
      _TimetableSelectPageWidgetState();
}

class _TimetableSelectPageWidgetState extends State<TimetableSelectPageWidget> {
  late TimetableSelectPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimetableSelectPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.passed != null) {
        _model.weeklyTimeTableSemi = widget.passed;
        safeSetState(() {});
        safeSetState(() {
          _model.textController?.text = _model.weeklyTimeTableSemi!.tablename;
        });
        safeSetState(() {
          _model.radioButtonValueController?.value = '월';
        });
        safeSetState(() {
          _model.checkboxValue =
              _model.weeklyTimeTableSemi!.mon.nonExistingDate;
        });
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight: Radius.circular(30.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(30.0),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Flexible(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, -0.95),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('취소'),
                                                          content: Text(
                                                              '시간표 제작/수정을 그만두고 돌아가시겠습니까?'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child:
                                                                  Text('아니오'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text('예'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              context.goNamed(
                                                  TimetablePageWidget
                                                      .routeName);
                                            } else {
                                              return;
                                            }
                                          },
                                          child: Icon(
                                            Icons.arrow_back,
                                            color: Color(0xFF15161E),
                                            size: 40.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        flex: 150,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: 100.0,
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
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: Container(
                                            width: 200.0,
                                            child: TextFormField(
                                              controller: _model.textController,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              autofocus: false,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '0yfybq73' /* 시간표 이름 */,
                                                ),
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMediumIsCustom,
                                                        ),
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'wqm8vqtk' /* 시간표 이름을 입력해주세요 */,
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
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 30.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .textControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 30.0, 0.0, 0.0),
                                          child: Container(
                                            width: 660.0,
                                            decoration: BoxDecoration(),
                                            child: Container(
                                              width: 600.0,
                                              height: double.infinity,
                                              child: custom_widgets
                                                  .WeeklyPlannerWidget3(
                                                width: 600.0,
                                                height: double.infinity,
                                                pickedData:
                                                    _model.weeklyTimeTableSemi,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 10.0)),
                        ),
                      ),
                      Expanded(
                        flex: 100,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 2.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 100.0,
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
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 20.0, 10.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 15.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '1ygpt9lh' /* 시간표 수정 */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  fontSize: 30.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts:
                                                      !FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumIsCustom,
                                                ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: FlutterFlowRadioButton(
                                                options: [
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '9fv2nec7' /* 월 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'up1ygl1o' /* 화 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'nf6t0636' /* 수 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'p3tme2nd' /* 목 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'y5dsjazi' /* 금 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '3sbf16fm' /* 토 */,
                                                  ),
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'zugdrp56' /* 일 */,
                                                  )
                                                ].toList(),
                                                onChanged: (val) async {
                                                  safeSetState(() {});
                                                  safeSetState(() {
                                                    _model.checkboxValue =
                                                        valueOrDefault<bool>(
                                                      () {
                                                        if (_model
                                                                .radioButtonValue ==
                                                            '월') {
                                                          return _model
                                                              .weeklyTimeTableSemi
                                                              ?.mon
                                                              .nonExistingDate;
                                                        } else if (_model
                                                                .radioButtonValue ==
                                                            '화') {
                                                          return _model
                                                              .weeklyTimeTableSemi
                                                              ?.tue
                                                              .nonExistingDate;
                                                        } else if (_model
                                                                .radioButtonValue ==
                                                            '수') {
                                                          return _model
                                                              .weeklyTimeTableSemi
                                                              ?.wed
                                                              .nonExistingDate;
                                                        } else if (_model
                                                                .radioButtonValue ==
                                                            '목') {
                                                          return _model
                                                              .weeklyTimeTableSemi
                                                              ?.thu
                                                              .nonExistingDate;
                                                        } else if (_model
                                                                .radioButtonValue ==
                                                            '금') {
                                                          return _model
                                                              .weeklyTimeTableSemi
                                                              ?.fri
                                                              .nonExistingDate;
                                                        } else if (_model
                                                                .radioButtonValue ==
                                                            '토') {
                                                          return _model
                                                              .weeklyTimeTableSemi
                                                              ?.sat
                                                              .nonExistingDate;
                                                        } else if (_model
                                                                .radioButtonValue ==
                                                            '일') {
                                                          return _model
                                                              .weeklyTimeTableSemi
                                                              ?.sun
                                                              .nonExistingDate;
                                                        } else {
                                                          return false;
                                                        }
                                                      }(),
                                                      false,
                                                    );
                                                  });
                                                },
                                                controller: _model
                                                        .radioButtonValueController ??=
                                                    FormFieldController<String>(
                                                        null),
                                                optionHeight: 30.0,
                                                textStyle:
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
                                                buttonPosition:
                                                    RadioButtonPosition.left,
                                                direction: Axis.horizontal,
                                                radioButtonColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                inactiveRadioButtonColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                toggleable: false,
                                                horizontalAlignment:
                                                    WrapAlignment.start,
                                                verticalAlignment:
                                                    WrapCrossAlignment.start,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '6uzpsd9z' /* 미등원요일 선택 */,
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
                                            ),
                                            Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  visualDensity:
                                                      VisualDensity.compact,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                              child: Checkbox(
                                                value: _model.checkboxValue ??=
                                                    () {
                                                  if (_model.radioButtonValue ==
                                                      '월') {
                                                    return _model
                                                        .weeklyTimeTableSemi!
                                                        .mon
                                                        .nonExistingDate;
                                                  } else if (_model
                                                          .radioButtonValue ==
                                                      '화') {
                                                    return _model
                                                        .weeklyTimeTableSemi!
                                                        .tue
                                                        .nonExistingDate;
                                                  } else if (_model
                                                          .radioButtonValue ==
                                                      '수') {
                                                    return _model
                                                        .weeklyTimeTableSemi!
                                                        .wed
                                                        .nonExistingDate;
                                                  } else if (_model
                                                          .radioButtonValue ==
                                                      '목') {
                                                    return _model
                                                        .weeklyTimeTableSemi!
                                                        .thu
                                                        .nonExistingDate;
                                                  } else if (_model
                                                          .radioButtonValue ==
                                                      '금') {
                                                    return _model
                                                        .weeklyTimeTableSemi!
                                                        .fri
                                                        .nonExistingDate;
                                                  } else if (_model
                                                          .radioButtonValue ==
                                                      '토') {
                                                    return _model
                                                        .weeklyTimeTableSemi!
                                                        .sat
                                                        .nonExistingDate;
                                                  } else if (_model
                                                          .radioButtonValue ==
                                                      '일') {
                                                    return _model
                                                        .weeklyTimeTableSemi!
                                                        .sun
                                                        .nonExistingDate;
                                                  } else {
                                                    return false;
                                                  }
                                                }(),
                                                onChanged: (newValue) async {
                                                  safeSetState(() =>
                                                      _model.checkboxValue =
                                                          newValue!);
                                                  if (newValue!) {
                                                    if (_model
                                                            .radioButtonValue ==
                                                        '월') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateMon(
                                                            (e) => e
                                                              ..nonExistingDate =
                                                                  true,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else if (_model
                                                            .radioButtonValue ==
                                                        '화') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateTue(
                                                            (e) => e
                                                              ..nonExistingDate =
                                                                  true,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else if (_model
                                                            .radioButtonValue ==
                                                        '수') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateWed(
                                                            (e) => e
                                                              ..nonExistingDate =
                                                                  true,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else if (_model
                                                            .radioButtonValue ==
                                                        '목') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateThu(
                                                            (e) => e
                                                              ..nonExistingDate =
                                                                  true,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else if (_model
                                                            .radioButtonValue ==
                                                        '금') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateFri(
                                                            (e) => e
                                                              ..nonExistingDate =
                                                                  true,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else if (_model
                                                            .radioButtonValue ==
                                                        '토') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateSat(
                                                            (e) => e
                                                              ..nonExistingDate =
                                                                  true,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else if (_model
                                                            .radioButtonValue ==
                                                        '일') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateSun(
                                                            (e) => e
                                                              ..nonExistingDate =
                                                                  true,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            content: Text(
                                                                '요일을 선택해주세요!'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  } else {
                                                    if (_model
                                                            .radioButtonValue ==
                                                        '월') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateMon(
                                                            (e) => e
                                                              ..nonExistingDate =
                                                                  false,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else if (_model
                                                            .radioButtonValue ==
                                                        '화') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateTue(
                                                            (e) => e
                                                              ..nonExistingDate =
                                                                  false,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else if (_model
                                                            .radioButtonValue ==
                                                        '수') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateWed(
                                                            (e) => e
                                                              ..nonExistingDate =
                                                                  false,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else if (_model
                                                            .radioButtonValue ==
                                                        '목') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateThu(
                                                            (e) => e
                                                              ..nonExistingDate =
                                                                  false,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else if (_model
                                                            .radioButtonValue ==
                                                        '금') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateFri(
                                                            (e) => e
                                                              ..nonExistingDate =
                                                                  false,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else if (_model
                                                            .radioButtonValue ==
                                                        '토') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateSat(
                                                            (e) => e
                                                              ..nonExistingDate =
                                                                  false,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else if (_model
                                                            .radioButtonValue ==
                                                        '일') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateSun(
                                                            (e) => e
                                                              ..nonExistingDate =
                                                                  false,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            content: Text(
                                                                '요일을 선택해주세요!'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  }
                                                },
                                                side: (FlutterFlowTheme.of(
                                                                context)
                                                            .alternate !=
                                                        null)
                                                    ? BorderSide(
                                                        width: 2,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                      )
                                                    : null,
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                checkColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                              ),
                                            ),
                                          ],
                                        ),
                                        if (_model.checkboxValue == false)
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '7rp9v06c' /* 등원시각 :  */,
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
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (_model.checkboxValue!) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          content:
                                                              Text('미등원요일입니다.'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  } else {
                                                    _model.cuper = await actions
                                                        .cupertinoTimePicker2(
                                                      context,
                                                    );
                                                    if (_model
                                                            .radioButtonValue ==
                                                        '월') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateMon(
                                                            (e) => e
                                                              ..naegongStartTime =
                                                                  _model.cuper,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else if (_model
                                                            .radioButtonValue ==
                                                        '화') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateTue(
                                                            (e) => e
                                                              ..naegongStartTime =
                                                                  _model.cuper,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else if (_model
                                                            .radioButtonValue ==
                                                        '수') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateWed(
                                                            (e) => e
                                                              ..naegongStartTime =
                                                                  _model.cuper,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else if (_model
                                                            .radioButtonValue ==
                                                        '목') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateThu(
                                                            (e) => e
                                                              ..naegongStartTime =
                                                                  _model.cuper,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else if (_model
                                                            .radioButtonValue ==
                                                        '금') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateFri(
                                                            (e) => e
                                                              ..naegongStartTime =
                                                                  _model.cuper,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else if (_model
                                                            .radioButtonValue ==
                                                        '토') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateSat(
                                                            (e) => e
                                                              ..naegongStartTime =
                                                                  _model.cuper,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else if (_model
                                                            .radioButtonValue ==
                                                        '일') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateSun(
                                                            (e) => e
                                                              ..naegongStartTime =
                                                                  _model.cuper,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            content: Text(
                                                                '요일을 선택해주세요!'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  }

                                                  safeSetState(() {});
                                                },
                                                child: Text(
                                                  _model.checkboxValue!
                                                      ? '미등원요일'
                                                      : valueOrDefault<String>(
                                                          dateTimeFormat(
                                                            "jm",
                                                            () {
                                                              if (_model
                                                                      .radioButtonValue ==
                                                                  '월') {
                                                                return _model
                                                                    .weeklyTimeTableSemi
                                                                    ?.mon
                                                                    .naegongStartTime;
                                                              } else if (_model
                                                                      .radioButtonValue ==
                                                                  '화') {
                                                                return _model
                                                                    .weeklyTimeTableSemi
                                                                    ?.tue
                                                                    .naegongStartTime;
                                                              } else if (_model
                                                                      .radioButtonValue ==
                                                                  '수') {
                                                                return _model
                                                                    .weeklyTimeTableSemi
                                                                    ?.wed
                                                                    .naegongStartTime;
                                                              } else if (_model
                                                                      .radioButtonValue ==
                                                                  '목') {
                                                                return _model
                                                                    .weeklyTimeTableSemi
                                                                    ?.thu
                                                                    .naegongStartTime;
                                                              } else if (_model
                                                                      .radioButtonValue ==
                                                                  '금') {
                                                                return _model
                                                                    .weeklyTimeTableSemi
                                                                    ?.fri
                                                                    .naegongStartTime;
                                                              } else if (_model
                                                                      .radioButtonValue ==
                                                                  '토') {
                                                                return _model
                                                                    .weeklyTimeTableSemi
                                                                    ?.sat
                                                                    .naegongStartTime;
                                                              } else if (_model
                                                                      .radioButtonValue ==
                                                                  '일') {
                                                                return _model
                                                                    .weeklyTimeTableSemi
                                                                    ?.sun
                                                                    .naegongStartTime;
                                                              } else {
                                                                return _model
                                                                    .weeklyTimeTableSemi
                                                                    ?.mon
                                                                    .naegongStartTime;
                                                              }
                                                            }(),
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          '등원시간을 선택해봅시다',
                                                        ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                        if (_model.checkboxValue == false)
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'n4t9xgvd' /* 하원시각 :  */,
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
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (_model.checkboxValue!) {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          content:
                                                              Text('미등원요일입니다'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  } else {
                                                    _model.cuper2 = await actions
                                                        .cupertinoTimePicker2(
                                                      context,
                                                    );
                                                    if (_model
                                                            .radioButtonValue ==
                                                        '월') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateMon(
                                                            (e) => e
                                                              ..naegongEndTime =
                                                                  _model.cuper2,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else if (_model
                                                            .radioButtonValue ==
                                                        '화') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateTue(
                                                            (e) => e
                                                              ..naegongEndTime =
                                                                  _model.cuper2,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else if (_model
                                                            .radioButtonValue ==
                                                        '수') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateWed(
                                                            (e) => e
                                                              ..naegongEndTime =
                                                                  _model.cuper2,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else if (_model
                                                            .radioButtonValue ==
                                                        '목') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateThu(
                                                            (e) => e
                                                              ..naegongEndTime =
                                                                  _model.cuper2,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else if (_model
                                                            .radioButtonValue ==
                                                        '금') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateFri(
                                                            (e) => e
                                                              ..naegongEndTime =
                                                                  _model.cuper2,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else if (_model
                                                            .radioButtonValue ==
                                                        '토') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateSat(
                                                            (e) => e
                                                              ..naegongEndTime =
                                                                  _model.cuper2,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else if (_model
                                                            .radioButtonValue ==
                                                        '일') {
                                                      _model
                                                          .updateWeeklyTimeTableSemiStruct(
                                                        (e) => e
                                                          ..updateSun(
                                                            (e) => e
                                                              ..naegongEndTime =
                                                                  _model.cuper2,
                                                          ),
                                                      );
                                                      safeSetState(() {});
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            content: Text(
                                                                '요일을 선택해주세요!'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }
                                                  }

                                                  safeSetState(() {});
                                                },
                                                child: Text(
                                                  _model.checkboxValue!
                                                      ? '미등원요일'
                                                      : valueOrDefault<String>(
                                                          dateTimeFormat(
                                                            "jm",
                                                            () {
                                                              if (_model
                                                                      .radioButtonValue ==
                                                                  '월') {
                                                                return _model
                                                                    .weeklyTimeTableSemi
                                                                    ?.mon
                                                                    .naegongEndTime;
                                                              } else if (_model
                                                                      .radioButtonValue ==
                                                                  '화') {
                                                                return _model
                                                                    .weeklyTimeTableSemi
                                                                    ?.tue
                                                                    .naegongEndTime;
                                                              } else if (_model
                                                                      .radioButtonValue ==
                                                                  '수') {
                                                                return _model
                                                                    .weeklyTimeTableSemi
                                                                    ?.wed
                                                                    .naegongEndTime;
                                                              } else if (_model
                                                                      .radioButtonValue ==
                                                                  '목') {
                                                                return _model
                                                                    .weeklyTimeTableSemi
                                                                    ?.thu
                                                                    .naegongEndTime;
                                                              } else if (_model
                                                                      .radioButtonValue ==
                                                                  '금') {
                                                                return _model
                                                                    .weeklyTimeTableSemi
                                                                    ?.fri
                                                                    .naegongEndTime;
                                                              } else if (_model
                                                                      .radioButtonValue ==
                                                                  '토') {
                                                                return _model
                                                                    .weeklyTimeTableSemi
                                                                    ?.sat
                                                                    .naegongEndTime;
                                                              } else if (_model
                                                                      .radioButtonValue ==
                                                                  '일') {
                                                                return _model
                                                                    .weeklyTimeTableSemi
                                                                    ?.sun
                                                                    .naegongEndTime;
                                                              } else {
                                                                return _model
                                                                    .weeklyTimeTableSemi
                                                                    ?.mon
                                                                    .naegongEndTime;
                                                              }
                                                            }(),
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          '하원시간을 선택해봅시다',
                                                        ),
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                        Divider(
                                          thickness: 2.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '3lxkwjpm' /* 외출관리 */,
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
                                                ],
                                              ),
                                              Flexible(
                                                child: Container(
                                                  height:
                                                      valueOrDefault<double>(
                                                    valueOrDefault<double>(
                                                          () {
                                                            if (_model
                                                                    .radioButtonValue ==
                                                                '월') {
                                                              return _model
                                                                  .weeklyTimeTableSemi
                                                                  ?.mon
                                                                  .dailyoutingList
                                                                  .length
                                                                  .toDouble();
                                                            } else if (_model
                                                                    .radioButtonValue ==
                                                                '화') {
                                                              return _model
                                                                  .weeklyTimeTableSemi
                                                                  ?.tue
                                                                  .dailyoutingList
                                                                  .length
                                                                  .toDouble();
                                                            } else if (_model
                                                                    .radioButtonValue ==
                                                                '수') {
                                                              return _model
                                                                  .weeklyTimeTableSemi
                                                                  ?.wed
                                                                  .dailyoutingList
                                                                  .length
                                                                  .toDouble();
                                                            } else if (_model
                                                                    .radioButtonValue ==
                                                                '목') {
                                                              return _model
                                                                  .weeklyTimeTableSemi
                                                                  ?.thu
                                                                  .dailyoutingList
                                                                  .length
                                                                  .toDouble();
                                                            } else if (_model
                                                                    .radioButtonValue ==
                                                                '금') {
                                                              return _model
                                                                  .weeklyTimeTableSemi
                                                                  ?.fri
                                                                  .dailyoutingList
                                                                  .length
                                                                  .toDouble();
                                                            } else if (_model
                                                                    .radioButtonValue ==
                                                                '토') {
                                                              return _model
                                                                  .weeklyTimeTableSemi
                                                                  ?.sat
                                                                  .dailyoutingList
                                                                  .length
                                                                  .toDouble();
                                                            } else if (_model
                                                                    .radioButtonValue ==
                                                                '일') {
                                                              return _model
                                                                  .weeklyTimeTableSemi
                                                                  ?.sun
                                                                  .dailyoutingList
                                                                  .length
                                                                  .toDouble();
                                                            } else {
                                                              return 0.02;
                                                            }
                                                          }(),
                                                          0.02,
                                                        ) *
                                                        50,
                                                    20.0,
                                                  ),
                                                  decoration: BoxDecoration(),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final outingListEach =
                                                          () {
                                                                if (_model
                                                                        .radioButtonValue ==
                                                                    '월') {
                                                                  return _model
                                                                      .weeklyTimeTableSemi
                                                                      ?.mon
                                                                      .dailyoutingList;
                                                                } else if (_model
                                                                        .radioButtonValue ==
                                                                    '화') {
                                                                  return _model
                                                                      .weeklyTimeTableSemi
                                                                      ?.tue
                                                                      .dailyoutingList;
                                                                } else if (_model
                                                                        .radioButtonValue ==
                                                                    '수') {
                                                                  return _model
                                                                      .weeklyTimeTableSemi
                                                                      ?.wed
                                                                      .dailyoutingList;
                                                                } else if (_model
                                                                        .radioButtonValue ==
                                                                    '목') {
                                                                  return _model
                                                                      .weeklyTimeTableSemi
                                                                      ?.thu
                                                                      .dailyoutingList;
                                                                } else if (_model
                                                                        .radioButtonValue ==
                                                                    '금') {
                                                                  return _model
                                                                      .weeklyTimeTableSemi
                                                                      ?.fri
                                                                      .dailyoutingList;
                                                                } else if (_model
                                                                        .radioButtonValue ==
                                                                    '토') {
                                                                  return _model
                                                                      .weeklyTimeTableSemi
                                                                      ?.sat
                                                                      .dailyoutingList;
                                                                } else if (_model
                                                                        .radioButtonValue ==
                                                                    '일') {
                                                                  return _model
                                                                      .weeklyTimeTableSemi
                                                                      ?.sun
                                                                      .dailyoutingList;
                                                                } else {
                                                                  return _model
                                                                      .weeklyTimeTableSemi
                                                                      ?.mon
                                                                      .dailyoutingList;
                                                                }
                                                              }()
                                                                  ?.toList() ??
                                                              [];

                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            outingListEach
                                                                .length,
                                                        itemBuilder: (context,
                                                            outingListEachIndex) {
                                                          final outingListEachItem =
                                                              outingListEach[
                                                                  outingListEachIndex];
                                                          return Container(
                                                            width:
                                                                double.infinity,
                                                            height: 50.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        outingListEachItem
                                                                            .reason,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                      RichText(
                                                                        textScaler:
                                                                            MediaQuery.of(context).textScaler,
                                                                        text:
                                                                            TextSpan(
                                                                          children: [
                                                                            TextSpan(
                                                                              text: dateTimeFormat(
                                                                                "jm",
                                                                                outingListEachItem.outingstarttime!,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              style: TextStyle(),
                                                                            ),
                                                                            TextSpan(
                                                                              text: FFLocalizations.of(context).getText(
                                                                                'lre3m1jr' /*  ~  */,
                                                                              ),
                                                                              style: TextStyle(),
                                                                            ),
                                                                            TextSpan(
                                                                              text: dateTimeFormat(
                                                                                "jm",
                                                                                outingListEachItem.outingendtime!,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              style: TextStyle(),
                                                                            )
                                                                          ],
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: [
                                                                          Flexible(
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(1.0, 0.0),
                                                                              child: Builder(
                                                                                builder: (context) => Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      await showDialog(
                                                                                        barrierDismissible: false,
                                                                                        context: context,
                                                                                        builder: (dialogContext) {
                                                                                          return Dialog(
                                                                                            elevation: 0,
                                                                                            insetPadding: EdgeInsets.zero,
                                                                                            backgroundColor: Colors.transparent,
                                                                                            alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                            child: GestureDetector(
                                                                                              onTap: () {
                                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                                              },
                                                                                              child: TimetablestartUserSetWidget(
                                                                                                fixOrAdd: true,
                                                                                                mainindexpassed: -1,
                                                                                                fixstring: outingListEachItem.reason,
                                                                                                fixStartTime: outingListEachItem.outingstarttime,
                                                                                                fixEndTime: outingListEachItem.outingendtime,
                                                                                                fixColor: valueOrDefault<Color>(
                                                                                                  outingListEachItem.color,
                                                                                                  FlutterFlowTheme.of(context).accent4,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => safeSetState(() => _model.aaa = value));

                                                                                      if (_model.radioButtonValue == '월') {
                                                                                        _model.updateWeeklyTimeTableSemiStruct(
                                                                                          (e) => e
                                                                                            ..updateMon(
                                                                                              (e) => e
                                                                                                ..updateDailyoutingList(
                                                                                                  (e) => e[outingListEachIndex] = _model.aaa!,
                                                                                                ),
                                                                                            ),
                                                                                        );
                                                                                        safeSetState(() {});
                                                                                      } else if (_model.radioButtonValue == '화') {
                                                                                        _model.updateWeeklyTimeTableSemiStruct(
                                                                                          (e) => e
                                                                                            ..updateTue(
                                                                                              (e) => e
                                                                                                ..updateDailyoutingList(
                                                                                                  (e) => e[outingListEachIndex] = _model.aaa!,
                                                                                                ),
                                                                                            ),
                                                                                        );
                                                                                        safeSetState(() {});
                                                                                      } else if (_model.radioButtonValue == '수') {
                                                                                        _model.updateWeeklyTimeTableSemiStruct(
                                                                                          (e) => e
                                                                                            ..updateWed(
                                                                                              (e) => e
                                                                                                ..updateDailyoutingList(
                                                                                                  (e) => e[outingListEachIndex] = _model.aaa!,
                                                                                                ),
                                                                                            ),
                                                                                        );
                                                                                        safeSetState(() {});
                                                                                      } else if (_model.radioButtonValue == '목') {
                                                                                        _model.updateWeeklyTimeTableSemiStruct(
                                                                                          (e) => e
                                                                                            ..updateThu(
                                                                                              (e) => e
                                                                                                ..updateDailyoutingList(
                                                                                                  (e) => e[outingListEachIndex] = _model.aaa!,
                                                                                                ),
                                                                                            ),
                                                                                        );
                                                                                        safeSetState(() {});
                                                                                      } else if (_model.radioButtonValue == '금') {
                                                                                        _model.updateWeeklyTimeTableSemiStruct(
                                                                                          (e) => e
                                                                                            ..updateFri(
                                                                                              (e) => e
                                                                                                ..updateDailyoutingList(
                                                                                                  (e) => e[outingListEachIndex] = _model.aaa!,
                                                                                                ),
                                                                                            ),
                                                                                        );
                                                                                        safeSetState(() {});
                                                                                      } else if (_model.radioButtonValue == '토') {
                                                                                        _model.updateWeeklyTimeTableSemiStruct(
                                                                                          (e) => e
                                                                                            ..updateSat(
                                                                                              (e) => e
                                                                                                ..updateDailyoutingList(
                                                                                                  (e) => e[outingListEachIndex] = _model.aaa!,
                                                                                                ),
                                                                                            ),
                                                                                        );
                                                                                        safeSetState(() {});
                                                                                      } else if (_model.radioButtonValue == '일') {
                                                                                        _model.updateWeeklyTimeTableSemiStruct(
                                                                                          (e) => e
                                                                                            ..updateSun(
                                                                                              (e) => e
                                                                                                ..updateDailyoutingList(
                                                                                                  (e) => e[outingListEachIndex] = _model.aaa!,
                                                                                                ),
                                                                                            ),
                                                                                        );
                                                                                        safeSetState(() {});
                                                                                      } else {
                                                                                        await showDialog(
                                                                                          context: context,
                                                                                          builder: (alertDialogContext) {
                                                                                            return AlertDialog(
                                                                                              content: Text('요일을 선택해주세요!'),
                                                                                              actions: [
                                                                                                TextButton(
                                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                  child: Text('Ok'),
                                                                                                ),
                                                                                              ],
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      }

                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Icon(
                                                                                      Icons.settings_sharp,
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      size: 24.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                var confirmDialogResponse = await showDialog<bool>(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return AlertDialog(
                                                                                          title: Text('외출삭제'),
                                                                                          content: Text('해당 외출 정보를 정말로 삭제하시겠습니까?'),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                              child: Text('취소'),
                                                                                            ),
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                              child: Text('삭제'),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    ) ??
                                                                                    false;
                                                                                if (!confirmDialogResponse) {
                                                                                  return;
                                                                                }
                                                                                if (_model.radioButtonValue == '월') {
                                                                                  _model.updateWeeklyTimeTableSemiStruct(
                                                                                    (e) => e
                                                                                      ..updateMon(
                                                                                        (e) => e
                                                                                          ..updateDailyoutingList(
                                                                                            (e) => e.removeAt(outingListEachIndex),
                                                                                          ),
                                                                                      ),
                                                                                  );
                                                                                  safeSetState(() {});
                                                                                } else if (_model.radioButtonValue == '화') {
                                                                                  _model.updateWeeklyTimeTableSemiStruct(
                                                                                    (e) => e
                                                                                      ..updateTue(
                                                                                        (e) => e
                                                                                          ..updateDailyoutingList(
                                                                                            (e) => e.removeAt(outingListEachIndex),
                                                                                          ),
                                                                                      ),
                                                                                  );
                                                                                  safeSetState(() {});
                                                                                } else if (_model.radioButtonValue == '수') {
                                                                                  _model.updateWeeklyTimeTableSemiStruct(
                                                                                    (e) => e
                                                                                      ..updateWed(
                                                                                        (e) => e
                                                                                          ..updateDailyoutingList(
                                                                                            (e) => e.removeAt(outingListEachIndex),
                                                                                          ),
                                                                                      ),
                                                                                  );
                                                                                  safeSetState(() {});
                                                                                } else if (_model.radioButtonValue == '목') {
                                                                                  _model.updateWeeklyTimeTableSemiStruct(
                                                                                    (e) => e
                                                                                      ..updateThu(
                                                                                        (e) => e
                                                                                          ..updateDailyoutingList(
                                                                                            (e) => e.removeAt(outingListEachIndex),
                                                                                          ),
                                                                                      ),
                                                                                  );
                                                                                  safeSetState(() {});
                                                                                } else if (_model.radioButtonValue == '금') {
                                                                                  _model.updateWeeklyTimeTableSemiStruct(
                                                                                    (e) => e
                                                                                      ..updateFri(
                                                                                        (e) => e
                                                                                          ..updateDailyoutingList(
                                                                                            (e) => e.removeAt(outingListEachIndex),
                                                                                          ),
                                                                                      ),
                                                                                  );
                                                                                  safeSetState(() {});
                                                                                } else if (_model.radioButtonValue == '토') {
                                                                                  _model.updateWeeklyTimeTableSemiStruct(
                                                                                    (e) => e
                                                                                      ..updateSat(
                                                                                        (e) => e
                                                                                          ..updateDailyoutingList(
                                                                                            (e) => e.removeAt(outingListEachIndex),
                                                                                          ),
                                                                                      ),
                                                                                  );
                                                                                  safeSetState(() {});
                                                                                } else if (_model.radioButtonValue == '일') {
                                                                                  _model.updateWeeklyTimeTableSemiStruct(
                                                                                    (e) => e
                                                                                      ..updateSun(
                                                                                        (e) => e
                                                                                          ..updateDailyoutingList(
                                                                                            (e) => e.removeAt(outingListEachIndex),
                                                                                          ),
                                                                                      ),
                                                                                  );
                                                                                  safeSetState(() {});
                                                                                } else {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        content: Text('요일을 선택해주세요!'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext),
                                                                                            child: Text('Ok'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                }
                                                                              },
                                                                              child: Icon(
                                                                                Icons.delete,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 24.0,
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
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Builder(
                                                      builder: (context) =>
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
                                                          await showDialog(
                                                            barrierDismissible:
                                                                false,
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
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
                                                                  child:
                                                                      TimetablestartUserSetWidget(
                                                                    fixOrAdd:
                                                                        true,
                                                                    mainindexpassed:
                                                                        -1,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(() =>
                                                                  _model.bbb =
                                                                      value));

                                                          if (_model
                                                                  .radioButtonValue ==
                                                              '월') {
                                                            _model
                                                                .updateWeeklyTimeTableSemiStruct(
                                                              (e) => e
                                                                ..updateMon(
                                                                  (e) => e
                                                                    ..updateDailyoutingList(
                                                                      (e) => e.add(
                                                                          _model
                                                                              .bbb!),
                                                                    ),
                                                                ),
                                                            );
                                                            safeSetState(() {});
                                                          } else if (_model
                                                                  .radioButtonValue ==
                                                              '화') {
                                                            _model
                                                                .updateWeeklyTimeTableSemiStruct(
                                                              (e) => e
                                                                ..updateTue(
                                                                  (e) => e
                                                                    ..updateDailyoutingList(
                                                                      (e) => e.add(
                                                                          _model
                                                                              .bbb!),
                                                                    ),
                                                                ),
                                                            );
                                                            safeSetState(() {});
                                                          } else if (_model
                                                                  .radioButtonValue ==
                                                              '수') {
                                                            _model
                                                                .updateWeeklyTimeTableSemiStruct(
                                                              (e) => e
                                                                ..updateWed(
                                                                  (e) => e
                                                                    ..updateDailyoutingList(
                                                                      (e) => e.add(
                                                                          _model
                                                                              .bbb!),
                                                                    ),
                                                                ),
                                                            );
                                                            safeSetState(() {});
                                                          } else if (_model
                                                                  .radioButtonValue ==
                                                              '목') {
                                                            _model
                                                                .updateWeeklyTimeTableSemiStruct(
                                                              (e) => e
                                                                ..updateThu(
                                                                  (e) => e
                                                                    ..updateDailyoutingList(
                                                                      (e) => e.add(
                                                                          _model
                                                                              .bbb!),
                                                                    ),
                                                                ),
                                                            );
                                                            safeSetState(() {});
                                                          } else if (_model
                                                                  .radioButtonValue ==
                                                              '금') {
                                                            _model
                                                                .updateWeeklyTimeTableSemiStruct(
                                                              (e) => e
                                                                ..updateFri(
                                                                  (e) => e
                                                                    ..updateDailyoutingList(
                                                                      (e) => e.add(
                                                                          _model
                                                                              .bbb!),
                                                                    ),
                                                                ),
                                                            );
                                                            safeSetState(() {});
                                                          } else if (_model
                                                                  .radioButtonValue ==
                                                              '토') {
                                                            _model
                                                                .updateWeeklyTimeTableSemiStruct(
                                                              (e) => e
                                                                ..updateSat(
                                                                  (e) => e
                                                                    ..updateDailyoutingList(
                                                                      (e) => e.add(
                                                                          _model
                                                                              .bbb!),
                                                                    ),
                                                                ),
                                                            );
                                                            safeSetState(() {});
                                                          } else if (_model
                                                                  .radioButtonValue ==
                                                              '일') {
                                                            _model
                                                                .updateWeeklyTimeTableSemiStruct(
                                                              (e) => e
                                                                ..updateSun(
                                                                  (e) => e
                                                                    ..updateDailyoutingList(
                                                                      (e) => e.add(
                                                                          _model
                                                                              .bbb!),
                                                                    ),
                                                                ),
                                                            );
                                                            safeSetState(() {});
                                                          } else {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  content: Text(
                                                                      '요일을 선택해주세요!'),
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
                                                          }

                                                          safeSetState(() {});
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .add_circle_outline,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 40.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.95),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 30.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    _model
                                                        .updateWeeklyTimeTableSemiStruct(
                                                      (e) => e
                                                        ..updatedDate =
                                                            getCurrentTimestamp,
                                                    );
                                                    safeSetState(() {});

                                                    await currentUserReference!
                                                        .update(
                                                            createUsersRecordData(
                                                      scheduleToChange:
                                                          updateWeeklyTimeTableStruct(
                                                        _model
                                                            .weeklyTimeTableSemi,
                                                        clearUnsetFields: true,
                                                      ),
                                                      updateChecker: true,
                                                      scheduleRequestTime:
                                                          getCurrentTimestamp,
                                                    ));
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          content: Text(
                                                              '저장 및 수정요청이 완료되었습니다. 관리자 선생님께 승인 받아 주세요'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );

                                                    context.goNamed(
                                                        TimetablePageWidget
                                                            .routeName);
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'ozstzayn' /*  저장 */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    height: 45.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmallIsCustom,
                                                        ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    _model
                                                        .updateWeeklyTimeTableSemiStruct(
                                                      (e) => e
                                                        ..updatedDate =
                                                            getCurrentTimestamp,
                                                    );
                                                    safeSetState(() {});

                                                    await currentUserReference!
                                                        .update(
                                                            createUsersRecordData(
                                                      scheduleToChange:
                                                          updateWeeklyTimeTableStruct(
                                                        _model
                                                            .weeklyTimeTableSemi,
                                                        clearUnsetFields: true,
                                                      ),
                                                    ));

                                                    context.goNamed(
                                                        TimetablePageWidget
                                                            .routeName);
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'a2kg5pes' /* 임시저장 */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    height: 45.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmallIsCustom,
                                                        ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                ),
                                                FFButtonWidget(
                                                  onPressed: () async {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      '취소'),
                                                                  content: Text(
                                                                      '시간표 제작/수정을 그만두고 돌아가시겠습니까?'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: Text(
                                                                          '아니오'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: Text(
                                                                          '예'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (confirmDialogResponse) {
                                                      context.goNamed(
                                                          TimetablePageWidget
                                                              .routeName);
                                                    } else {
                                                      return;
                                                    }
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'jcxnh2op' /* 취소 */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    height: 45.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmallIsCustom,
                                                        ),
                                                    elevation: 0.0,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 15.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 15.0)),
                        ),
                      ),
                    ].divide(SizedBox(width: 30.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
