import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/simple_color_picker_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'planner_inut_set_copy_model.dart';
export 'planner_inut_set_copy_model.dart';

class PlannerInutSetCopyWidget extends StatefulWidget {
  const PlannerInutSetCopyWidget({
    super.key,
    this.passedInfos,
  });

  final PageStateSchemaStruct? passedInfos;

  @override
  State<PlannerInutSetCopyWidget> createState() =>
      _PlannerInutSetCopyWidgetState();
}

class _PlannerInutSetCopyWidgetState extends State<PlannerInutSetCopyWidget> {
  late PlannerInutSetCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlannerInutSetCopyModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
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
      width: 800.0,
      height: 500.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 480.0,
            height: 500.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(20.0),
            ),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 30.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '87th6qwf' /* 학습계획입력 */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 40.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyMediumIsCustom,
                            ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'nunwdjyb' /* 과목명 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                              if (!valueOrDefault<bool>(
                                _model.checkboxValue,
                                false,
                              ))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController ??=
                                            FormFieldController<String>(null),
                                    options: FFAppState()
                                        .personalSubjectInfo
                                        .map((e) => e.subject)
                                        .toList(),
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.dropDownValue = val);
                                      if (_model.dropDownValue ==
                                          FFAppState()
                                              .personalSubjectInfo
                                              .elementAtOrNull(0)
                                              ?.subject) {
                                        _model.colorToSet =
                                            valueOrDefault<Color>(
                                          FFAppState()
                                              .personalSubjectInfo
                                              .elementAtOrNull(0)
                                              ?.color,
                                          FlutterFlowTheme.of(context).primary,
                                        );
                                        safeSetState(() {});
                                      } else if (_model.dropDownValue ==
                                          FFAppState()
                                              .personalSubjectInfo
                                              .elementAtOrNull(1)
                                              ?.subject) {
                                        _model.colorToSet =
                                            valueOrDefault<Color>(
                                          FFAppState()
                                              .personalSubjectInfo
                                              .elementAtOrNull(1)
                                              ?.color,
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                        );
                                        safeSetState(() {});
                                      } else if (_model.dropDownValue ==
                                          FFAppState()
                                              .personalSubjectInfo
                                              .elementAtOrNull(2)
                                              ?.subject) {
                                        _model.colorToSet =
                                            valueOrDefault<Color>(
                                          FFAppState()
                                              .personalSubjectInfo
                                              .elementAtOrNull(2)
                                              ?.color,
                                          FlutterFlowTheme.of(context).tertiary,
                                        );
                                        safeSetState(() {});
                                      } else if (_model.dropDownValue ==
                                          FFAppState()
                                              .personalSubjectInfo
                                              .elementAtOrNull(3)
                                              ?.subject) {
                                        _model.colorToSet =
                                            valueOrDefault<Color>(
                                          FFAppState()
                                              .personalSubjectInfo
                                              .elementAtOrNull(3)
                                              ?.color,
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                        );
                                        safeSetState(() {});
                                      } else if (_model.dropDownValue ==
                                          FFAppState()
                                              .personalSubjectInfo
                                              .elementAtOrNull(4)
                                              ?.subject) {
                                        _model.colorToSet =
                                            valueOrDefault<Color>(
                                          FFAppState()
                                              .personalSubjectInfo
                                              .elementAtOrNull(4)
                                              ?.color,
                                          FlutterFlowTheme.of(context).accent2,
                                        );
                                        safeSetState(() {});
                                      } else {
                                        return;
                                      }
                                    },
                                    width: 200.0,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'u87nxbxw' /* 과목을 선택해주세요 */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor: Colors.transparent,
                                    borderWidth: 0.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    hidesUnderline: true,
                                    isOverButton: false,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                    ),
                                    child: Checkbox(
                                      value: _model.checkboxValue ??= false,
                                      onChanged: (newValue) async {
                                        safeSetState(() =>
                                            _model.checkboxValue = newValue!);
                                      },
                                      side: (FlutterFlowTheme.of(context)
                                                  .alternate !=
                                              null)
                                          ? BorderSide(
                                              width: 2,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            )
                                          : null,
                                      activeColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      checkColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'ylr0vgsq' /* 직접입력 */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ],
                              ),
                              if (valueOrDefault<bool>(
                                _model.checkboxValue,
                                false,
                              ))
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        23.0, 0.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController1,
                                      focusNode: _model.textFieldFocusNode1,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController1',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          if (_model.textController1.text ==
                                              FFAppState()
                                                  .personalSubjectInfo
                                                  .elementAtOrNull(0)
                                                  ?.subject) {
                                            _model.colorToSet =
                                                valueOrDefault<Color>(
                                              FFAppState()
                                                  .personalSubjectInfo
                                                  .elementAtOrNull(0)
                                                  ?.color,
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            );
                                            safeSetState(() {});
                                          } else if (_model
                                                  .textController1.text ==
                                              FFAppState()
                                                  .personalSubjectInfo
                                                  .elementAtOrNull(1)
                                                  ?.subject) {
                                            _model.colorToSet =
                                                valueOrDefault<Color>(
                                              FFAppState()
                                                  .personalSubjectInfo
                                                  .elementAtOrNull(1)
                                                  ?.color,
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                            );
                                            safeSetState(() {});
                                          } else if (_model
                                                  .textController1.text ==
                                              FFAppState()
                                                  .personalSubjectInfo
                                                  .elementAtOrNull(2)
                                                  ?.subject) {
                                            _model.colorToSet =
                                                valueOrDefault<Color>(
                                              FFAppState()
                                                  .personalSubjectInfo
                                                  .elementAtOrNull(2)
                                                  ?.color,
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                            );
                                            safeSetState(() {});
                                          } else if (_model
                                                  .textController1.text ==
                                              FFAppState()
                                                  .personalSubjectInfo
                                                  .elementAtOrNull(3)
                                                  ?.subject) {
                                            _model.colorToSet =
                                                valueOrDefault<Color>(
                                              FFAppState()
                                                  .personalSubjectInfo
                                                  .elementAtOrNull(3)
                                                  ?.color,
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                            );
                                            safeSetState(() {});
                                          } else if (_model
                                                  .textController1.text ==
                                              FFAppState()
                                                  .personalSubjectInfo
                                                  .elementAtOrNull(4)
                                                  ?.subject) {
                                            _model.colorToSet =
                                                valueOrDefault<Color>(
                                              FFAppState()
                                                  .personalSubjectInfo
                                                  .elementAtOrNull(4)
                                                  ?.color,
                                              FlutterFlowTheme.of(context)
                                                  .accent2,
                                            );
                                            safeSetState(() {});
                                          } else {
                                            return;
                                          }
                                        },
                                      ),
                                      onFieldSubmitted: (_) async {
                                        if (_model.textController1.text ==
                                            FFAppState()
                                                .personalSubjectInfo
                                                .elementAtOrNull(0)
                                                ?.subject) {
                                          _model.colorToSet = FFAppState()
                                              .personalSubjectInfo
                                              .elementAtOrNull(0)!
                                              .color!;
                                          safeSetState(() {});
                                        } else if (_model
                                                .textController1.text ==
                                            FFAppState()
                                                .personalSubjectInfo
                                                .elementAtOrNull(1)
                                                ?.subject) {
                                          _model.colorToSet = FFAppState()
                                              .personalSubjectInfo
                                              .elementAtOrNull(1)!
                                              .color!;
                                          safeSetState(() {});
                                        } else if (_model
                                                .textController1.text ==
                                            FFAppState()
                                                .personalSubjectInfo
                                                .elementAtOrNull(2)
                                                ?.subject) {
                                          _model.colorToSet = FFAppState()
                                              .personalSubjectInfo
                                              .elementAtOrNull(2)!
                                              .color!;
                                          safeSetState(() {});
                                        } else if (_model
                                                .textController1.text ==
                                            FFAppState()
                                                .personalSubjectInfo
                                                .elementAtOrNull(3)
                                                ?.subject) {
                                          _model.colorToSet = FFAppState()
                                              .personalSubjectInfo
                                              .elementAtOrNull(3)!
                                              .color!;
                                          safeSetState(() {});
                                        } else if (_model
                                                .textController1.text ==
                                            FFAppState()
                                                .personalSubjectInfo
                                                .elementAtOrNull(4)
                                                ?.subject) {
                                          _model.colorToSet = FFAppState()
                                              .personalSubjectInfo
                                              .elementAtOrNull(4)!
                                              .color!;
                                          safeSetState(() {});
                                        } else {
                                          return;
                                        }
                                      },
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            FFLocalizations.of(context).getText(
                                          '25jkvgza' /* 과목명을 입력해주세요. (ex. 영어, 물리) */,
                                        ),
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .labelMediumIsCustom,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .labelMediumIsCustom,
                                            ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                      validator: _model.textController1Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'v790npf4' /* 공부내용 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: TextFormField(
                                controller: _model.textController2,
                                focusNode: _model.textFieldFocusNode2,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'ov2uggdg' /* 구체적인 학습계획을 작성해주세요. (ex. 강기본 문학... */,
                                  ),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .labelMediumIsCustom,
                                      ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .labelMediumIsCustom,
                                      ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                                maxLines: null,
                                validator: _model.textController2Validator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'cwvdtt9w' /* 색상 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Builder(
                                builder: (context) => Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30.0, 0.0, 0.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 8.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor: valueOrDefault<Color>(
                                      _model.colorToSet,
                                      FlutterFlowTheme.of(context).success,
                                    ),
                                    icon: Icon(
                                      Icons.palette_rounded,
                                      color: Colors.white,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      var _shouldSetState = false;
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: SimpleColorPickerWidget(),
                                          );
                                        },
                                      ).then((value) => safeSetState(
                                          () => _model.aa = value));

                                      _shouldSetState = true;
                                      if (_model.aa != null) {
                                        _model.colorToSet =
                                            valueOrDefault<Color>(
                                          _model.aa,
                                          Color(0xFFF6B2B2),
                                        );
                                        _model.updatePage(() {});
                                      } else {
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      }

                                      if (_shouldSetState) safeSetState(() {});
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '7jpf0gw0' /* ← 클릭하여 과목색상설정 */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              if (((_model.textController1.text != '') &&
                                      _model.checkboxValue!) ||
                                  (_model.textController2.text != '')) {
                                await Future.delayed(
                                  Duration(
                                    milliseconds: 200,
                                  ),
                                );
                                if (_model.checkboxValue!) {
                                  FFAppState()
                                      .updatePageStateSchemaVariableStruct(
                                    (e) => e
                                      ..updateInputListState(
                                        (e) => e.add(PlannerInputStruct(
                                          subjectNamePlanner:
                                              _model.textController1.text,
                                          pickedColor: valueOrDefault<Color>(
                                            _model.colorToSet,
                                            FlutterFlowTheme.of(context)
                                                .success,
                                          ),
                                          whatIDid: _model.textController2.text,
                                          isdone: 'unclicked',
                                        )),
                                      ),
                                  );
                                  FFAppState().update(() {});
                                } else {
                                  FFAppState()
                                      .updatePageStateSchemaVariableStruct(
                                    (e) => e
                                      ..updateInputListState(
                                        (e) => e.add(PlannerInputStruct(
                                          subjectNamePlanner:
                                              _model.dropDownValue,
                                          pickedColor: valueOrDefault<Color>(
                                            _model.colorToSet,
                                            FlutterFlowTheme.of(context)
                                                .success,
                                          ),
                                          whatIDid: _model.textController2.text,
                                          isdone: 'unclicked',
                                        )),
                                      ),
                                  );
                                  FFAppState().update(() {});
                                }
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('입력오류'),
                                      content: Text('과목명 및 공부내용을 입력해주세요'),
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
                                return;
                              }

                              Navigator.pop(context);
                            },
                            text: FFLocalizations.of(context).getText(
                              'd12my60n' /* 저장 */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF4F8EFF),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .titleSmallIsCustom,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              text: FFLocalizations.of(context).getText(
                                '5vws355k' /* 취소 */,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).error,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleSmallFamily,
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .titleSmallIsCustom,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
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
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
              child: Container(
                width: 100.0,
                height: 450.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'zlf5h4qk' /* ⚫  대표과목에서 지정된 과목명을 입력할 경우
    ... */
                                ,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                            ),
                          ),
                          RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    'aepslxd6' /* ⚫  공부내용을 구체적으로 입력하지 않을 시 
 */
                                    ,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    'xoofl2hx' /*         포인트 적립이 반려 */,
                                  ),
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context).error,
                                  ),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    '8kmtfqzi' /* 될 수 있으므로 구체적인
        학습계획을 작성... */
                                    ,
                                  ),
                                  style: TextStyle(),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/_2025_02_10_06_00_00_371.gif',
                                width: 200.0,
                                height: 200.0,
                                fit: BoxFit.contain,
                                alignment: Alignment(0.0, -1.0),
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
          ),
        ],
      ),
    );
  }
}
