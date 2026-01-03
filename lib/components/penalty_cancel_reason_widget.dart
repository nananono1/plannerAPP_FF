import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'penalty_cancel_reason_model.dart';
export 'penalty_cancel_reason_model.dart';

class PenaltyCancelReasonWidget extends StatefulWidget {
  const PenaltyCancelReasonWidget({
    super.key,
    required this.penaltyinput,
    required this.userdocs,
  });

  final PenaltyInputStruct? penaltyinput;
  final UsersRecord? userdocs;

  @override
  State<PenaltyCancelReasonWidget> createState() =>
      _PenaltyCancelReasonWidgetState();
}

class _PenaltyCancelReasonWidgetState extends State<PenaltyCancelReasonWidget> {
  late PenaltyCancelReasonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PenaltyCancelReasonModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      width: 600.0,
      height: 600.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 30.0, 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '38vzo693' /* 취소사유 입력 */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'hanbit',
                          fontSize: 30.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close_outlined,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30.0,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 400.0,
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .labelMediumIsCustom,
                                ),
                        hintText: FFLocalizations.of(context).getText(
                          'h34of5nf' /* ex) 사유 인정으로 인한 벌점 취소 */,
                        ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .labelMediumIsCustom,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .bodyMediumIsCustom,
                          ),
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      enableInteractiveSelection: true,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.reason2 = valueOrDefault<String>(
                            _model.textController.text,
                            '-',
                          );
                          safeSetState(() {});
                        },
                        text: FFLocalizations.of(context).getText(
                          'f0512n5s' /* 사유입력 */,
                        ),
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: Colors.white,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .titleSmallIsCustom,
                              ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'bw7bnetm' /* 전송예시 */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      useGoogleFonts:
                          !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
              child: Container(
                width: 540.0,
                height: 310.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: SelectionArea(
                      child: Text(
                    valueOrDefault<String>(
                      widget.penaltyinput?.label == '벌점상쇄'
                          ? valueOrDefault<String>(
                              (String who,
                                      String date,
                                      String r1,
                                      String r2,
                                      String addPt,
                                      String totalPt,
                                      String pointnow,
                                      String seat) {
                                return '[내공관리형스터디카페]\n'
                                    '<$who($seat)> $date 벌점상쇄취소\n'
                                    '사유: $r1 - $r2\n'
                                    '부여벌점: ${addPt * -1}점\n'
                                    '기존벌점: ${totalPt}점\n'
                                    '누적벌점: ${(double.parse(totalPt ?? "0") - double.parse(addPt ?? "0")).toString()}점\n'
                                    '현재 포인트 : ${pointnow}포인트';
                              }(
                                  valueOrDefault<String>(
                                    widget.userdocs?.displayName,
                                    '-',
                                  ),
                                  valueOrDefault<String>(
                                    dateTimeFormat(
                                      "y/M/d",
                                      widget.penaltyinput?.getDate,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    '-',
                                  ),
                                  valueOrDefault<String>(
                                    widget.penaltyinput?.reasonWhy,
                                    '-',
                                  ),
                                  valueOrDefault<String>(
                                    _model.textController.text,
                                    '-',
                                  ),
                                  valueOrDefault<String>(
                                    widget.penaltyinput?.penaltygiven
                                        .toString(),
                                    '0',
                                  ),
                                  valueOrDefault<String>(
                                    widget.userdocs?.penaltyPoint.toString(),
                                    '0',
                                  ),
                                  valueOrDefault<String>(
                                    widget.userdocs?.totalPoint.toString(),
                                    '0',
                                  ),
                                  valueOrDefault<String>(
                                    widget.userdocs?.seatNo.toString(),
                                    '0',
                                  )),
                              '1',
                            )
                          : valueOrDefault<String>(
                              (String who,
                                      String date,
                                      String r1,
                                      String r2,
                                      double addPt,
                                      double totalPt,
                                      String pointnow,
                                      String seat) {
                                return '[내공관리형스터디카페]\n' +
                                    '<$who($seat)> $date 벌점취소\n' +
                                    '사유: $r1 - $r2\n' +
                                    '취소벌점: ${addPt * -1}점\n' +
                                    '반영후 벌점: ${totalPt - addPt}점\n' +
                                    '현재 포인트 : ${pointnow}포인트';
                              }(
                                  valueOrDefault<String>(
                                    widget.userdocs?.displayName,
                                    '-',
                                  ),
                                  valueOrDefault<String>(
                                    dateTimeFormat(
                                      "y/M/d",
                                      widget.penaltyinput?.getDate,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    '-',
                                  ),
                                  valueOrDefault<String>(
                                    widget.penaltyinput?.reasonWhy,
                                    '-',
                                  ),
                                  valueOrDefault<String>(
                                    _model.textController.text,
                                    '-',
                                  ),
                                  valueOrDefault<double>(
                                    widget.penaltyinput?.penaltygiven,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    widget.userdocs?.penaltyPoint,
                                    0.0,
                                  ),
                                  valueOrDefault<String>(
                                    widget.userdocs?.totalPoint.toString(),
                                    '0',
                                  ),
                                  valueOrDefault<String>(
                                    widget.userdocs?.seatNo.toString(),
                                    '0',
                                  )),
                              '2',
                            ),
                      'a',
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  )),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 10.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(
                        text: valueOrDefault<String>(
                      widget.penaltyinput?.label == '벌점상쇄'
                          ? valueOrDefault<String>(
                              (String who,
                                      String date,
                                      String r1,
                                      String r2,
                                      String addPt,
                                      String totalPt,
                                      String pointnow,
                                      String seat) {
                                return '[내공관리형스터디카페]\n'
                                    '<$who($seat)> $date 벌점상쇄취소\n'
                                    '사유: $r1 - $r2\n'
                                    '부여벌점: ${addPt * -1}점\n'
                                    '기존벌점: ${totalPt}점\n'
                                    '누적벌점: ${(double.parse(totalPt ?? "0") - double.parse(addPt ?? "0")).toString()}점\n'
                                    '현재 포인트 : ${pointnow}포인트';
                              }(
                                  valueOrDefault<String>(
                                    widget.userdocs?.displayName,
                                    '-',
                                  ),
                                  valueOrDefault<String>(
                                    dateTimeFormat(
                                      "y/M/d",
                                      widget.penaltyinput?.getDate,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    '-',
                                  ),
                                  valueOrDefault<String>(
                                    widget.penaltyinput?.reasonWhy,
                                    '-',
                                  ),
                                  valueOrDefault<String>(
                                    _model.textController.text,
                                    '-',
                                  ),
                                  valueOrDefault<String>(
                                    widget.penaltyinput?.penaltygiven
                                        .toString(),
                                    '0',
                                  ),
                                  valueOrDefault<String>(
                                    widget.userdocs?.penaltyPoint.toString(),
                                    '0',
                                  ),
                                  valueOrDefault<String>(
                                    widget.userdocs?.totalPoint.toString(),
                                    '0',
                                  ),
                                  valueOrDefault<String>(
                                    widget.userdocs?.seatNo.toString(),
                                    '0',
                                  )),
                              '1',
                            )
                          : valueOrDefault<String>(
                              (String who,
                                      String date,
                                      String r1,
                                      String r2,
                                      double addPt,
                                      double totalPt,
                                      String pointnow,
                                      String seat) {
                                return '[내공관리형스터디카페]\n' +
                                    '<$who($seat)> $date 벌점취소\n' +
                                    '사유: $r1 - $r2\n' +
                                    '취소벌점: ${addPt * -1}점\n' +
                                    '반영후 벌점: ${totalPt - addPt}점\n' +
                                    '현재 포인트 : ${pointnow}포인트';
                              }(
                                  valueOrDefault<String>(
                                    widget.userdocs?.displayName,
                                    '-',
                                  ),
                                  valueOrDefault<String>(
                                    dateTimeFormat(
                                      "y/M/d",
                                      widget.penaltyinput?.getDate,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    '-',
                                  ),
                                  valueOrDefault<String>(
                                    widget.penaltyinput?.reasonWhy,
                                    '-',
                                  ),
                                  valueOrDefault<String>(
                                    _model.textController.text,
                                    '-',
                                  ),
                                  valueOrDefault<double>(
                                    widget.penaltyinput?.penaltygiven,
                                    0.0,
                                  ),
                                  valueOrDefault<double>(
                                    widget.userdocs?.penaltyPoint,
                                    0.0,
                                  ),
                                  valueOrDefault<String>(
                                    widget.userdocs?.totalPoint.toString(),
                                    '0',
                                  ),
                                  valueOrDefault<String>(
                                    widget.userdocs?.seatNo.toString(),
                                    '0',
                                  )),
                              '2',
                            ),
                      'a',
                    )));
                    Navigator.pop(
                        context,
                        valueOrDefault<String>(
                          (String var1, String var2, String var3) {
                            return '$var2 일자 $var3 - $var1';
                          }(
                              valueOrDefault<String>(
                                _model.textController.text,
                                '-',
                              ),
                              valueOrDefault<String>(
                                dateTimeFormat(
                                  "M/d",
                                  widget.penaltyinput?.getDate,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                '-',
                              ),
                              valueOrDefault<String>(
                                widget.penaltyinput?.reasonWhy,
                                '-',
                              )),
                          '-',
                        ));
                  },
                  text: valueOrDefault<String>(
                    (String var1) {
                      return '$var1 취소';
                    }((valueOrDefault<String>(
                              widget.penaltyinput?.label,
                              '-',
                            ) ==
                            '벌점'
                        ? '벌점'
                        : '벌점차감')),
                    '벌점취소',
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: Colors.white,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).titleSmallIsCustom,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
