import '/components/subject_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:provider/provider.dart';
import 'reorderable_listview_model.dart';
export 'reorderable_listview_model.dart';

class ReorderableListviewWidget extends StatefulWidget {
  const ReorderableListviewWidget({super.key});

  @override
  State<ReorderableListviewWidget> createState() =>
      _ReorderableListviewWidgetState();
}

class _ReorderableListviewWidgetState extends State<ReorderableListviewWidget> {
  late ReorderableListviewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReorderableListviewModel());

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
      height: 600.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(30.0),
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 30.0, 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'a705batw' /* 대표과목설정 */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          fontSize: 40.0,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  ),
                  Flexible(
                    child: Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'awpjbk67' /* ※ 텍스트와 원을 클릭하여 과목명 및 과목색상 설정 */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .bodyMediumIsCustom,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 360.0,
                    height: 420.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 0.0, 10.0),
                      child: Builder(
                        builder: (context) {
                          final reorderableSubjectList =
                              FFAppState().personalSubjectInfo.toList();

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: reorderableSubjectList.length,
                            itemBuilder:
                                (context, reorderableSubjectListIndex) {
                              final reorderableSubjectListItem =
                                  reorderableSubjectList[
                                      reorderableSubjectListIndex];
                              return Container(
                                width: double.infinity,
                                height: 80.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        final _colorPickedColor =
                                            await showFFColorPicker(
                                          context,
                                          currentColor: _model.colorPicked ??
                                              reorderableSubjectListItem.color,
                                          showRecentColors: true,
                                          allowOpacity: true,
                                          textColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          secondaryTextColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          primaryButtonBackgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          primaryButtonTextColor: Colors.white,
                                          primaryButtonBorderColor:
                                              Colors.transparent,
                                          displayAsBottomSheet:
                                              isMobileWidth(context),
                                        );

                                        if (_colorPickedColor != null) {
                                          safeSetState(() => _model
                                              .colorPicked = _colorPickedColor);
                                        }

                                        FFAppState()
                                            .updatePersonalSubjectInfoAtIndex(
                                          reorderableSubjectListIndex,
                                          (e) => e
                                            ..color = _model.colorPicked != null
                                                ? _model.colorPicked
                                                : reorderableSubjectListItem
                                                    .color,
                                        );
                                        FFAppState().update(() {});
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 5.0,
                                        shape: const CircleBorder(),
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: reorderableSubjectListItem
                                                .color,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0x8604122A),
                                              width: 5.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) => Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showAlignedDialog(
                                              context: context,
                                              isGlobal: false,
                                              avoidOverflow: false,
                                              targetAnchor:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              followerAnchor:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              builder: (dialogContext) {
                                                return Material(
                                                  color: Colors.transparent,
                                                  child:
                                                      SubjectBottomSheetWidget(
                                                    passedString:
                                                        reorderableSubjectListItem
                                                            .subject,
                                                    listno:
                                                        reorderableSubjectListIndex,
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Text(
                                            reorderableSubjectListItem.subject,
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
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/_2025_02_10_04_32_02_171.gif',
                    width: 350.0,
                    height: 370.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ].divide(SizedBox(height: 20.0)),
        ),
      ),
    );
  }
}
