import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cost_call_bottom_sheet_model.dart';
export 'cost_call_bottom_sheet_model.dart';

class CostCallBottomSheetWidget extends StatefulWidget {
  const CostCallBottomSheetWidget({
    super.key,
    required this.selectedDate,
  });

  final String? selectedDate;

  @override
  State<CostCallBottomSheetWidget> createState() =>
      _CostCallBottomSheetWidgetState();
}

class _CostCallBottomSheetWidgetState extends State<CostCallBottomSheetWidget> {
  late CostCallBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CostCallBottomSheetModel());

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
      width: double.infinity,
      height: 600.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(50.0, 50.0, 50.0, 50.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(-1.0, -1.0),
              child: RichText(
                textScaler: MediaQuery.of(context).textScaler,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: valueOrDefault<String>(
                        FFAppState()
                            .costCallList
                            .where((e) => e.date == widget.selectedDate)
                            .toList()
                            .firstOrNull
                            ?.date,
                        '2025-03-01',
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
                    TextSpan(
                      text: FFLocalizations.of(context).getText(
                        'ybhx8e7z' /*  일자 활성 사용자 좌석번호 */,
                      ),
                      style: TextStyle(),
                    ),
                    TextSpan(
                      text: FFLocalizations.of(context).getText(
                        'mvemu3tb' /*    (총  */,
                      ),
                      style: TextStyle(),
                    ),
                    TextSpan(
                      text: valueOrDefault<String>(
                        FFAppState()
                            .costCallList
                            .where((e) => e.date == widget.selectedDate)
                            .toList()
                            .firstOrNull
                            ?.totalActiveUser,
                        '1',
                      ),
                      style: TextStyle(),
                    ),
                    TextSpan(
                      text: FFLocalizations.of(context).getText(
                        '1t5jddjg' /* 명) */,
                      ),
                      style: TextStyle(),
                    )
                  ],
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        fontSize: 40.0,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                      ),
                ),
              ),
            ),
            Builder(
              builder: (context) {
                final aaa = FFAppState()
                        .costCallList
                        .where((e) => e.date == widget.selectedDate)
                        .toList()
                        .firstOrNull
                        ?.activeSeats
                        .toList() ??
                    [];

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(aaa.length, (aaaIndex) {
                      final aaaItem = aaa[aaaIndex];
                      return Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: aaaItem.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 30.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    'y5yomjab' /* ,  */,
                                  ),
                                  style: TextStyle(),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 30.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                );
              },
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'wxhjbjbi' /* 좌우로 스크롤 가능 */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
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
