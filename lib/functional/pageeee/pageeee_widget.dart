import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/functional/daily_set/daily_set_widget.dart';
import '/functional/planner_fix/planner_fix_widget.dart';
import '/functional/planner_inut_set_copy/planner_inut_set_copy_widget.dart';
import '/functional/planner_time_option_bottom_sheet/planner_time_option_bottom_sheet_widget.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pageeee_model.dart';
export 'pageeee_model.dart';

class PageeeeWidget extends StatefulWidget {
  const PageeeeWidget({
    super.key,
    int? startTime,
    int? endTime,
    this.dataForPassSub,
    this.dataForPassPlan,
    this.dataForPassColor,
    this.timeToSum,
    this.passToAddSchema,
    bool? dbExist,
  })  : this.startTime = startTime ?? 9,
        this.endTime = endTime ?? 23,
        this.dbExist = dbExist ?? false;

  final int startTime;
  final int endTime;
  final String? dataForPassSub;
  final String? dataForPassPlan;
  final Color? dataForPassColor;
  final List<String>? timeToSum;
  final PageStateSchemaStruct? passToAddSchema;
  final bool dbExist;

  static String routeName = 'pageeee';
  static String routePath = '/pageeee';

  @override
  State<PageeeeWidget> createState() => _PageeeeWidgetState();
}

