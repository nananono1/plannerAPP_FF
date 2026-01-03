import '/backend/schema/structs/index.dart';
import '/components/simple_color_picker_widget.dart';
import '/components/subject_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().personalSubjectInfo.length < 8) {
        FFAppState().addToPersonalSubjectInfo(PersonalSubjectEachStruct(
          subject: '대표과목',
          color: Color(0xFFB7E2C0),
        ));
        safeSetState(() {});
      }
      if (FFAppState().personalSubjectInfo.length < 8) {
        FFAppState().addToPersonalSubjectInfo(PersonalSubjectEachStruct(
          subject: '대표과목',
          color: Color(0xFFB7E2C0),
        ));
        safeSetState(() {});
      }
      if (FFAppState().personalSubjectInfo.length < 8) {
        FFAppState().addToPersonalSubjectInfo(PersonalSubjectEachStruct(
          subject: '대표과목',
          color: Color(0xFFB7E2C0),
        ));
        safeSetState(() {});
      }
    });

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
      width: 1100.0,
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
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'awpjbk67' /* ※ 텍스트와 원을 클릭하여 과목명 및 과목색상 설정 */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '3wo54ayd' /* ※ 대표과목은 최대 9개까지 추가할 수 있습니다. */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: 400.0,
                        height: 400.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
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
                                      Builder(
                                        builder: (context) => InkWell(
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
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  alignment:
                                                      AlignmentDirectional(
                                                              0.0, 0.0)
                                                          .resolve(
                                                              Directionality.of(
                                                                  context)),
                                                  child:
                                                      SimpleColorPickerWidget(),
                                                );
                                              },
                                            ).then((value) => safeSetState(
                                                () => _model.color = value));

                                            FFAppState()
                                                .updatePersonalSubjectInfoAtIndex(
                                              reorderableSubjectListIndex,
                                              (e) => e
                                                ..color = _model.color != null
                                                    ? _model.color
                                                    : reorderableSubjectListItem
                                                        .color,
                                            );
                                            FFAppState().update(() {});

                                            safeSetState(() {});
                                          },
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 5.0,
                                            shape: const CircleBorder(),
                                            child: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    reorderableSubjectListItem
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
                                      ),
                                      Builder(
                                        builder: (context) => Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showAlignedDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                isGlobal: false,
                                                avoidOverflow: false,
                                                targetAnchor:
                                                    AlignmentDirectional(
                                                            0.0, 0.0)
                                                        .resolve(
                                                            Directionality.of(
                                                                context)),
                                                followerAnchor:
                                                    AlignmentDirectional(
                                                            0.0, 0.0)
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
                                              reorderableSubjectListItem
                                                  .subject,
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
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (FFAppState().personalSubjectInfo.length >= 9) {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  content: Text(
                                      '최대 대표과목 수를 초과했습니다. 스크롤을 내려 대표과목들을 확인해 보세요.'),
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
                            FFAppState().addToPersonalSubjectInfo(
                                PersonalSubjectEachStruct(
                              subject: '과목명',
                              color: FlutterFlowTheme.of(context).accent1,
                            ));
                            safeSetState(() {});
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              fillColor: Color(0xFFE2E2E2),
                              icon: Icon(
                                Icons.add,
                                color: FlutterFlowTheme.of(context).alternate,
                                size: 24.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'emwu1tpw' /* 대표과목 추가하기 */,
                                ),
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/_2025_02_10_04_32_02_171.gif',
                    width: 320.0,
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