class _PageeeeWidgetState extends State<PageeeeWidget>
    with TickerProviderStateMixin {
  late PageeeeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageeeeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().timeIsGoing) {
        FFAppState().crashed = true;
        FFAppState().update(() {});

        context.goNamed(
          TimerPageWidget.routeName,
          queryParameters: {
            'subNameParameter': serializeParam(
              FFAppState().crashBackupData.subNameBackup,
              ParamType.String,
            ),
            'studiedDetailsParameter': serializeParam(
              FFAppState().crashBackupData.studiedDetailedBackup,
              ParamType.String,
            ),
            'indexIDParameter': serializeParam(
              FFAppState().crashBackupData.indexIDBackup,
              ParamType.int,
            ),
          }.withoutNulls,
        );

        return;
      }
      if (currentUserReference == null) {
        FFAppState().insideDBStudent = [];
        FFAppState().deletePageStateSchemaVariable();
        FFAppState().pageStateSchemaVariable =
            PageStateSchemaStruct.fromSerializableMap(jsonDecode(
                '{\"inputListState\":\"[]\",\"submittedDatePlanner\":\"1735657200000\",\"dailyStartPara\":\"{\\\"CommentOfDay\\\":\\\" \\\"}\",\"basicInfoState\":\"{\\\"uid\\\":\\\"\\\"}\"}'));

        FFAppState().deleteChangeChecker();
        FFAppState().changeChecker = PageStateSchemaStruct();

        FFAppState().deleteCurrentIndexIDParameter();
        FFAppState().currentIndexIDParameter = 0;

        FFAppState().deleteDDayAppState();
        FFAppState().dDayAppState = [];

        FFAppState().update(() {});

        context.goNamed(AuthWelcomeScreenWidget.routeName);
      } else {
        if (valueOrDefault(currentUserDocument?.seatNo, 0) >= 1) {
          if (FFAppState().plannerDateSelected == null) {
            FFAppState().plannerDateSelected =
                functions.getDateAtMidnight(getCurrentTimestamp);
            safeSetState(() {});
          }
          _model.firstquery = await queryPlannerVariableListRecordOnce(
            parent: currentUserReference,
            queryBuilder: (plannerVariableListRecord) =>
                plannerVariableListRecord.where(
              'submittedDate',
              isEqualTo: FFAppState().plannerDateSelected,
            ),
            singleRecord: true,
          ).then((s) => s.firstOrNull);
          if ((_model.firstquery?.adminChecked == true) &&
              (_model.firstquery?.plannerSubmitted == true)) {
            FFAppState().updatePageStateSchemaVariableStruct(
              (e) => e
                ..teacherquoteState = _model.firstquery?.teachersQuote
                ..isSubmittedPara = _model.firstquery?.plannerSubmitted
                ..adminCheckedPara = _model.firstquery?.adminChecked,
            );
            safeSetState(() {});
          }
          if (FFAppState().newCallOnPlanner == true) {
            FFAppState().updatePageStateSchemaVariableStruct(
              (e) => e
                ..goodThingsPlanner = _model.textController.text
                ..submittedDatePlanner = FFAppState().plannerDateSelected,
            );
            FFAppState().update(() {});
            if (FFAppState()
                    .insideDBStudent
                    .where((e) =>
                        e.submittedDatePlanner ==
                        FFAppState().plannerDateSelected)
                    .toList()
                    .length >
                0) {
              FFAppState().updateInsideDBStudentAtIndex(
                functions.getIndexFunction(
                    FFAppState().insideDBStudent.toList(),
                    FFAppState().plannerDateSelected!),
                (_) => FFAppState().pageStateSchemaVariable,
              );
              FFAppState().update(() {});
            } else {
              FFAppState()
                  .addToInsideDBStudent(FFAppState().pageStateSchemaVariable);
              FFAppState().update(() {});
            }

            if (valueOrDefault<bool>(
                  FFAppState().pageStateSchemaVariable.inputListState.length >=
                      1,
                  false,
                ) ||
                valueOrDefault<bool>(
                  FFAppState().pageStateSchemaVariable.goodThingsPlanner !=
                          '',
                  false,
                ) ||
                valueOrDefault<bool>(
                  FFAppState().pageStateSchemaVariable.imporovementState !=
                          '',
                  false,
                ) ||
                (FFAppState()
                        .pageStateSchemaVariable
                        .dailyStartPara
                        .sleepTime !=
                    null) ||
                (FFAppState()
                        .pageStateSchemaVariable
                        .dailyStartPara
                        .getupTime !=
                    null) ||
                (FFAppState()
                            .pageStateSchemaVariable
                            .dailyStartPara
                            .goalTime !=
                        '') ||
                (FFAppState()
                            .pageStateSchemaVariable
                            .dailyStartPara
                            .commentOfDay !=
                        '')) {
              _model.queryToday777 = await queryPlannerVariableListRecordOnce(
                parent: currentUserReference,
                queryBuilder: (plannerVariableListRecord) =>
                    plannerVariableListRecord.where(
                  'submittedDate',
                  isEqualTo: FFAppState().plannerDateSelected,
                ),
                singleRecord: true,
              ).then((s) => s.firstOrNull);
              if (_model.queryToday777 != null) {
                await _model.queryToday777!.reference.update({
                  ...createPlannerVariableListRecordData(
                    goodThings:
                        FFAppState().pageStateSchemaVariable.goodThingsPlanner,
                    improvement:
                        FFAppState().pageStateSchemaVariable.imporovementState,
                    achivementPercentage: FFAppState()
                        .pageStateSchemaVariable
                        .archivePercentState,
                    dailyStarting: updateDailyStartingStruct(
                      FFAppState().pageStateSchemaVariable.dailyStartPara,
                      clearUnsetFields: false,
                    ),
                  ),
                  ...mapToFirestore(
                    {
                      'inputList': getPlannerInputListFirestoreData(
                        FFAppState().pageStateSchemaVariable.inputListState,
                      ),
                    },
                  ),
                });
              } else {
                await PlannerVariableListRecord.createDoc(currentUserReference!)
                    .set({
                  ...createPlannerVariableListRecordData(
                    adminChecked: false,
                    goodThings:
                        FFAppState().pageStateSchemaVariable.goodThingsPlanner,
                    improvement:
                        FFAppState().pageStateSchemaVariable.imporovementState,
                    achivementPercentage: valueOrDefault<double>(
                      FFAppState().pageStateSchemaVariable.archivePercentState,
                      0.0,
                    ),
                    submittedDate: FFAppState().plannerDateSelected,
                    plannerSubmitted: false,
                    basicInfo: updateBasicUserInfoStruct(
                      BasicUserInfoStruct(
                        uid: currentUserReference?.id,
                        userName: currentUserDisplayName,
                        userSeatNo:
                            valueOrDefault(currentUserDocument?.seatNo, 0),
                        userSpot: valueOrDefault(currentUserDocument?.spot, ''),
                      ),
                      clearUnsetFields: false,
                      create: true,
                    ),
                    dailyStarting: updateDailyStartingStruct(
                      FFAppState().pageStateSchemaVariable.dailyStartPara,
                      clearUnsetFields: false,
                      create: true,
                    ),
                    teachersQuote: '',
                  ),
                  ...mapToFirestore(
                    {
                      'inputList': getPlannerInputListFirestoreData(
                        FFAppState().pageStateSchemaVariable.inputListState,
                      ),
                    },
                  ),
                });
              }
            }
            if (FFAppState().newCallOnPlanner == true) {
              FFAppState().plannerDateSelected =
                  currentUserDocument?.latestSubmittedDate;
              FFAppState().update(() {});
            } else {
              FFAppState().plannerDateSelected =
                  currentUserDocument?.latestSubmittedDate;
              FFAppState().update(() {});
            }

            FFAppState().dateselectSafety = FFAppState().plannerDateSelected;
            FFAppState().update(() {});
            if (animationsMap['rowOnActionTriggerAnimation'] != null) {
              animationsMap['rowOnActionTriggerAnimation']!
                  .controller
                  .forward(from: 0.0);
            }
            if (FFAppState()
                    .insideDBStudent
                    .where((e) =>
                        e.submittedDatePlanner ==
                        FFAppState().plannerDateSelected)
                    .toList()
                    .length >
                99999999) {
              FFAppState().pageStateSchemaVariable = FFAppState()
                  .insideDBStudent
                  .elementAtOrNull(functions.getIndexFunction(
                      FFAppState().insideDBStudent.toList(),
                      FFAppState().plannerDateSelected!))!;
              safeSetState(() {});
              await Future.wait([
                Future(() async {
                  safeSetState(() {
                    _model.textController?.text =
                        FFAppState().pageStateSchemaVariable.goodThingsPlanner;
                  });
                }),
              ]);
            } else {
              _model.loadedInfo66 = await queryPlannerVariableListRecordOnce(
                parent: currentUserReference,
                queryBuilder: (plannerVariableListRecord) =>
                    plannerVariableListRecord.where(
                  'submittedDate',
                  isEqualTo: FFAppState().plannerDateSelected,
                ),
                singleRecord: true,
              ).then((s) => s.firstOrNull);
              if (_model.loadedInfo66 != null) {
                FFAppState().pageStateSchemaVariable = PageStateSchemaStruct(
                  inputListState: _model.loadedInfo66?.inputList,
                  submittedDatePlanner: _model.loadedInfo66?.submittedDate,
                  goodThingsPlanner: _model.loadedInfo66?.goodThings,
                  imporovementState: _model.loadedInfo66?.improvement,
                  teacherquoteState: _model.loadedInfo66?.teachersQuote,
                  isSubmittedPara: _model.loadedInfo66?.plannerSubmitted,
                  archivePercentState: 5.0,
                  userName: currentUserDisplayName,
                  adminCheckedPara: _model.loadedInfo66?.adminChecked,
                  dailyStartPara: _model.loadedInfo66?.dailyStarting,
                  basicInfoState: _model.loadedInfo66?.basicInfo,
                );
                FFAppState().update(() {});
                safeSetState(() {
                  _model.textController?.clear();
                });
                await Future.wait([
                  Future(() async {
                    safeSetState(() {
                      _model.textController?.text = FFAppState()
                          .pageStateSchemaVariable
                          .goodThingsPlanner;
                    });
                  }),
                ]);
                FFAppState().newCallOnPlanner = false;
                FFAppState().update(() {});
              } else {
                FFAppState().deletePageStateSchemaVariable();
                FFAppState().pageStateSchemaVariable =
                    PageStateSchemaStruct.fromSerializableMap(jsonDecode(
                        '{\"inputListState\":\"[]\",\"submittedDatePlanner\":\"1735657200000\",\"dailyStartPara\":\"{\\\"CommentOfDay\\\":\\\" \\\"}\",\"basicInfoState\":\"{\\\"uid\\\":\\\"\\\"}\"}'));

                FFAppState().update(() {});
                safeSetState(() {
                  _model.textController?.clear();
                });
              }
            }

            FFAppState().changeChecker = FFAppState().pageStateSchemaVariable;
            FFAppState().update(() {});
          }
        } else {
          if (valueOrDefault<bool>(currentUserDocument?.seatRequest, false) ==
              true) {
            await showDialog(
              context: context,
              builder: (alertDialogContext) {
                return AlertDialog(
                  title: Text('승인 대기'),
                  content: Text('관리자 승인을 대기해주세요'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(alertDialogContext),
                      child: Text('Ok'),
                    ),
                  ],
                );
              },
            );
          } else {
            var confirmDialogResponse = await showDialog<bool>(
                  context: context,
                  builder: (alertDialogContext) {
                    return AlertDialog(
                      title: Text('승인대기'),
                      content: Text('관리자에게 좌석승인을 요청하시겠습니까?'),
                      actions: [
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(alertDialogContext, false),
                          child: Text('아니오'),
                        ),
                        TextButton(
                          onPressed: () =>
                              Navigator.pop(alertDialogContext, true),
                          child: Text('예'),
                        ),
                      ],
                    );
                  },
                ) ??
                false;
            if (confirmDialogResponse) {
              await currentUserReference!.update(createUsersRecordData(
                seatRequest: true,
              ));
              await showDialog(
                context: context,
                builder: (alertDialogContext) {
                  return AlertDialog(
                    content: Text('승인 요청되었습니다!'),
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
          }

          context.goNamed(HomePageCopyWidget.routeName);
        }
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(
      () async {
        _model.focusIsSet = !_model.focusIsSet;
        safeSetState(() {});
      },
    );
    animationsMap.addAll({
      'rowOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 1000.0.ms,
            duration: 900.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
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
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
          drawer: Container(
            width: 400.0,
            child: Drawer(
              elevation: 16.0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F4F8),
                        borderRadius: BorderRadius.circular(0.0),
                        border: Border.all(
                          color: Color(0xFFE5E7EB),
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/JPG.jpg',
                                      width: 100.0,
                                      height: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        30.0, 0.0, 0.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        currentUserDisplayName,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              font: GoogleFonts.ubuntu(
                                                fontWeight: FontWeight.w800,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF15161E),
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w800,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              height: 12.0,
                              thickness: 2.0,
                              color: Color(0xFFE5E7EB),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '4t3g5d59' /* Platform Navigation */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF606A85),
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                            HomePageCopyWidget.routeName);
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.easeInOut,
                                        width: double.infinity,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF1F4F8),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 6.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Icon(
                                                  Icons.home,
                                                  color: Color(0xFF15161E),
                                                  size: 40.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'xo08j24a' /* 메인메뉴 */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .plusJakartaSans(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF15161E),
                                                        fontSize: 30.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context
                                            .pushNamed(PageeeeWidget.routeName);
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.easeInOut,
                                        width: double.infinity,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEDDABB),
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
                                              BorderRadius.circular(12.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 6.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Icon(
                                                      Icons.menu_book,
                                                      color: Color(0xFF15161E),
                                                      size: 40.0,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '1dl3o6ls' /* 플래너확인 */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .plusJakartaSans(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFF15161E),
                                                            fontSize: 30.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
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
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.aa1 =
                                            await queryStudyDBbackupAggRecordOnce(
                                          parent: currentUserReference,
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        FFAppState().insideDBStudent = _model
                                            .aa1!.studyDBbackup
                                            .toList()
                                            .cast<PageStateSchemaStruct>();
                                        safeSetState(() {});

                                        context.pushNamed(
                                            StudentAnalyticsWidget.routeName);

                                        safeSetState(() {});
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.easeInOut,
                                        width: double.infinity,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF1F4F8),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 6.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Icon(
                                                  Icons.pie_chart_rounded,
                                                  color: Color(0xFF15161E),
                                                  size: 40.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'xkumutni' /* 공부시간분석 */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .plusJakartaSans(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF15161E),
                                                        fontSize: 30.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                            TimetablePageWidget.routeName);
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.easeInOut,
                                        width: double.infinity,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF1F4F8),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 6.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Icon(
                                                  Icons.space_dashboard_rounded,
                                                  color: Color(0xFF15161E),
                                                  size: 40.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'wcgnbbjx' /* 시간표 관리 */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .plusJakartaSans(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF15161E),
                                                        fontSize: 30.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 20.0, 0.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'pmetb3iw' /* Settings */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF606A85),
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                            UserPageWidget.routeName);
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.easeInOut,
                                        width: double.infinity,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF1F4F8),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 6.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Icon(
                                                Icons.person,
                                                color: Color(0xFF15161E),
                                                size: 40.0,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'zgmkf3a2' /* 개인설정 */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .plusJakartaSans(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF15161E),
                                                        fontSize: 30.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 18.0)),
                              ),
                            ),
                            Divider(
                              height: 12.0,
                              thickness: 2.0,
                              color: Color(0xFFE5E7EB),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'hqrq48id' /* 보유 포인트 :  */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        font: GoogleFonts
                                                            .plusJakartaSans(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLarge
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            Color(0xFF15161E),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .fontStyle,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: valueOrDefault(
                                                          currentUserDocument
                                                              ?.totalPoint,
                                                          0)
                                                      .toString(),
                                                  style: TextStyle(),
                                                ),
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'srpozm5v' /*  점  */,
                                                  ),
                                                  style: TextStyle(),
                                                )
                                              ],
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    font: GoogleFonts
                                                        .plusJakartaSans(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF15161E),
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                          AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              valueOrDefault(
                                                  currentUserDocument?.spot,
                                                  ''),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    font: GoogleFonts
                                                        .plusJakartaSans(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Color(0xFF606A85),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                              TemporaryLockPageWidget
                                                  .routeName);
                                        },
                                        child: FaIcon(
                                          FontAwesomeIcons.lock,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 40.0,
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
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SafeArea(
            top: true,
            child: Stack(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 0.0, 20.0),
                        child: GestureDetector(
                          onVerticalDragEnd: (details) async {
                            scaffoldKey.currentState!.openDrawer();
                          },
                          child: Container(
                            width: 100.0,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 14.0, 0.0, 15.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 5.0, 0.0, 10.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              scaffoldKey.currentState!
                                                  .openDrawer();
                                            },
                                            child: Icon(
                                              Icons.menu,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 50.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    40.0, 0.0, 5.0, 0.0),
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 2.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF08151),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    '${valueOrDefault<String>(
                                                      functions
                                                          .calculatePointDay(
                                                              FFAppState()
                                                                  .pageStateSchemaVariable)
                                                          ?.toString(),
                                                      '0',
                                                    )}포인트',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displaySmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .openSans(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .displaySmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .displaySmall
                                                                    .fontStyle,
                                                          ),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displaySmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .displaySmall
                                                                  .fontStyle,
                                                        ),
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
                                Expanded(
                                  flex: 45,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 150.0,
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
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  child: Builder(
                                                    builder: (context) =>
                                                        Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: InkWell(
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
                                                                      Container(
                                                                    height:
                                                                        500.0,
                                                                    width:
                                                                        500.0,
                                                                    child:
                                                                        DailySetWidget(
                                                                      passedInfos:
                                                                          FFAppState()
                                                                              .pageStateSchemaVariable,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Icon(
                                                          Icons.settings_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 25.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                20.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            RichText(
                                                              textScaler:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '7mbntnn0' /* 수면시각 :  */,
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
                                                                  TextSpan(
                                                                    text: valueOrDefault<
                                                                        String>(
                                                                      dateTimeFormat(
                                                                        "Hm",
                                                                        FFAppState()
                                                                            .pageStateSchemaVariable
                                                                            .dailyStartPara
                                                                            .sleepTime,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      '미작성',
                                                                    ),
                                                                    style:
                                                                        TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
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
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'tngtwzm4' /* 기상시각 :  */,
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
                                                                  TextSpan(
                                                                    text: valueOrDefault<
                                                                        String>(
                                                                      dateTimeFormat(
                                                                        "Hm",
                                                                        FFAppState()
                                                                            .pageStateSchemaVariable
                                                                            .dailyStartPara
                                                                            .getupTime,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      '미작성',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
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
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '074bs2m3' /* 목표공부시간 :  */,
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
                                                                  TextSpan(
                                                                    text: valueOrDefault<
                                                                        String>(
                                                                      FFAppState()
                                                                          .pageStateSchemaVariable
                                                                          .dailyStartPara
                                                                          .goalTime,
                                                                      '00h 00m',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
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
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .textScaler,
                                                              text: TextSpan(
                                                                children: [
                                                                  TextSpan(
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      't4167kpj' /* 현재공부시간 :  */,
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
                                                                  TextSpan(
                                                                    text: valueOrDefault<
                                                                        String>(
                                                                      functions.calculateTotalStudyTime(FFAppState()
                                                                          .pageStateSchemaVariable
                                                                          .inputListState
                                                                          .toList()),
                                                                      '0h 0m',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  )
                                                                ],
                                                                style: FlutterFlowTheme.of(
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
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 10.0)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 5.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 260.0,
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
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          3.0, 3.0, 3.0, 3.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        child: custom_widgets
                                                            .DailyPieChart(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          pageStateSchema:
                                                              FFAppState()
                                                                  .pageStateSchemaVariable,
                                                        ),
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 5.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 260.0,
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
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 2.0,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
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
                                                            valueOrDefault<
                                                                String>(
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .dailyStartPara
                                                              .goalTime,
                                                          '12h 00m',
                                                        ),
                                                        pageStateSchema:
                                                            FFAppState()
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
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 15.0, 5.0),
                        child: Container(
                          width: 100.0,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 3.0, 1.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'lpr2o7f4' /* ※ 날짜 텍스트를 스와이프하거나 캘린더 버튼을 클릭하여... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      3.0, 1.0, 3.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: GestureDetector(
                                          onVerticalDragEnd: (details) async {
                                            _model.localxEnd =
                                                details.globalPosition.dx;
                                            safeSetState(() {});
                                            if (FFAppState().isloading ==
                                                false) {
                                              if ((FFAppConstants.C200 <=
                                                      ((_model.localxStart!) -
                                                          (_model
                                                              .localxEnd!))) ||
                                                  (FFAppConstants.C200 <=
                                                      ((_model.localxEnd!) -
                                                          (_model
                                                              .localxStart!)))) {
                                                if (_model.length0! <
                                                    ((_model.localxStart!) -
                                                        (_model.localxEnd!))) {
                                                  FFAppState()
                                                      .updatePageStateSchemaVariableStruct(
                                                    (e) => e
                                                      ..goodThingsPlanner =
                                                          _model.textController
                                                              .text
                                                      ..submittedDatePlanner =
                                                          FFAppState()
                                                              .plannerDateSelected
                                                      ..dailyStartPara =
                                                          DailyStartingStruct(
                                                        sleepTime: FFAppState()
                                                            .pageStateSchemaVariable
                                                            .dailyStartPara
                                                            .sleepTime,
                                                        getupTime: FFAppState()
                                                            .pageStateSchemaVariable
                                                            .dailyStartPara
                                                            .getupTime,
                                                        goalTime: FFAppState()
                                                            .pageStateSchemaVariable
                                                            .dailyStartPara
                                                            .goalTime,
                                                      ),
                                                  );
                                                  FFAppState().update(() {});
                                                  if (valueOrDefault<bool>(
                                                        FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .length >=
                                                            1,
                                                        false,
                                                      ) ||
                                                      valueOrDefault<bool>(
                                                        FFAppState()
                                                                    .pageStateSchemaVariable
                                                                    .goodThingsPlanner !=
                                                                '',
                                                        false,
                                                      ) ||
                                                      valueOrDefault<bool>(
                                                        FFAppState()
                                                                    .pageStateSchemaVariable
                                                                    .imporovementState !=
                                                                '',
                                                        false,
                                                      ) ||
                                                      (FFAppState()
                                                              .pageStateSchemaVariable
                                                              .dailyStartPara
                                                              .sleepTime !=
                                                          null) ||
                                                      (FFAppState()
                                                              .pageStateSchemaVariable
                                                              .dailyStartPara
                                                              .getupTime !=
                                                          null) ||
                                                      (FFAppState()
                                                                  .pageStateSchemaVariable
                                                                  .dailyStartPara
                                                                  .goalTime !=
                                                              '') ||
                                                      (FFAppState()
                                                                  .pageStateSchemaVariable
                                                                  .dailyStartPara
                                                                  .commentOfDay !=
                                                              '')) {
                                                    _model.queryToday1 =
                                                        await queryPlannerVariableListRecordOnce(
                                                      parent:
                                                          currentUserReference,
                                                      queryBuilder:
                                                          (plannerVariableListRecord) =>
                                                              plannerVariableListRecord
                                                                  .where(
                                                                    'submittedDate',
                                                                    isGreaterThan:
                                                                        functions
                                                                            .subtractminusTenSeconds(FFAppState().plannerDateSelected!),
                                                                  )
                                                                  .where(
                                                                    'submittedDate',
                                                                    isLessThanOrEqualTo:
                                                                        functions
                                                                            .addTenSecond(FFAppState().plannerDateSelected!),
                                                                  ),
                                                      singleRecord: true,
                                                    ).then((s) =>
                                                            s.firstOrNull);
                                                    if (_model.queryToday1 !=
                                                        null) {
                                                      await _model.queryToday1!
                                                          .reference
                                                          .update({
                                                        ...createPlannerVariableListRecordData(
                                                          goodThings: FFAppState()
                                                              .pageStateSchemaVariable
                                                              .goodThingsPlanner,
                                                          improvement: FFAppState()
                                                              .pageStateSchemaVariable
                                                              .imporovementState,
                                                          achivementPercentage:
                                                              FFAppState()
                                                                  .pageStateSchemaVariable
                                                                  .archivePercentState,
                                                          dailyStarting:
                                                              updateDailyStartingStruct(
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .dailyStartPara,
                                                            clearUnsetFields:
                                                                false,
                                                          ),
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'inputList':
                                                                getPlannerInputListFirestoreData(
                                                              FFAppState()
                                                                  .pageStateSchemaVariable
                                                                  .inputListState,
                                                            ),
                                                          },
                                                        ),
                                                      });
                                                    } else {
                                                      await PlannerVariableListRecord
                                                              .createDoc(
                                                                  currentUserReference!)
                                                          .set({
                                                        ...createPlannerVariableListRecordData(
                                                          adminChecked: false,
                                                          goodThings: FFAppState()
                                                              .pageStateSchemaVariable
                                                              .goodThingsPlanner,
                                                          improvement: FFAppState()
                                                              .pageStateSchemaVariable
                                                              .imporovementState,
                                                          achivementPercentage:
                                                              valueOrDefault<
                                                                  double>(
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .archivePercentState,
                                                            0.0,
                                                          ),
                                                          submittedDate:
                                                              FFAppState()
                                                                  .plannerDateSelected,
                                                          plannerSubmitted:
                                                              false,
                                                          basicInfo:
                                                              updateBasicUserInfoStruct(
                                                            BasicUserInfoStruct(
                                                              uid:
                                                                  currentUserReference
                                                                      ?.id,
                                                              userName:
                                                                  currentUserDisplayName,
                                                              userSeatNo:
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.seatNo,
                                                                      0),
                                                              userSpot:
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.spot,
                                                                      ''),
                                                            ),
                                                            clearUnsetFields:
                                                                false,
                                                            create: true,
                                                          ),
                                                          dailyStarting:
                                                              updateDailyStartingStruct(
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .dailyStartPara,
                                                            clearUnsetFields:
                                                                false,
                                                            create: true,
                                                          ),
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'inputList':
                                                                getPlannerInputListFirestoreData(
                                                              FFAppState()
                                                                  .pageStateSchemaVariable
                                                                  .inputListState,
                                                            ),
                                                          },
                                                        ),
                                                      });
                                                    }
                                                  }
                                                  FFAppState()
                                                          .plannerDateSelected =
                                                      functions.addoneday(
                                                          FFAppState()
                                                              .plannerDateSelected!);
                                                  FFAppState().update(() {});
                                                  if (animationsMap[
                                                          'rowOnActionTriggerAnimation'] !=
                                                      null) {
                                                    animationsMap[
                                                            'rowOnActionTriggerAnimation']!
                                                        .controller
                                                        .forward(from: 0.0);
                                                  }
                                                  _model.loadedInfoCopy =
                                                      await queryPlannerVariableListRecordOnce(
                                                    parent:
                                                        currentUserReference,
                                                    queryBuilder:
                                                        (plannerVariableListRecord) =>
                                                            plannerVariableListRecord
                                                                .where(
                                                                  'submittedDate',
                                                                  isGreaterThan:
                                                                      functions.subtractminusTenSeconds(
                                                                          FFAppState()
                                                                              .plannerDateSelected!),
                                                                )
                                                                .where(
                                                                  'submittedDate',
                                                                  isLessThanOrEqualTo:
                                                                      functions.addTenSecond(
                                                                          FFAppState()
                                                                              .plannerDateSelected!),
                                                                ),
                                                    singleRecord: true,
                                                  ).then((s) => s.firstOrNull);
                                                  if (_model.loadedInfoCopy !=
                                                      null) {
                                                    FFAppState()
                                                            .pageStateSchemaVariable =
                                                        PageStateSchemaStruct(
                                                      inputListState: _model
                                                          .loadedInfoCopy
                                                          ?.inputList,
                                                      submittedDatePlanner:
                                                          _model.loadedInfoCopy
                                                              ?.submittedDate,
                                                      goodThingsPlanner: _model
                                                          .loadedInfoCopy
                                                          ?.goodThings,
                                                      imporovementState: _model
                                                          .loadedInfoCopy
                                                          ?.improvement,
                                                      archivePercentState: _model
                                                          .loadedInfoCopy
                                                          ?.achivementPercentage,
                                                      teacherquoteState: _model
                                                          .loadedInfoCopy
                                                          ?.teachersQuote,
                                                      isSubmittedPara: _model
                                                          .loadedInfoCopy
                                                          ?.plannerSubmitted,
                                                      adminCheckedPara: _model
                                                          .loadedInfoCopy
                                                          ?.adminChecked,
                                                      dailyStartPara: _model
                                                          .loadedInfoCopy
                                                          ?.dailyStarting,
                                                    );
                                                    FFAppState().update(() {});
                                                    safeSetState(() {
                                                      _model.textController
                                                          ?.clear();
                                                    });
                                                    await Future.wait([
                                                      Future(() async {
                                                        safeSetState(() {
                                                          _model.textController
                                                                  ?.text =
                                                              FFAppState()
                                                                  .pageStateSchemaVariable
                                                                  .goodThingsPlanner;
                                                        });
                                                      }),
                                                    ]);
                                                  } else {
                                                    FFAppState()
                                                        .deletePageStateSchemaVariable();
                                                    FFAppState()
                                                            .pageStateSchemaVariable =
                                                        PageStateSchemaStruct
                                                            .fromSerializableMap(
                                                                jsonDecode(
                                                                    '{\"inputListState\":\"[]\",\"submittedDatePlanner\":\"1735657200000\",\"dailyStartPara\":\"{\\\"CommentOfDay\\\":\\\" \\\"}\",\"basicInfoState\":\"{\\\"uid\\\":\\\"\\\"}\"}'));

                                                    FFAppState().update(() {});
                                                    safeSetState(() {
                                                      _model.textController
                                                          ?.clear();
                                                    });
                                                  }

                                                  FFAppState().changeChecker =
                                                      FFAppState()
                                                          .pageStateSchemaVariable;
                                                  FFAppState().update(() {});
                                                } else {
                                                  FFAppState()
                                                      .updatePageStateSchemaVariableStruct(
                                                    (e) => e
                                                      ..goodThingsPlanner =
                                                          _model.textController
                                                              .text
                                                      ..submittedDatePlanner =
                                                          FFAppState()
                                                              .plannerDateSelected
                                                      ..dailyStartPara =
                                                          DailyStartingStruct(
                                                        sleepTime: FFAppState()
                                                            .pageStateSchemaVariable
                                                            .dailyStartPara
                                                            .sleepTime,
                                                        getupTime: FFAppState()
                                                            .pageStateSchemaVariable
                                                            .dailyStartPara
                                                            .getupTime,
                                                        goalTime: FFAppState()
                                                            .pageStateSchemaVariable
                                                            .dailyStartPara
                                                            .goalTime,
                                                      ),
                                                  );
                                                  FFAppState().update(() {});
                                                  if (valueOrDefault<bool>(
                                                        FFAppState()
                                                                .pageStateSchemaVariable
                                                                .inputListState
                                                                .length >=
                                                            1,
                                                        false,
                                                      ) ||
                                                      valueOrDefault<bool>(
                                                        FFAppState()
                                                                    .pageStateSchemaVariable
                                                                    .goodThingsPlanner !=
                                                                '',
                                                        false,
                                                      ) ||
                                                      valueOrDefault<bool>(
                                                        FFAppState()
                                                                    .pageStateSchemaVariable
                                                                    .imporovementState !=
                                                                '',
                                                        false,
                                                      ) ||
                                                      (FFAppState()
                                                              .pageStateSchemaVariable
                                                              .dailyStartPara
                                                              .sleepTime !=
                                                          null) ||
                                                      (FFAppState()
                                                              .pageStateSchemaVariable
                                                              .dailyStartPara
                                                              .getupTime !=
                                                          null) ||
                                                      (FFAppState()
                                                                  .pageStateSchemaVariable
                                                                  .dailyStartPara
                                                                  .goalTime !=
                                                              '') ||
                                                      (FFAppState()
                                                                  .pageStateSchemaVariable
                                                                  .dailyStartPara
                                                                  .commentOfDay !=
                                                              '')) {
                                                    _model.queryToday2 =
                                                        await queryPlannerVariableListRecordOnce(
                                                      parent:
                                                          currentUserReference,
                                                      queryBuilder:
                                                          (plannerVariableListRecord) =>
                                                              plannerVariableListRecord
                                                                  .where(
                                                                    'submittedDate',
                                                                    isGreaterThan:
                                                                        functions
                                                                            .subtractminusTenSeconds(FFAppState().plannerDateSelected!),
                                                                  )
                                                                  .where(
                                                                    'submittedDate',
                                                                    isLessThan:
                                                                        functions
                                                                            .addTenSecond(FFAppState().plannerDateSelected!),
                                                                  ),
                                                      singleRecord: true,
                                                    ).then((s) =>
                                                            s.firstOrNull);
                                                    if (_model.queryToday2 !=
                                                        null) {
                                                      await _model.queryToday2!
                                                          .reference
                                                          .update({
                                                        ...createPlannerVariableListRecordData(
                                                          goodThings: FFAppState()
                                                              .pageStateSchemaVariable
                                                              .goodThingsPlanner,
                                                          improvement: FFAppState()
                                                              .pageStateSchemaVariable
                                                              .imporovementState,
                                                          achivementPercentage:
                                                              FFAppState()
                                                                  .pageStateSchemaVariable
                                                                  .archivePercentState,
                                                          dailyStarting:
                                                              updateDailyStartingStruct(
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .dailyStartPara,
                                                            clearUnsetFields:
                                                                false,
                                                          ),
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'inputList':
                                                                getPlannerInputListFirestoreData(
                                                              FFAppState()
                                                                  .pageStateSchemaVariable
                                                                  .inputListState,
                                                            ),
                                                          },
                                                        ),
                                                      });
                                                    } else {
                                                      await PlannerVariableListRecord
                                                              .createDoc(
                                                                  currentUserReference!)
                                                          .set({
                                                        ...createPlannerVariableListRecordData(
                                                          adminChecked: false,
                                                          goodThings: FFAppState()
                                                              .pageStateSchemaVariable
                                                              .goodThingsPlanner,
                                                          improvement: FFAppState()
                                                              .pageStateSchemaVariable
                                                              .imporovementState,
                                                          achivementPercentage:
                                                              valueOrDefault<
                                                                  double>(
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .archivePercentState,
                                                            0.0,
                                                          ),
                                                          submittedDate:
                                                              FFAppState()
                                                                  .plannerDateSelected,
                                                          plannerSubmitted:
                                                              false,
                                                          basicInfo:
                                                              updateBasicUserInfoStruct(
                                                            BasicUserInfoStruct(
                                                              uid:
                                                                  currentUserReference
                                                                      ?.id,
                                                              userName:
                                                                  currentUserDisplayName,
                                                              userSeatNo:
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.seatNo,
                                                                      0),
                                                              userSpot:
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.spot,
                                                                      ''),
                                                            ),
                                                            clearUnsetFields:
                                                                false,
                                                            create: true,
                                                          ),
                                                          dailyStarting:
                                                              updateDailyStartingStruct(
                                                            FFAppState()
                                                                .pageStateSchemaVariable
                                                                .dailyStartPara,
                                                            clearUnsetFields:
                                                                false,
                                                            create: true,
                                                          ),
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'inputList':
                                                                getPlannerInputListFirestoreData(
                                                              FFAppState()
                                                                  .pageStateSchemaVariable
                                                                  .inputListState,
                                                            ),
                                                          },
                                                        ),
                                                      });
                                                    }
                                                  }
                                                  FFAppState()
                                                          .plannerDateSelected =
                                                      functions.subtractminusoneday(
                                                          FFAppState()
                                                              .plannerDateSelected!);
                                                  FFAppState().update(() {});
                                                  if (animationsMap[
                                                          'rowOnActionTriggerAnimation'] !=
                                                      null) {
                                                    animationsMap[
                                                            'rowOnActionTriggerAnimation']!
                                                        .controller
                                                        .forward(from: 0.0);
                                                  }
                                                  _model.loadedInfoCopyCopy =
                                                      await queryPlannerVariableListRecordOnce(
                                                    parent:
                                                        currentUserReference,
                                                    queryBuilder:
                                                        (plannerVariableListRecord) =>
                                                            plannerVariableListRecord
                                                                .where(
                                                                  'submittedDate',
                                                                  isGreaterThan:
                                                                      functions.subtractminusTenSeconds(
                                                                          FFAppState()
                                                                              .plannerDateSelected!),
                                                                )
                                                                .where(
                                                                  'submittedDate',
                                                                  isLessThanOrEqualTo:
                                                                      functions.addTenSecond(
                                                                          FFAppState()
                                                                              .plannerDateSelected!),
                                                                ),
                                                    singleRecord: true,
                                                  ).then((s) => s.firstOrNull);
                                                  if (_model
                                                          .loadedInfoCopyCopy !=
                                                      null) {
                                                    FFAppState()
                                                            .pageStateSchemaVariable =
                                                        PageStateSchemaStruct(
                                                      inputListState: _model
                                                          .loadedInfoCopyCopy
                                                          ?.inputList,
                                                      submittedDatePlanner:
                                                          _model
                                                              .loadedInfoCopyCopy
                                                              ?.submittedDate,
                                                      goodThingsPlanner: _model
                                                          .loadedInfoCopyCopy
                                                          ?.goodThings,
                                                      imporovementState: _model
                                                          .loadedInfoCopyCopy
                                                          ?.improvement,
                                                      archivePercentState: _model
                                                          .loadedInfoCopyCopy
                                                          ?.achivementPercentage,
                                                      teacherquoteState: _model
                                                          .loadedInfoCopyCopy
                                                          ?.teachersQuote,
                                                      isSubmittedPara: _model
                                                          .loadedInfoCopyCopy
                                                          ?.plannerSubmitted,
                                                      adminCheckedPara: _model
                                                          .loadedInfoCopyCopy
                                                          ?.adminChecked,
                                                      dailyStartPara: _model
                                                          .loadedInfoCopyCopy
                                                          ?.dailyStarting,
                                                    );
                                                    FFAppState().update(() {});
                                                    safeSetState(() {
                                                      _model.textController
                                                          ?.clear();
                                                    });
                                                    await Future.wait([
                                                      Future(() async {
                                                        safeSetState(() {
                                                          _model.textController
                                                                  ?.text =
                                                              FFAppState()
                                                                  .pageStateSchemaVariable
                                                                  .goodThingsPlanner;
                                                        });
                                                      }),
                                                    ]);
                                                  } else {
                                                    FFAppState()
                                                        .deletePageStateSchemaVariable();
                                                    FFAppState()
                                                            .pageStateSchemaVariable =
                                                        PageStateSchemaStruct
                                                            .fromSerializableMap(
                                                                jsonDecode(
                                                                    '{\"inputListState\":\"[]\",\"submittedDatePlanner\":\"1735657200000\",\"dailyStartPara\":\"{\\\"CommentOfDay\\\":\\\" \\\"}\",\"basicInfoState\":\"{\\\"uid\\\":\\\"\\\"}\"}'));

                                                    FFAppState().update(() {});
                                                    safeSetState(() {
                                                      _model.textController
                                                          ?.clear();
                                                    });
                                                  }

                                                  FFAppState().changeChecker =
                                                      FFAppState()
                                                          .pageStateSchemaVariable;
                                                  FFAppState().update(() {});
                                                }

                                                FFAppState().isloading = false;
                                                FFAppState().update(() {});
                                              }
                                            }

                                            safeSetState(() {});
                                          },
                                          onVerticalDragStart: (details) async {
                                            _model.localxStart =
                                                details.globalPosition.dx;
                                            safeSetState(() {});
                                          },
                                          child: SafeArea(
                                            child: Container(
                                              width: double.infinity,
                                              height: 60.0,
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
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 0.0, 20.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          Text(
                                                        currentUserDisplayName,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                              fontSize: 20.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumIsCustom,
                                                            ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 100.0,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.asset(
                                                              'assets/images/left.gif',
                                                              width: 200.0,
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 100.0,
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xD1FFFFFF),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
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
                                                                  var _shouldSetState =
                                                                      false;
                                                                  FFAppState()
                                                                      .updatePageStateSchemaVariableStruct(
                                                                    (e) => e
                                                                      ..goodThingsPlanner = _model
                                                                          .textController
                                                                          .text
                                                                      ..submittedDatePlanner =
                                                                          FFAppState()
                                                                              .plannerDateSelected,
                                                                  );
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  if (valueOrDefault<
                                                                          bool>(
                                                                        FFAppState().pageStateSchemaVariable.inputListState.length >=
                                                                            1,
                                                                        false,
                                                                      ) ||
                                                                      valueOrDefault<
                                                                          bool>(
                                                                        FFAppState().pageStateSchemaVariable.goodThingsPlanner !=
                                                                                '',
                                                                        false,
                                                                      ) ||
                                                                      valueOrDefault<
                                                                          bool>(
                                                                        FFAppState().pageStateSchemaVariable.imporovementState !=
                                                                                '',
                                                                        false,
                                                                      ) ||
                                                                      (FFAppState()
                                                                              .pageStateSchemaVariable
                                                                              .dailyStartPara
                                                                              .sleepTime !=
                                                                          null) ||
                                                                      (FFAppState()
                                                                              .pageStateSchemaVariable
                                                                              .dailyStartPara
                                                                              .getupTime !=
                                                                          null) ||
                                                                      (FFAppState().pageStateSchemaVariable.dailyStartPara.goalTime !=
                                                                              '') ||
                                                                      (FFAppState().pageStateSchemaVariable.dailyStartPara.commentOfDay !=
                                                                              '')) {
                                                                    _model.queryToday3 =
                                                                        await queryPlannerVariableListRecordOnce(
                                                                      parent:
                                                                          currentUserReference,
                                                                      queryBuilder: (plannerVariableListRecord) => plannerVariableListRecord
                                                                          .where(
                                                                            'submittedDate',
                                                                            isGreaterThan:
                                                                                functions.subtractminusTenSeconds(FFAppState().plannerDateSelected!),
                                                                          )
                                                                          .where(
                                                                            'submittedDate',
                                                                            isLessThan:
                                                                                functions.addTenSecond(FFAppState().plannerDateSelected!),
                                                                          ),
                                                                      singleRecord:
                                                                          true,
                                                                    ).then((s) =>
                                                                            s.firstOrNull);
                                                                    _shouldSetState =
                                                                        true;
                                                                    if (_model
                                                                            .queryToday3 !=
                                                                        null) {
                                                                      await _model
                                                                          .queryToday3!
                                                                          .reference
                                                                          .update({
                                                                        ...createPlannerVariableListRecordData(
                                                                          goodThings: FFAppState()
                                                                              .pageStateSchemaVariable
                                                                              .goodThingsPlanner,
                                                                          improvement: FFAppState()
                                                                              .pageStateSchemaVariable
                                                                              .imporovementState,
                                                                          achivementPercentage: FFAppState()
                                                                              .pageStateSchemaVariable
                                                                              .archivePercentState,
                                                                          dailyStarting:
                                                                              updateDailyStartingStruct(
                                                                            FFAppState().pageStateSchemaVariable.dailyStartPara,
                                                                            clearUnsetFields:
                                                                                false,
                                                                          ),
                                                                        ),
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'inputList':
                                                                                getPlannerInputListFirestoreData(
                                                                              FFAppState().pageStateSchemaVariable.inputListState,
                                                                            ),
                                                                          },
                                                                        ),
                                                                      });
                                                                    } else {
                                                                      await PlannerVariableListRecord.createDoc(
                                                                              currentUserReference!)
                                                                          .set({
                                                                        ...createPlannerVariableListRecordData(
                                                                          adminChecked:
                                                                              false,
                                                                          goodThings: FFAppState()
                                                                              .pageStateSchemaVariable
                                                                              .goodThingsPlanner,
                                                                          improvement: FFAppState()
                                                                              .pageStateSchemaVariable
                                                                              .imporovementState,
                                                                          achivementPercentage:
                                                                              valueOrDefault<double>(
                                                                            FFAppState().pageStateSchemaVariable.archivePercentState,
                                                                            0.0,
                                                                          ),
                                                                          submittedDate:
                                                                              FFAppState().plannerDateSelected,
                                                                          plannerSubmitted:
                                                                              false,
                                                                          basicInfo:
                                                                              updateBasicUserInfoStruct(
                                                                            BasicUserInfoStruct(
                                                                              uid: currentUserReference?.id,
                                                                              userName: currentUserDisplayName,
                                                                              userSeatNo: valueOrDefault(currentUserDocument?.seatNo, 0),
                                                                              userSpot: valueOrDefault(currentUserDocument?.spot, ''),
                                                                            ),
                                                                            clearUnsetFields:
                                                                                false,
                                                                            create:
                                                                                true,
                                                                          ),
                                                                          dailyStarting:
                                                                              updateDailyStartingStruct(
                                                                            FFAppState().pageStateSchemaVariable.dailyStartPara,
                                                                            clearUnsetFields:
                                                                                false,
                                                                            create:
                                                                                true,
                                                                          ),
                                                                        ),
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'inputList':
                                                                                getPlannerInputListFirestoreData(
                                                                              FFAppState().pageStateSchemaVariable.inputListState,
                                                                            ),
                                                                          },
                                                                        ),
                                                                      });
                                                                    }
                                                                  }
                                                                  final _datePickedDate =
                                                                      await showDatePicker(
                                                                    context:
                                                                        context,
                                                                    barrierDismissible:
                                                                        false,
                                                                    initialDate:
                                                                        functions
                                                                            .getDateAtMidnight(getCurrentTimestamp),
                                                                    firstDate:
                                                                        DateTime(
                                                                            1900),
                                                                    lastDate:
                                                                        DateTime(
                                                                            2050),
                                                                    builder:
                                                                        (context,
                                                                            child) {
                                                                      return wrapInMaterialDatePickerTheme(
                                                                        context,
                                                                        child!,
                                                                        headerBackgroundColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        headerForegroundColor:
                                                                            FlutterFlowTheme.of(context).info,
                                                                        headerTextStyle: FlutterFlowTheme.of(context)
                                                                            .headlineLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                              fontSize: 32.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).headlineLargeIsCustom,
                                                                            ),
                                                                        pickerBackgroundColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        pickerForegroundColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        selectedDateTimeBackgroundColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        selectedDateTimeForegroundColor:
                                                                            FlutterFlowTheme.of(context).info,
                                                                        actionButtonForegroundColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                        iconSize:
                                                                            24.0,
                                                                      );
                                                                    },
                                                                  );

                                                                  if (_datePickedDate !=
                                                                      null) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.datePicked =
                                                                          DateTime(
                                                                        _datePickedDate
                                                                            .year,
                                                                        _datePickedDate
                                                                            .month,
                                                                        _datePickedDate
                                                                            .day,
                                                                      );
                                                                    });
                                                                  } else if (_model
                                                                          .datePicked !=
                                                                      null) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.datePicked =
                                                                          functions
                                                                              .getDateAtMidnight(getCurrentTimestamp);
                                                                    });
                                                                  }
                                                                  if (_model
                                                                          .datePicked ==
                                                                      null) {
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }

                                                                  FFAppState()
                                                                          .plannerDateSelected =
                                                                      _model
                                                                          .datePicked;
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  FFAppState()
                                                                          .dateselectSafety =
                                                                      FFAppState()
                                                                          .plannerDateSelected;
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  if (animationsMap[
                                                                          'rowOnActionTriggerAnimation'] !=
                                                                      null) {
                                                                    animationsMap[
                                                                            'rowOnActionTriggerAnimation']!
                                                                        .controller
                                                                        .forward(
                                                                            from:
                                                                                0.0);
                                                                  }
                                                                  if (FFAppState()
                                                                          .insideDBStudent
                                                                          .where((e) =>
                                                                              e.submittedDatePlanner ==
                                                                              FFAppState().plannerDateSelected)
                                                                          .toList()
                                                                          .length >
                                                                      999999) {
                                                                    FFAppState().pageStateSchemaVariable = FFAppState().insideDBStudent.elementAtOrNull(functions.getIndexFunction(
                                                                        FFAppState()
                                                                            .insideDBStudent
                                                                            .toList(),
                                                                        FFAppState()
                                                                            .plannerDateSelected!))!;
                                                                    safeSetState(
                                                                        () {});
                                                                    await Future
                                                                        .wait([
                                                                      Future(
                                                                          () async {
                                                                        safeSetState(
                                                                            () {
                                                                          _model
                                                                              .textController
                                                                              ?.text = FFAppState().pageStateSchemaVariable.goodThingsPlanner;
                                                                        });
                                                                      }),
                                                                    ]);
                                                                  } else {
                                                                    _model.loadedInfo =
                                                                        await queryPlannerVariableListRecordOnce(
                                                                      parent:
                                                                          currentUserReference,
                                                                      queryBuilder: (plannerVariableListRecord) => plannerVariableListRecord
                                                                          .where(
                                                                            'submittedDate',
                                                                            isGreaterThan:
                                                                                functions.subtractminusTenSeconds(FFAppState().plannerDateSelected!),
                                                                          )
                                                                          .where(
                                                                            'submittedDate',
                                                                            isLessThan:
                                                                                functions.addTenSecond(FFAppState().plannerDateSelected!),
                                                                          ),
                                                                      singleRecord:
                                                                          true,
                                                                    ).then((s) =>
                                                                            s.firstOrNull);
                                                                    _shouldSetState =
                                                                        true;
                                                                    if (_model
                                                                            .loadedInfo !=
                                                                        null) {
                                                                      FFAppState()
                                                                              .pageStateSchemaVariable =
                                                                          PageStateSchemaStruct(
                                                                        inputListState: _model
                                                                            .loadedInfo
                                                                            ?.inputList,
                                                                        submittedDatePlanner: _model
                                                                            .loadedInfo
                                                                            ?.submittedDate,
                                                                        goodThingsPlanner: _model
                                                                            .loadedInfo
                                                                            ?.goodThings,
                                                                        imporovementState: _model
                                                                            .loadedInfo
                                                                            ?.improvement,
                                                                        archivePercentState: _model
                                                                            .loadedInfo
                                                                            ?.achivementPercentage,
                                                                        teacherquoteState: _model
                                                                            .loadedInfo
                                                                            ?.teachersQuote,
                                                                        isSubmittedPara: _model
                                                                            .loadedInfo
                                                                            ?.plannerSubmitted,
                                                                        adminCheckedPara: _model
                                                                            .loadedInfo
                                                                            ?.adminChecked,
                                                                        dailyStartPara: _model
                                                                            .loadedInfo
                                                                            ?.dailyStarting,
                                                                      );
                                                                      FFAppState()
                                                                          .update(
                                                                              () {});
                                                                      safeSetState(
                                                                          () {
                                                                        _model
                                                                            .textController
                                                                            ?.clear();
                                                                      });
                                                                      await Future
                                                                          .wait([
                                                                        Future(
                                                                            () async {
                                                                          safeSetState(
                                                                              () {
                                                                            _model.textController?.text =
                                                                                FFAppState().pageStateSchemaVariable.goodThingsPlanner;
                                                                          });
                                                                        }),
                                                                      ]);
                                                                    } else {
                                                                      FFAppState()
                                                                          .deletePageStateSchemaVariable();
                                                                      FFAppState()
                                                                              .pageStateSchemaVariable =
                                                                          PageStateSchemaStruct.fromSerializableMap(
                                                                              jsonDecode('{\"inputListState\":\"[]\",\"submittedDatePlanner\":\"1735657200000\",\"dailyStartPara\":\"{\\\"CommentOfDay\\\":\\\" \\\"}\",\"basicInfoState\":\"{\\\"uid\\\":\\\"\\\"}\"}'));

                                                                      FFAppState()
                                                                          .update(
                                                                              () {});
                                                                      safeSetState(
                                                                          () {
                                                                        _model
                                                                            .textController
                                                                            ?.clear();
                                                                      });
                                                                    }
                                                                  }

                                                                  FFAppState()
                                                                          .changeChecker =
                                                                      FFAppState()
                                                                          .pageStateSchemaVariable;
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .calendar_today,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 40.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              dateTimeFormat(
                                                                "yyyy\'년 \'M\'월 \'d\'일\'",
                                                                FFAppState()
                                                                    .plannerDateSelected,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              '오늘의 날짜를 선택하세요',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      30.0,
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
                                                          SizedBox(width: 5.0)),
                                                    ),
                                                    Container(
                                                      width: 100.0,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Stack(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/right.gif',
                                                                width: 200.0,
                                                                height: 200.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 100.0,
                                                              height: 100.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xD1FFFFFF),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      functions.calculateTotalStudyTime(
                                                          FFAppState()
                                                              .pageStateSchemaVariable
                                                              .inputListState
                                                              .toList()),
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
                                if (_model.focusIsSet != true)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 15.0, 0.0, 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 15,
                                          child: Container(
                                            width: 100.0,
                                            height: 512.0,
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
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
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
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(15.0),
                                                      topRight:
                                                          Radius.circular(15.0),
                                                    ),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'rnhw2tjz' /* TO DO LIST */,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            color: Colors.white,
                                                            fontSize: 18.0,
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
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'v23o1msf' /* STUDY PLAN */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
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
                                                                -0.95, 0.0),
                                                        child: Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '0l4ewjpy' /* SUB */,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
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
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      height: 443.0,
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, -1.0),
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 5,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 50,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 3,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 5,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 50,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 3,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 5,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 50,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 3,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 5,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 50,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 3,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 5,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 50,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 3,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 5,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 50,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 3,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 5,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 50,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 3,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 5,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 50,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 3,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 5,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 50,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 3,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 5,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(0.0),
                                                                          topRight:
                                                                              Radius.circular(0.0),
                                                                        ),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 50,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 3,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(0.0),
                                                                          topRight:
                                                                              Radius.circular(0.0),
                                                                        ),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 5,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(20.0),
                                                                          bottomRight:
                                                                              Radius.circular(0.0),
                                                                          topLeft:
                                                                              Radius.circular(0.0),
                                                                          topRight:
                                                                              Radius.circular(0.0),
                                                                        ),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 50,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 3,
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(0.0),
                                                                          bottomRight:
                                                                              Radius.circular(20.0),
                                                                          topLeft:
                                                                              Radius.circular(0.0),
                                                                          topRight:
                                                                              Radius.circular(0.0),
                                                                        ),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            height: 443.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final plannerinputchildLoad =
                                                                    FFAppState()
                                                                        .pageStateSchemaVariable
                                                                        .inputListState
                                                                        .toList()
                                                                        .take(
                                                                            20)
                                                                        .toList();

                                                                return ListView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      plannerinputchildLoad
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          plannerinputchildLoadIndex) {
                                                                    final plannerinputchildLoadItem =
                                                                        plannerinputchildLoad[
                                                                            plannerinputchildLoadIndex];
                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              5,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                40.0,
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              minWidth: 30.0,
                                                                              minHeight: 20.0,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: AutoSizeText(
                                                                                plannerinputchildLoadItem.subjectNamePlanner.maybeHandleOverflow(
                                                                                  maxChars: 5,
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                                minFontSize: 8.0,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              50,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                40.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      plannerinputchildLoadItem.whatIDid,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            fontSize: 15.0,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                      child: Icon(
                                                                                        Icons.circle_rounded,
                                                                                        color: plannerinputchildLoadItem.pickedColor,
                                                                                        size: 30.0,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                if (plannerinputchildLoadItem.hasStudyEndTime())
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                      child: Text(
                                                                                        functions.calculateStudyTime(plannerinputchildLoadItem.studyStartTime.toList(), plannerinputchildLoadItem.studyEndTime.toList()),
                                                                                        textAlign: TextAlign.center,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              fontSize: 15.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (FFAppState().pageStateSchemaVariable.isSubmittedPara != true)
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(1.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 7.0, 0.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          if (!((functions.getDateAtMidnight(functions.subtractminusThreeHours(getCurrentTimestamp)) > functions.subtractminusTenSeconds(FFAppState().plannerDateSelected!)) && (functions.getDateAtMidnight(functions.subtractminusThreeHours(getCurrentTimestamp)) < functions.addTenSecond(FFAppState().plannerDateSelected!)))) {
                                                                                            await showDialog(
                                                                                              context: context,
                                                                                              builder: (alertDialogContext) {
                                                                                                return AlertDialog(
                                                                                                  title: Text('날짜오류'),
                                                                                                  content: Text('오늘날짜의 플래너를 선택해주세요'),
                                                                                                  actions: [
                                                                                                    TextButton(
                                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                      child: Text('Ok'),
                                                                                                    ),
                                                                                                  ],
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                            return;
                                                                                          }
                                                                                          FFAppState().updateCrashBackupDataStruct(
                                                                                            (e) => e
                                                                                              ..subNameBackup = plannerinputchildLoadItem.subjectNamePlanner
                                                                                              ..studiedDetailedBackup = plannerinputchildLoadItem.whatIDid
                                                                                              ..indexIDBackup = plannerinputchildLoadIndex,
                                                                                          );

                                                                                          context.goNamed(
                                                                                            TimerPageWidget.routeName,
                                                                                            queryParameters: {
                                                                                              'subNameParameter': serializeParam(
                                                                                                plannerinputchildLoadItem.subjectNamePlanner,
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'studiedDetailsParameter': serializeParam(
                                                                                                plannerinputchildLoadItem.whatIDid,
                                                                                                ParamType.String,
                                                                                              ),
                                                                                              'indexIDParameter': serializeParam(
                                                                                                plannerinputchildLoadIndex,
                                                                                                ParamType.int,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                          );
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.play_circle,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 30.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (FFAppState().pageStateSchemaVariable.isSubmittedPara != true)
                                                                                  Builder(
                                                                                    builder: (context) => Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          await showDialog(
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
                                                                                                  child: PlannerFixWidget(
                                                                                                    listNo: valueOrDefault<int>(
                                                                                                      plannerinputchildLoadIndex,
                                                                                                      0,
                                                                                                    ),
                                                                                                    subNamePassToFix: valueOrDefault<String>(
                                                                                                      plannerinputchildLoadItem.subjectNamePlanner,
                                                                                                      'null',
                                                                                                    ),
                                                                                                    objectPassToFix: valueOrDefault<String>(
                                                                                                      plannerinputchildLoadItem.whatIDid,
                                                                                                      'null',
                                                                                                    ),
                                                                                                    colorToFix: valueOrDefault<Color>(
                                                                                                      plannerinputchildLoadItem.pickedColor,
                                                                                                      Colors.black,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                        child: Icon(
                                                                                          Icons.settings_sharp,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 30.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            if (FFAppState().pageStateSchemaVariable.isSubmittedPara) {
                                                                              return;
                                                                            }
                                                                            if (plannerinputchildLoadItem.isdone ==
                                                                                'done') {
                                                                              FFAppState().updatePageStateSchemaVariableStruct(
                                                                                (e) => e
                                                                                  ..updateInputListState(
                                                                                    (e) => e[plannerinputchildLoadIndex]..isdone = 'notyet',
                                                                                  ),
                                                                              );
                                                                              safeSetState(() {});
                                                                            } else if (plannerinputchildLoadItem.isdone ==
                                                                                'notyet') {
                                                                              FFAppState().updatePageStateSchemaVariableStruct(
                                                                                (e) => e
                                                                                  ..updateInputListState(
                                                                                    (e) => e[plannerinputchildLoadIndex]..isdone = 'unfinish',
                                                                                  ),
                                                                              );
                                                                              safeSetState(() {});
                                                                            } else {
                                                                              FFAppState().updatePageStateSchemaVariableStruct(
                                                                                (e) => e
                                                                                  ..updateInputListState(
                                                                                    (e) => e[plannerinputchildLoadIndex]..isdone = 'done',
                                                                                  ),
                                                                              );
                                                                              safeSetState(() {});
                                                                            }
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                40.0,
                                                                            height:
                                                                                40.0,
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              minWidth: 20.0,
                                                                              minHeight: 20.0,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  if (plannerinputchildLoadItem.isdone == 'done') {
                                                                                    return Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Icon(
                                                                                        Icons.circle_outlined,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    );
                                                                                  } else if (plannerinputchildLoadItem.isdone == 'notyet') {
                                                                                    return Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Icon(
                                                                                        Icons.change_history,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    );
                                                                                  } else if (plannerinputchildLoadItem.isdone == 'unfinish') {
                                                                                    return Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: FaIcon(
                                                                                        FontAwesomeIcons.times,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                    );
                                                                                  } else {
                                                                                    return Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          FFAppState().updatePageStateSchemaVariableStruct(
                                                                                            (e) => e
                                                                                              ..updateInputListState(
                                                                                                (e) => e[plannerinputchildLoadIndex]..isdone = 'done',
                                                                                              ),
                                                                                          );
                                                                                          safeSetState(() {});
                                                                                        },
                                                                                        child: Container(
                                                                                          width: 38.0,
                                                                                          height: 38.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.ads_click_outlined,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '0hi9xmog' /* click! */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
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
                                            height: 513.0,
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
                                                    Radius.circular(10.0),
                                                bottomRight:
                                                    Radius.circular(10.0),
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
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(10.0),
                                                      topRight:
                                                          Radius.circular(10.0),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 30.0,
                                                        height: 10.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                      ),
                                                      Expanded(
                                                        flex: 3,
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'p8qs7y62' /* TimeTable */,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Builder(
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
                                                                            Container(
                                                                          height:
                                                                              350.0,
                                                                          width:
                                                                              500.0,
                                                                          child:
                                                                              PlannerTimeOptionBottomSheetWidget(
                                                                            starttime:
                                                                                FFAppState().PlannerStartTime,
                                                                            endtime:
                                                                                FFAppState().PlannerEndTime,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .settings_sharp,
                                                                color: Colors
                                                                    .white,
                                                                size: 22.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (FFAppState()
                                                        .PlannerStartTime <=
                                                    5)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                                '7lv7ybg6' /* 5 */,
                                                              ),
                                                              minFontSize: 10.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                if (FFAppState()
                                                        .PlannerStartTime <=
                                                    6)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                                '09esbp58' /* 6 */,
                                                              ),
                                                              minFontSize: 10.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                if (FFAppState()
                                                        .PlannerStartTime <=
                                                    7)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                                'wvut6nhm' /* 7 */,
                                                              ),
                                                              minFontSize: 10.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                if (FFAppState()
                                                        .PlannerStartTime <=
                                                    8)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                                '1kc8ga7d' /* 8 */,
                                                              ),
                                                              minFontSize: 10.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                              'qaj4uocp' /* 9 */,
                                                            ),
                                                            minFontSize: 10.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell091',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell092',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell093',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell094',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell095',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell096',
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                              'm437mwys' /* 10 */,
                                                            ),
                                                            minFontSize: 10.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell101',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell102',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell103',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell104',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell105',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell106',
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                              'i0f3j9x7' /* 11 */,
                                                            ),
                                                            minFontSize: 10.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell111',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell112',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell113',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell114',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell115',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell116',
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                              '9oxtcuoz' /* 12 */,
                                                            ),
                                                            minFontSize: 10.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell121',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell122',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell123',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell124',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell125',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell126',
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                              'b0udfzo8' /* 13 */,
                                                            ),
                                                            minFontSize: 10.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell131',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell132',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell133',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell134',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell135',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell136',
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                              'bvsoktuz' /* 14 */,
                                                            ),
                                                            minFontSize: 10.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell141',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell142',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell143',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell144',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell145',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell146',
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                              'vbanbl5d' /* 15 */,
                                                            ),
                                                            minFontSize: 10.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell151',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell152',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell153',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell154',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell155',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell156',
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                              'fjrw3dgd' /* 16 */,
                                                            ),
                                                            minFontSize: 10.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell161',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell162',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell163',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell164',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell165',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell166',
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                              'y5z9alkb' /* 17 */,
                                                            ),
                                                            minFontSize: 10.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell171',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell172',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell173',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell174',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell175',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell176',
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                              '056dfs2h' /* 18 */,
                                                            ),
                                                            minFontSize: 10.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell181',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell182',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell183',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell184',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell185',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell186',
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                              '6yjwdhib' /* 19 */,
                                                            ),
                                                            minFontSize: 10.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell191',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell192',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell193',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell194',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell195',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell196',
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                              'r76pvops' /* 20 */,
                                                            ),
                                                            minFontSize: 10.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell201',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell202',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell203',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell204',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell205',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell206',
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                              'v8go3tpw' /* 21 */,
                                                            ),
                                                            minFontSize: 10.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell211',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell212',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell213',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell214',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell215',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell216',
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
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    valueOrDefault<
                                                                        double>(
                                                              FFAppState().PlannerEndTime ==
                                                                      22
                                                                  ? 10.0
                                                                  : 0.0,
                                                              0.0,
                                                            )),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
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
                                                              'esm3izmk' /* 22 */,
                                                            ),
                                                            minFontSize: 10.0,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell221',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell222',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell223',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell224',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell225',
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            functions.getCellColorFromInputListState(
                                                                'cell226',
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
                                                                Radius.circular(
                                                                    0.0),
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
                                                                Radius.circular(
                                                                    0.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
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
                                                if (FFAppState()
                                                        .PlannerEndTime >=
                                                    23)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
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
                                                                      valueOrDefault<
                                                                          double>(
                                                                FFAppState().PlannerEndTime ==
                                                                        23
                                                                    ? 10.0
                                                                    : 0.0,
                                                                0.0,
                                                              )),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          0.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
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
                                                                'ygmi6gxp' /* 23 */,
                                                              ),
                                                              minFontSize: 10.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
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
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      valueOrDefault<
                                                                          double>(
                                                                FFAppState().PlannerEndTime ==
                                                                        23
                                                                    ? 10.0
                                                                    : 0.0,
                                                                0.0,
                                                              )),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
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
                                                if (FFAppState()
                                                        .PlannerEndTime >=
                                                    24)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
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
                                                                      valueOrDefault<
                                                                          double>(
                                                                FFAppState().PlannerEndTime ==
                                                                        24
                                                                    ? 10.0
                                                                    : 0.0,
                                                                0.0,
                                                              )),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          0.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
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
                                                                'ubo4flsd' /* 24 */,
                                                              ),
                                                              minFontSize: 10.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell241',
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell242',
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell243',
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell244',
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell245',
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell246',
                                                                  FFAppState()
                                                                      .pageStateSchemaVariable
                                                                      .inputListState
                                                                      .toList()),
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryBackground,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      valueOrDefault<
                                                                          double>(
                                                                FFAppState().PlannerEndTime ==
                                                                        24
                                                                    ? 10.0
                                                                    : 0.0,
                                                                0.0,
                                                              )),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
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
                                                if (FFAppState()
                                                        .PlannerEndTime >=
                                                    25)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
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
                                                                      valueOrDefault<
                                                                          double>(
                                                                FFAppState().PlannerEndTime ==
                                                                        25
                                                                    ? 10.0
                                                                    : 0.0,
                                                                0.0,
                                                              )),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          0.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
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
                                                                'sq7291r8' /* 1 */,
                                                              ),
                                                              minFontSize: 10.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell251',
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell252',
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell253',
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell254',
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell255',
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell256',
                                                                  FFAppState()
                                                                      .pageStateSchemaVariable
                                                                      .inputListState
                                                                      .toList()),
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryBackground,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      valueOrDefault<
                                                                          double>(
                                                                FFAppState().PlannerEndTime ==
                                                                        25
                                                                    ? 10.0
                                                                    : 0.0,
                                                                0.0,
                                                              )),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
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
                                                if (FFAppState()
                                                        .PlannerEndTime >=
                                                    26)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
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
                                                                      valueOrDefault<
                                                                          double>(
                                                                FFAppState().PlannerEndTime ==
                                                                        26
                                                                    ? 10.0
                                                                    : 0.0,
                                                                0.0,
                                                              )),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          0.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
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
                                                                'vrjih96j' /* 2 */,
                                                              ),
                                                              minFontSize: 10.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell021',
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell022',
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell023',
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell024',
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell025',
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell026',
                                                                  FFAppState()
                                                                      .pageStateSchemaVariable
                                                                      .inputListState
                                                                      .toList()),
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryBackground,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      valueOrDefault<
                                                                          double>(
                                                                FFAppState().PlannerEndTime ==
                                                                        26
                                                                    ? 10.0
                                                                    : 0.0,
                                                                0.0,
                                                              )),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
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
                                                if (FFAppState()
                                                        .PlannerEndTime >=
                                                    27)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
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
                                                                      valueOrDefault<
                                                                          double>(
                                                                FFAppState().PlannerEndTime ==
                                                                        27
                                                                    ? 10.0
                                                                    : 0.0,
                                                                0.0,
                                                              )),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          0.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
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
                                                                'b5k930ju' /* 3 */,
                                                              ),
                                                              minFontSize: 10.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell031',
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell032',
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell033',
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell034',
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell035',
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell036',
                                                                  FFAppState()
                                                                      .pageStateSchemaVariable
                                                                      .inputListState
                                                                      .toList()),
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryBackground,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      valueOrDefault<
                                                                          double>(
                                                                FFAppState().PlannerEndTime ==
                                                                        27
                                                                    ? 10.0
                                                                    : 0.0,
                                                                0.0,
                                                              )),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
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
                                                if (FFAppState()
                                                        .PlannerEndTime >=
                                                    28)
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
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
                                                                      valueOrDefault<
                                                                          double>(
                                                                FFAppState().PlannerEndTime ==
                                                                        28
                                                                    ? 10.0
                                                                    : 0.0,
                                                                0.0,
                                                              )),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          0.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
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
                                                                'yamsvc8f' /* 4 */,
                                                              ),
                                                              minFontSize: 10.0,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell041',
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell042',
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell043',
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell044',
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell045',
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
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              functions.getCellColorFromInputListState(
                                                                  'cell046',
                                                                  FFAppState()
                                                                      .pageStateSchemaVariable
                                                                      .inputListState
                                                                      .toList()),
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryBackground,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomRight: Radius
                                                                  .circular(
                                                                      valueOrDefault<
                                                                          double>(
                                                                FFAppState().PlannerEndTime ==
                                                                        28
                                                                    ? 10.0
                                                                    : 0.0,
                                                                0.0,
                                                              )),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
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
                                      ],
                                    ),
                                  ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              flex: FFAppState()
                                                          .pageStateSchemaVariable
                                                          .isSubmittedPara ==
                                                      true
                                                  ? 5
                                                  : 10,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 5.0, 0.0),
                                                child: SafeArea(
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                20.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                20.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                20.0),
                                                        topRight:
                                                            Radius.circular(
                                                                20.0),
                                                      ),
                                                      border: Border.all(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          if (FFAppState()
                                                                  .pageStateSchemaVariable
                                                                  .isSubmittedPara ==
                                                              true) {
                                                            return Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Container(
                                                                width: 400.0,
                                                                height: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            5.0,
                                                                            20.0,
                                                                            5.0),
                                                                    child: Text(
                                                                      FFAppState()
                                                                          .pageStateSchemaVariable
                                                                          .goodThingsPlanner,
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
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          } else {
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          18.0,
                                                                          0.0,
                                                                          18.0,
                                                                          0.0),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .textController,
                                                                focusNode: _model
                                                                    .textFieldFocusNode,
                                                                autofocus:
                                                                    false,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .done,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'ioc3p4ch' /* Memo */,
                                                                  ),
                                                                  labelStyle: FlutterFlowTheme.of(
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
                                                                  hintStyle: FlutterFlowTheme.of(
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
                                                                      InputBorder
                                                                          .none,
                                                                  focusedBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  errorBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  focusedErrorBorder:
                                                                      InputBorder
                                                                          .none,
                                                                  contentPadding:
                                                                      EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          5.0,
                                                                          2.0),
                                                                ),
                                                                style: FlutterFlowTheme.of(
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
                                                                maxLines: 5,
                                                                minLines: 1,
                                                                validator: _model
                                                                    .textControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 5.0, 0.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    var _shouldSetState = false;
                                                    if (FFAppState()
                                                            .pageStateSchemaVariable
                                                            .isSubmittedPara ==
                                                        true) {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            content: Text(
                                                                '플래너가 이미 제출되었습니다.'),
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
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    } else {
                                                      var confirmDialogResponse =
                                                          await showDialog<
                                                                  bool>(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (alertDialogContext) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        '플래너 제출하기'),
                                                                    content: Text(
                                                                        '플래너를 제출하시겠습니까? 제출된 플래너는 추가 기록 및 수정이 불가합니다'),
                                                                    actions: [
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            false),
                                                                        child: Text(
                                                                            '취소'),
                                                                      ),
                                                                      TextButton(
                                                                        onPressed: () => Navigator.pop(
                                                                            alertDialogContext,
                                                                            true),
                                                                        child: Text(
                                                                            '제출하기'),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              ) ??
                                                              false;
                                                      if (confirmDialogResponse) {
                                                        FFAppState()
                                                            .updatePageStateSchemaVariableStruct(
                                                          (e) => e
                                                            ..goodThingsPlanner =
                                                                _model
                                                                    .textController
                                                                    .text
                                                            ..isSubmittedPara =
                                                                true
                                                            ..timetableStartIndex =
                                                                FFAppState()
                                                                    .PlannerStartTime
                                                            ..timetableEndIndex =
                                                                FFAppState()
                                                                    .PlannerEndTime
                                                            ..updateDailyStartPara(
                                                              (e) => e
                                                                ..pointget =
                                                                    valueOrDefault<
                                                                        int>(
                                                                  functions.calculatePointDay(
                                                                      FFAppState()
                                                                          .pageStateSchemaVariable),
                                                                  0,
                                                                ),
                                                            ),
                                                        );
                                                        FFAppState()
                                                            .update(() {});
                                                        _model.quuerytoupdate =
                                                            await queryPlannerVariableListRecordOnce(
                                                          parent:
                                                              currentUserReference,
                                                          queryBuilder:
                                                              (plannerVariableListRecord) =>
                                                                  plannerVariableListRecord
                                                                      .where(
                                                            'submittedDate',
                                                            isEqualTo: FFAppState()
                                                                .plannerDateSelected,
                                                          ),
                                                          singleRecord: true,
                                                        ).then((s) =>
                                                                s.firstOrNull);
                                                        _shouldSetState = true;
                                                        if (_model
                                                                .quuerytoupdate
                                                                ?.adminChecked ==
                                                            true) {
                                                          FFAppState()
                                                              .updatePageStateSchemaVariableStruct(
                                                            (e) => e
                                                              ..teacherquoteState = _model
                                                                  .quuerytoupdate
                                                                  ?.teachersQuote,
                                                          );
                                                          FFAppState()
                                                              .update(() {});
                                                        }
                                                        if ((_model.quuerytoupdate !=
                                                                null) ==
                                                            true) {
                                                          await _model
                                                              .quuerytoupdate!
                                                              .reference
                                                              .update({
                                                            ...createPlannerVariableListRecordData(
                                                              goodThings: FFAppState()
                                                                  .pageStateSchemaVariable
                                                                  .goodThingsPlanner,
                                                              improvement: FFAppState()
                                                                  .pageStateSchemaVariable
                                                                  .imporovementState,
                                                              achivementPercentage:
                                                                  FFAppState()
                                                                      .pageStateSchemaVariable
                                                                      .archivePercentState,
                                                              plannerSubmitted:
                                                                  true,
                                                              timetableStartIndex:
                                                                  valueOrDefault<
                                                                      int>(
                                                                FFAppState()
                                                                    .PlannerStartTime,
                                                                9,
                                                              ),
                                                              timetableEndIndex:
                                                                  valueOrDefault<
                                                                      int>(
                                                                FFAppState()
                                                                    .PlannerEndTime,
                                                                22,
                                                              ),
                                                              dailyStarting:
                                                                  updateDailyStartingStruct(
                                                                FFAppState()
                                                                    .pageStateSchemaVariable
                                                                    .dailyStartPara,
                                                                clearUnsetFields:
                                                                    false,
                                                              ),
                                                              basicInfo:
                                                                  createBasicUserInfoStruct(
                                                                timenow:
                                                                    getCurrentTimestamp,
                                                                userName:
                                                                    currentUserDisplayName,
                                                                userSeatNo: valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.seatNo,
                                                                    0),
                                                                userSpot: valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.spot,
                                                                    ''),
                                                                clearUnsetFields:
                                                                    false,
                                                              ),
                                                              pointGiven:
                                                                  valueOrDefault<
                                                                      int>(
                                                                functions.calculatePointDay(
                                                                    FFAppState()
                                                                        .pageStateSchemaVariable),
                                                                0,
                                                              ),
                                                            ),
                                                            ...mapToFirestore(
                                                              {
                                                                'inputList':
                                                                    getPlannerInputListFirestoreData(
                                                                  FFAppState()
                                                                      .pageStateSchemaVariable
                                                                      .inputListState,
                                                                ),
                                                              },
                                                            ),
                                                          });
                                                        } else {
                                                          await PlannerVariableListRecord
                                                                  .createDoc(
                                                                      currentUserReference!)
                                                              .set({
                                                            ...createPlannerVariableListRecordData(
                                                              adminChecked:
                                                                  false,
                                                              goodThings: FFAppState()
                                                                  .pageStateSchemaVariable
                                                                  .goodThingsPlanner,
                                                              improvement: FFAppState()
                                                                  .pageStateSchemaVariable
                                                                  .imporovementState,
                                                              achivementPercentage:
                                                                  valueOrDefault<
                                                                      double>(
                                                                FFAppState()
                                                                    .pageStateSchemaVariable
                                                                    .archivePercentState,
                                                                0.0,
                                                              ),
                                                              submittedDate:
                                                                  FFAppState()
                                                                      .plannerDateSelected,
                                                              plannerSubmitted:
                                                                  true,
                                                              basicInfo:
                                                                  updateBasicUserInfoStruct(
                                                                BasicUserInfoStruct(
                                                                  uid:
                                                                      currentUserReference
                                                                          ?.id,
                                                                  userName:
                                                                      currentUserDisplayName,
                                                                  userSeatNo: valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.seatNo,
                                                                      0),
                                                                  userSpot: valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.spot,
                                                                      ''),
                                                                  timenow:
                                                                      getCurrentTimestamp,
                                                                ),
                                                                clearUnsetFields:
                                                                    false,
                                                                create: true,
                                                              ),
                                                              timetableStartIndex:
                                                                  valueOrDefault<
                                                                      int>(
                                                                FFAppState()
                                                                    .PlannerStartTime,
                                                                8,
                                                              ),
                                                              timetableEndIndex:
                                                                  valueOrDefault<
                                                                      int>(
                                                                FFAppState()
                                                                    .PlannerEndTime,
                                                                22,
                                                              ),
                                                              dailyStarting:
                                                                  updateDailyStartingStruct(
                                                                FFAppState()
                                                                    .pageStateSchemaVariable
                                                                    .dailyStartPara,
                                                                clearUnsetFields:
                                                                    false,
                                                                create: true,
                                                              ),
                                                              pointGiven:
                                                                  valueOrDefault<
                                                                      int>(
                                                                functions.calculatePointDay(
                                                                    FFAppState()
                                                                        .pageStateSchemaVariable),
                                                                0,
                                                              ),
                                                            ),
                                                            ...mapToFirestore(
                                                              {
                                                                'inputList':
                                                                    getPlannerInputListFirestoreData(
                                                                  FFAppState()
                                                                      .pageStateSchemaVariable
                                                                      .inputListState,
                                                                ),
                                                              },
                                                            ),
                                                          });
                                                        }

                                                        await currentUserDocument!
                                                            .plannerLocation!
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'studyDBbackup':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                getPageStateSchemaFirestoreData(
                                                                  updatePageStateSchemaStruct(
                                                                    FFAppState()
                                                                        .pageStateSchemaVariable,
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  true,
                                                                )
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                        await Future.delayed(
                                                          Duration(
                                                            milliseconds: 1000,
                                                          ),
                                                        );
                                                        unawaited(
                                                          () async {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      '제출완료'),
                                                                  content: Text(
                                                                      '플래너가 제출되었습니다! 5초뒤 앱이 종료됩니다.'),
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
                                                          }(),
                                                        );
                                                        await Future.delayed(
                                                          Duration(
                                                            milliseconds: 5000,
                                                          ),
                                                        );
                                                        await actions
                                                            .exitAppAsync();
                                                      } else {
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      }
                                                    }

                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                20.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                20.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                20.0),
                                                        topRight:
                                                            Radius.circular(
                                                                20.0),
                                                      ),
                                                      border: Border.all(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              valueOrDefault<
                                                                  double>(
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
                                                        padding: EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                valueOrDefault<
                                                                    double>(
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
                                                                valueOrDefault<
                                                                    double>(
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
                                                            if ((valueOrDefault<
                                                                        bool>(
                                                                      FFAppState()
                                                                          .pageStateSchemaVariable
                                                                          .isSubmittedPara,
                                                                      false,
                                                                    ) ==
                                                                    true) &&
                                                                (valueOrDefault<
                                                                        bool>(
                                                                      FFAppState()
                                                                          .pageStateSchemaVariable
                                                                          .adminCheckedPara,
                                                                      false,
                                                                    ) ==
                                                                    true)) {
                                                              return valueOrDefault<
                                                                  String>(
                                                                FFAppState()
                                                                    .pageStateSchemaVariable
                                                                    .teacherquoteState,
                                                                '고생하셨습니다! 내일도 화이팅:)',
                                                              );
                                                            } else if ((valueOrDefault<
                                                                        bool>(
                                                                      FFAppState()
                                                                          .pageStateSchemaVariable
                                                                          .isSubmittedPara,
                                                                      false,
                                                                    ) ==
                                                                    true) &&
                                                                (valueOrDefault<
                                                                        bool>(
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
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            if (FFAppState()
                                                    .pageStateSchemaVariable
                                                    .isSubmittedPara !=
                                                true)
                                              Expanded(
                                                flex: 5,
                                                child: Builder(
                                                  builder: (context) => Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        var _shouldSetState =
                                                            false;
                                                        if (!((FFAppState()
                                                                    .pageStateSchemaVariable
                                                                    .isSubmittedPara !=
                                                                true) &&
                                                            (FFAppState()
                                                                    .plannerDateSelected!
                                                                    .millisecondsSinceEpoch >
                                                                (getCurrentTimestamp
                                                                        .millisecondsSinceEpoch -
                                                                    100800000)))) {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    '입력불가'),
                                                                content: Text(
                                                                    '과거의 날짜나 이미 제출된 플래너는 To do List를 추가할 수 없습니다.'),
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
                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        }
                                                        if ((FFAppState()
                                                                    .pageStateSchemaVariable
                                                                    .dailyStartPara
                                                                    .sleepTime ==
                                                                null) &&
                                                            ((FFAppState()
                                                                        .pageStateSchemaVariable
                                                                        .dailyStartPara
                                                                        .getupTime ==
                                                                    null) &&
                                                                (FFAppState()
                                                                            .pageStateSchemaVariable
                                                                            .dailyStartPara
                                                                            .goalTime ==
                                                                        ''))) {
                                                          if (FFAppState()
                                                                  .plannerDateSelected !=
                                                              functions
                                                                  .getDateAtMidnight(
                                                                      getCurrentTimestamp)) {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  content: Text(
                                                                      '오늘날짜와 다른 날짜의 플래너를 작성중입니다. 날짜를 확인하고 다시 시도하세요.'),
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
                                                            await showDialog(
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
                                                                        Container(
                                                                      height:
                                                                          500.0,
                                                                      width:
                                                                          800.0,
                                                                      child:
                                                                          PlannerInutSetCopyWidget(),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }
                                                          await showDialog(
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
                                                                      Container(
                                                                    height:
                                                                        500.0,
                                                                    width:
                                                                        500.0,
                                                                    child:
                                                                        DailySetWidget(),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(() =>
                                                                  _model.asss =
                                                                      value));

                                                          _shouldSetState =
                                                              true;
                                                          if (!_model.asss!) {
                                                            if (_shouldSetState)
                                                              safeSetState(
                                                                  () {});
                                                            return;
                                                          }
                                                          await Future.delayed(
                                                            Duration(
                                                              milliseconds: 300,
                                                            ),
                                                          );
                                                          await showDialog(
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
                                                                      Container(
                                                                    height:
                                                                        500.0,
                                                                    width:
                                                                        800.0,
                                                                    child:
                                                                        PlannerInutSetCopyWidget(),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        } else {
                                                          await showDialog(
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
                                                                      Container(
                                                                    height:
                                                                        500.0,
                                                                    width:
                                                                        800.0,
                                                                    child:
                                                                        PlannerInutSetCopyWidget(),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        }

                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                      },
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
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
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    20.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    20.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    20.0),
                                                          ),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'j5vg4i41' /* To do List 추가하기 */,
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
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 8.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ).animateOnActionTrigger(
                  animationsMap['rowOnActionTriggerAnimation']!,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
