import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'adminplanner_page_model.dart';
export 'adminplanner_page_model.dart';

class AdminplannerPageWidget extends StatefulWidget {
  const AdminplannerPageWidget({
    super.key,
    this.mmm,
  });

  final int? mmm;

  static String routeName = 'adminplannerPage';
  static String routePath = '/adminplannerPage';

  @override
  State<AdminplannerPageWidget> createState() => _AdminplannerPageWidgetState();
}

class _AdminplannerPageWidgetState extends State<AdminplannerPageWidget> {
  late AdminplannerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminplannerPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.checkUserClaimAction = await actions.checkUserClaims();
      if ((_model.checkUserClaimAction == 'admin') ||
          (_model.checkUserClaimAction == 'master')) {
        FFAppState().deletePageStateSchemaVariable();
        FFAppState().pageStateSchemaVariable =
            PageStateSchemaStruct.fromSerializableMap(jsonDecode(
                '{\"inputListState\":\"[]\",\"submittedDatePlanner\":\"1735657200000\",\"dailyStartPara\":\"{\\\"CommentOfDay\\\":\\\" \\\"}\",\"basicInfoState\":\"{\\\"uid\\\":\\\"\\\"}\"}'));

        FFAppState().plannerDateSelected =
            functions.getDateAtMidnight(getCurrentTimestamp);
        safeSetState(() {});
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('접근거부'),
              content: Text('관리자페이지입니다.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Back'),
                ),
              ],
            );
          },
        );

        context.goNamed(HomePageWidget.routeName);
      }
    });

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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        drawer: Drawer(
          elevation: 16.0,
          child: Visibility(
            visible: responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
            ),
            child: Container(
              width: 270.0,
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().updateInsideDBStudentAtIndex(
                                FFAppState().maxNumberOfPlan,
                                (e) => e..adminCheckedPara = true,
                              );
                              safeSetState(() {});
                            },
                            child: Icon(
                              Icons.add_task_rounded,
                              color: Color(0xFF6F61EF),
                              size: 32.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'dy6uhopr' /* 내공관리자 */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    font: GoogleFonts.ubuntu(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF15161E),
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontStyle,
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
                                '2zsc6a8w' /* Platform Navigation */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF606A85),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                              width: double.infinity,
                              height: 44.0,
                              decoration: BoxDecoration(
                                color: Color(0x4D9489F5),
                                borderRadius: BorderRadius.circular(12.0),
                                shape: BoxShape.rectangle,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 6.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.playlist_add_check_rounded,
                                          color: Color(0xFF6F61EF),
                                          size: 30.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'mmes5d9x' /* 플래너확인 */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts
                                                      .plusJakartaSans(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF15161E),
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
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
                                    Container(
                                      height: 32.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF6F61EF),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 4.0, 8.0, 4.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) =>
                                                FutureBuilder<int>(
                                              future:
                                                  queryPlannerVariableListRecordCount(
                                                queryBuilder:
                                                    (plannerVariableListRecord) =>
                                                        plannerVariableListRecord
                                                            .where(
                                                              'plannerSubmitted',
                                                              isEqualTo: true,
                                                            )
                                                            .where(
                                                              'adminChecked',
                                                              isNotEqualTo:
                                                                  true,
                                                            )
                                                            .where(
                                                              'submittedDate',
                                                              isEqualTo:
                                                                  FFAppState()
                                                                      .plannerDateSelected,
                                                            )
                                                            .where(
                                                              'basicInfo.userSpot',
                                                              isEqualTo: valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.spot,
                                                                          '') !=
                                                                      ''
                                                                  ? valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.spot,
                                                                      '')
                                                                  : null,
                                                            ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                int textCount = snapshot.data!;

                                                return Text(
                                                  textCount.toString(),
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
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                );
                                              },
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
                                    AdminTimeTablePageWidget.routeName);
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                                width: double.infinity,
                                height: 44.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF1F4F8),
                                  borderRadius: BorderRadius.circular(12.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 6.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.space_dashboard_rounded,
                                        color: Color(0xFF15161E),
                                        size: 24.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'fqlg0f9q' /* 시간표 관리 */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font:
                                                    GoogleFonts.plusJakartaSans(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF15161E),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
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
                                    AdminpmCallCheckWidget.routeName);
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                                width: double.infinity,
                                height: 44.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF1F4F8),
                                  borderRadius: BorderRadius.circular(12.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 6.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.alarm_on,
                                        color: Color(0xFF15161E),
                                        size: 24.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'd9jdtnmz' /* 벨 기록 조회 */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font:
                                                    GoogleFonts.plusJakartaSans(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF15161E),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
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
                                    AdminpmStudyCheckWidget.routeName);
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                                width: double.infinity,
                                height: 44.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 6.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.work,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '4abyfxrv' /* 공부 기록 조회 */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font:
                                                    GoogleFonts.plusJakartaSans(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF15161E),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
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
                                16.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '5qzgbu1j' /* Settings */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF606A85),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
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
                                    AdminSeatConfigureWidget.routeName);
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                                width: double.infinity,
                                height: 44.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF1F4F8),
                                  borderRadius: BorderRadius.circular(12.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 6.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.assignment_outlined,
                                        color: Color(0xFF15161E),
                                        size: 24.0,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'klbp1jr1' /* 좌석배정 */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts
                                                      .plusJakartaSans(
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Color(0xFF15161E),
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 32.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFABB0B4),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 4.0, 8.0, 4.0),
                                            child: FutureBuilder<int>(
                                              future: queryUsersRecordCount(
                                                queryBuilder: (usersRecord) =>
                                                    usersRecord.where(
                                                  'seatRequest',
                                                  isEqualTo: true,
                                                ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                int textCount = snapshot.data!;

                                                return Text(
                                                  textCount.toString(),
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
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                );
                                              },
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
                                    .pushNamed(AdminSeatChangeWidget.routeName);
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                                width: double.infinity,
                                height: 44.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF1F4F8),
                                  borderRadius: BorderRadius.circular(12.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 6.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.event_seat,
                                        color: Color(0xFF15161E),
                                        size: 24.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '28eqswxx' /* 좌석변경 */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font:
                                                    GoogleFonts.plusJakartaSans(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF15161E),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
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
                                    AdminPointConfigurePageWidget.routeName);
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                                width: double.infinity,
                                height: 44.0,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF1F4F8),
                                  borderRadius: BorderRadius.circular(12.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 6.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.attach_money_rounded,
                                        color: Color(0xFF15161E),
                                        size: 24.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'md5v39ew' /* 포인트 관리 */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font:
                                                    GoogleFonts.plusJakartaSans(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF15161E),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
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
                                    .pushNamed(AdminCostCheckWidget.routeName);
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                                width: double.infinity,
                                height: 44.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 6.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.work,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '84izfiwc' /* 인원추이확인 */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font:
                                                    GoogleFonts.plusJakartaSans(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF15161E),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
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
                                    .pushNamed(AdminSignCheckWidget.routeName);
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                                width: double.infinity,
                                height: 44.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 6.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.plagiarism_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '9jh2fiw9' /* 입학원서/서약서확인 */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font:
                                                    GoogleFonts.plusJakartaSans(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Color(0xFF15161E),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
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
                        ].divide(SizedBox(height: 12.0)),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      currentUserDisplayName,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF15161E),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                  AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      valueOrDefault(
                                          currentUserDocument?.spot, ''),
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
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (scaffoldKey.currentState!.isDrawerOpen ||
                                  scaffoldKey.currentState!.isEndDrawerOpen) {
                                Navigator.pop(context);
                              }
                            },
                            child: Icon(
                              Icons.logout,
                              color: Color(0xFF606A85),
                              size: 24.0,
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
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    child: Container(
                      width: 600.0,
                      height: double.infinity,
                      constraints: BoxConstraints(
                        maxWidth: 970.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 30.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      scaffoldKey.currentState!.openDrawer();
                                    },
                                    child: Icon(
                                      Icons.menu,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 40.0,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 0.0, 4.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '1hseyro0' /* 플래너 확인 */,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineMedium
                                                    .override(
                                                      font: GoogleFonts.outfit(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Color(0xFF15161E),
                                                      fontSize: 24.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '5sazzl33' /* 제출된 플래너를 승인 및 저장하세요 */,
                                              ),
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
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 40.0, 20.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Container(
                                                width: 200.0,
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
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
                                                        final _datePickedDate =
                                                            await showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              getCurrentTimestamp,
                                                          firstDate:
                                                              DateTime(1900),
                                                          lastDate:
                                                              getCurrentTimestamp,
                                                          builder:
                                                              (context, child) {
                                                            return wrapInMaterialDatePickerTheme(
                                                              context,
                                                              child!,
                                                              headerBackgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              headerForegroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                              headerTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                        fontSize:
                                                                            32.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).headlineLargeIsCustom,
                                                                      ),
                                                              pickerBackgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                              pickerForegroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              selectedDateTimeBackgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              selectedDateTimeForegroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                              actionButtonForegroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              iconSize: 24.0,
                                                            );
                                                          },
                                                        );

                                                        if (_datePickedDate !=
                                                            null) {
                                                          safeSetState(() {
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
                                                          safeSetState(() {
                                                            _model.datePicked =
                                                                getCurrentTimestamp;
                                                          });
                                                        }
                                                        FFAppState()
                                                                .plannerDateSelected =
                                                            _model.datePicked;
                                                        FFAppState()
                                                            .update(() {});
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons.edit_calendar,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 24.0,
                                                          ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  dateTimeFormat(
                                                                    "Md",
                                                                    FFAppState()
                                                                        .plannerDateSelected,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  '클릭해서 날짜선택',
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
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.home,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child:
                                                              AuthUserStreamWidget(
                                                            builder: (context) =>
                                                                FutureBuilder<
                                                                    List<
                                                                        NotificationRecord>>(
                                                              future:
                                                                  queryNotificationRecordOnce(
                                                                singleRecord:
                                                                    true,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<NotificationRecord>
                                                                    dropDownNotificationRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                // Return an empty Container when the item does not exist.
                                                                if (snapshot
                                                                    .data!
                                                                    .isEmpty) {
                                                                  return Container();
                                                                }
                                                                final dropDownNotificationRecord =
                                                                    dropDownNotificationRecordList
                                                                            .isNotEmpty
                                                                        ? dropDownNotificationRecordList
                                                                            .first
                                                                        : null;

                                                                return FlutterFlowDropDown<
                                                                    String>(
                                                                  controller: _model
                                                                          .dropDownValueController ??=
                                                                      FormFieldController<
                                                                          String>(
                                                                    _model.dropDownValue ??=
                                                                        valueOrDefault(
                                                                            currentUserDocument?.spot,
                                                                            ''),
                                                                  ),
                                                                  options: _model
                                                                              .checkUserClaimAction ==
                                                                          'master'
                                                                      ? dropDownNotificationRecord!
                                                                          .spotdatas
                                                                          .map((e) => e
                                                                              .spot)
                                                                          .toList()
                                                                      : ((String
                                                                          var1) {
                                                                          return [
                                                                            var1
                                                                          ];
                                                                        }(valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.spot,
                                                                          ''))),
                                                                  onChanged: (val) =>
                                                                      safeSetState(() =>
                                                                          _model.dropDownValue =
                                                                              val),
                                                                  width: 150.0,
                                                                  height: 40.0,
                                                                  textStyle: FlutterFlowTheme.of(
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
                                                                  hintText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '6cvp4sp5' /* 지점선택 */,
                                                                  ),
                                                                  icon: Icon(
                                                                    Icons
                                                                        .keyboard_arrow_down_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  elevation:
                                                                      2.0,
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderWidth:
                                                                      0.0,
                                                                  borderRadius:
                                                                      8.0,
                                                                  margin: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                  hidesUnderline:
                                                                      true,
                                                                  isOverButton:
                                                                      false,
                                                                  isSearchable:
                                                                      false,
                                                                  isMultiSelect:
                                                                      false,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.bb =
                                                      await queryPlannerVariableListRecordOnce(
                                                    queryBuilder:
                                                        (plannerVariableListRecord) =>
                                                            plannerVariableListRecord
                                                                .where(
                                                                  'submittedDate',
                                                                  isEqualTo:
                                                                      FFAppState()
                                                                          .plannerDateSelected,
                                                                )
                                                                .where(
                                                                  'basicInfo.userSpot',
                                                                  isEqualTo: _model
                                                                      .dropDownValue,
                                                                )
                                                                .where(
                                                                  'plannerSubmitted',
                                                                  isEqualTo:
                                                                      true,
                                                                )
                                                                .orderBy(
                                                                    'basicInfo.userSeatNo'),
                                                  );
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 500));
                                                  FFAppState()
                                                      .insideDBStudent = () {
                                                    if (_model.orderingType &&
                                                        !_model.orderingField) {
                                                      return functions
                                                          .fromFirebaseToSchema(
                                                              _model.bb
                                                                  ?.toList())!
                                                          .sortedList(
                                                              keyOf: (e) => e
                                                                  .basicInfoState
                                                                  .timenow!,
                                                              desc: true);
                                                    } else if (_model
                                                            .orderingType &&
                                                        _model.orderingField) {
                                                      return functions
                                                          .fromFirebaseToSchema(
                                                              _model.bb
                                                                  ?.toList())!
                                                          .sortedList(
                                                              keyOf: (e) => e
                                                                  .basicInfoState
                                                                  .timenow!,
                                                              desc: false);
                                                    } else if (!_model
                                                            .orderingType &&
                                                        _model.orderingField) {
                                                      return functions
                                                          .fromFirebaseToSchema(
                                                              _model.bb
                                                                  ?.toList())!
                                                          .sortedList(
                                                              keyOf: (e) => e
                                                                  .basicInfoState
                                                                  .userSeatNo,
                                                              desc: true);
                                                    } else {
                                                      return functions
                                                          .fromFirebaseToSchema(
                                                              _model.bb
                                                                  ?.toList())!
                                                          .sortedList(
                                                              keyOf: (e) => e
                                                                  .basicInfoState
                                                                  .userSeatNo,
                                                              desc: false);
                                                    }
                                                  }()
                                                      .toList()
                                                      .cast<
                                                          PageStateSchemaStruct>();
                                                  FFAppState().update(() {});

                                                  safeSetState(() {});
                                                },
                                                child: Icon(
                                                  Icons.cached,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 40.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 20.0, 16.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF1F4F8),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Icon(
                                                      Icons.person,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
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
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'aekdiqw1' /* 이름 */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelSmall
                                                          .override(
                                                            font: GoogleFonts
                                                                .plusJakartaSans(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFF606A85),
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontStyle,
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
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.orderingType = false;
                                                _model.orderingField =
                                                    !_model.orderingField;
                                                safeSetState(() {});
                                                FFAppState()
                                                    .insideDBStudent = () {
                                                  if (_model.orderingType &&
                                                      !_model.orderingField) {
                                                    return functions
                                                        .fromFirebaseToSchema(
                                                            _model.bb
                                                                ?.toList())!
                                                        .sortedList(
                                                            keyOf: (e) => e
                                                                .basicInfoState
                                                                .timenow!,
                                                            desc: true);
                                                  } else if (_model
                                                          .orderingType &&
                                                      _model.orderingField) {
                                                    return functions
                                                        .fromFirebaseToSchema(
                                                            _model.bb
                                                                ?.toList())!
                                                        .sortedList(
                                                            keyOf: (e) => e
                                                                .basicInfoState
                                                                .timenow!,
                                                            desc: false);
                                                  } else if (!_model
                                                          .orderingType &&
                                                      _model.orderingField) {
                                                    return functions
                                                        .fromFirebaseToSchema(
                                                            _model.bb
                                                                ?.toList())!
                                                        .sortedList(
                                                            keyOf: (e) => e
                                                                .basicInfoState
                                                                .userSeatNo,
                                                            desc: true);
                                                  } else {
                                                    return functions
                                                        .fromFirebaseToSchema(
                                                            _model.bb
                                                                ?.toList())!
                                                        .sortedList(
                                                            keyOf: (e) => e
                                                                .basicInfoState
                                                                .userSeatNo,
                                                            desc: false);
                                                  }
                                                }()
                                                    .toList()
                                                    .cast<
                                                        PageStateSchemaStruct>();
                                                FFAppState().update(() {});
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons.numbers_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                  ))
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'mtcviyw8' /* 좌석번호 */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelSmall
                                                            .override(
                                                              font: GoogleFonts
                                                                  .plusJakartaSans(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontStyle,
                                                              ),
                                                              color: Color(
                                                                  0xFF606A85),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 30.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Icon(
                                                      Icons.location_pin,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                ))
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '4h0jy67h' /* 지점 */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelSmall
                                                          .override(
                                                            font: GoogleFonts
                                                                .plusJakartaSans(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFF606A85),
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 20.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.orderingType = true;
                                                _model.orderingField =
                                                    !_model.orderingField;
                                                safeSetState(() {});
                                                FFAppState()
                                                    .insideDBStudent = () {
                                                  if (_model.orderingType &&
                                                      !_model.orderingField) {
                                                    return functions
                                                        .fromFirebaseToSchema(
                                                            _model.bb
                                                                ?.toList())!
                                                        .sortedList(
                                                            keyOf: (e) => e
                                                                .basicInfoState
                                                                .timenow!,
                                                            desc: true);
                                                  } else if (_model
                                                          .orderingType &&
                                                      _model.orderingField) {
                                                    return functions
                                                        .fromFirebaseToSchema(
                                                            _model.bb
                                                                ?.toList())!
                                                        .sortedList(
                                                            keyOf: (e) => e
                                                                .basicInfoState
                                                                .timenow!,
                                                            desc: false);
                                                  } else if (!_model
                                                          .orderingType &&
                                                      _model.orderingField) {
                                                    return functions
                                                        .fromFirebaseToSchema(
                                                            _model.bb
                                                                ?.toList())!
                                                        .sortedList(
                                                            keyOf: (e) => e
                                                                .basicInfoState
                                                                .userSeatNo,
                                                            desc: true);
                                                  } else {
                                                    return functions
                                                        .fromFirebaseToSchema(
                                                            _model.bb
                                                                ?.toList())!
                                                        .sortedList(
                                                            keyOf: (e) => e
                                                                .basicInfoState
                                                                .userSeatNo,
                                                            desc: false);
                                                  }
                                                }()
                                                    .toList()
                                                    .cast<
                                                        PageStateSchemaStruct>();
                                                FFAppState().update(() {});
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons.edit_calendar,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                  if (responsiveVisibility(
                                                    context: context,
                                                    phone: false,
                                                  ))
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'i6u1bcvo' /* 제출시각 */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelSmall
                                                            .override(
                                                              font: GoogleFonts
                                                                  .plusJakartaSans(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontStyle,
                                                              ),
                                                              color: Color(
                                                                  0xFF606A85),
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 20.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Icon(
                                                      Icons.check_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                ))
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '0kx4a6xu' /* 확인여부 */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .labelSmall
                                                          .override(
                                                            font: GoogleFonts
                                                                .plusJakartaSans(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFF606A85),
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
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
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 750.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final plannergo = FFAppState()
                                            .insideDBStudent
                                            .toList();

                                        return ListView.separated(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            0,
                                            0,
                                            44.0,
                                          ),
                                          scrollDirection: Axis.vertical,
                                          itemCount: plannergo.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 1.0),
                                          itemBuilder:
                                              (context, plannergoIndex) {
                                            final plannergoItem =
                                                plannergo[plannergoIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState()
                                                        .pageStateSchemaVariable =
                                                    plannergoItem;
                                                FFAppState().loadedDataID =
                                                    _model.bb
                                                        ?.elementAtOrNull(
                                                            plannergoIndex)
                                                        ?.reference;
                                                FFAppState().PlannerStartTime =
                                                    valueOrDefault<int>(
                                                  plannergoItem
                                                      .timetableStartIndex,
                                                  8,
                                                );
                                                FFAppState().PlannerEndTime =
                                                    valueOrDefault<int>(
                                                  plannergoItem
                                                      .timetableEndIndex,
                                                  22,
                                                );
                                                FFAppState().update(() {});
                                                FFAppState().seatNoSelected =
                                                    plannergoItem.basicInfoState
                                                        .userSeatNo;
                                                FFAppState().adminUserName =
                                                    plannergoItem.basicInfoState
                                                        .userName;
                                                FFAppState().maxNumberOfPlan =
                                                    plannergoIndex;
                                                FFAppState().update(() {});
                                                _model.selectIndex =
                                                    plannergoIndex;
                                                safeSetState(() {});
                                              },
                                              onDoubleTap: () async {
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              content: Text(
                                                                  '${plannergoItem.userName}학생의 ${dateTimeFormat(
                                                                "yyyy/MM/dd",
                                                                plannergoItem
                                                                    .submittedDatePlanner,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )}플래너 승인을 취소하시겠습니까'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      '아니오'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child:
                                                                      Text('예'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  await functions
                                                      .convertStringToPlannerVariableListReference(
                                                          plannergoItem
                                                              .basicInfoState
                                                              .uid,
                                                          plannergoItem.docID)
                                                      .update(
                                                          createPlannerVariableListRecordData(
                                                        adminChecked: false,
                                                      ));

                                                  await functions
                                                      .convertStringToUserReferenceCopy(
                                                          plannergoItem
                                                              .basicInfoState
                                                              .uid)
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'pointListEach':
                                                            FieldValue
                                                                .arrayUnion([
                                                          getPointInputFirestoreData(
                                                            updatePointInputStruct(
                                                              PointInputStruct(
                                                                pointGet: -1 *
                                                                    plannergoItem
                                                                        .dailyStartPara
                                                                        .pointget,
                                                                getDate:
                                                                    getCurrentTimestamp,
                                                                reasonWhy:
                                                                    '${dateTimeFormat(
                                                                  "yyyy/MM/dd",
                                                                  plannergoItem
                                                                      .submittedDatePlanner,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )}플래너 승인 취소',
                                                              ),
                                                              clearUnsetFields:
                                                                  false,
                                                            ),
                                                            true,
                                                          )
                                                        ]),
                                                        'totalPoint': FieldValue
                                                            .increment(
                                                                -(plannergoItem
                                                                    .dailyStartPara
                                                                    .pointget)),
                                                      },
                                                    ),
                                                  });
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            '반영이 완료되었습니다. 새로고침 버튼을 눌러 다시 로드하세요.'),
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
                                                }
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: plannergoIndex ==
                                                          _model.selectIndex
                                                      ? Color(0xFFFFF1C6)
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 0.0,
                                                      color: Color(0xFFE5E7EB),
                                                      offset: Offset(
                                                        0.0,
                                                        1.0,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(35.0, 12.0,
                                                          35.0, 12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        flex: 4,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
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
                                                                plannergoItem
                                                                    .basicInfoState
                                                                    .userName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .plusJakartaSans(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Color(
                                                                          0xFF15161E),
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyLarge
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 4.0)),
                                                          ),
                                                        ),
                                                      ),
                                                      if (responsiveVisibility(
                                                        context: context,
                                                        phone: false,
                                                      ))
                                                        Expanded(
                                                          flex: 2,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                            child: Text(
                                                              plannergoItem
                                                                  .basicInfoState
                                                                  .userSeatNo
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .plusJakartaSans(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Color(
                                                                        0xFF15161E),
                                                                    fontSize:
                                                                        14.0,
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
                                                            ),
                                                          ),
                                                        ),
                                                      if (responsiveVisibility(
                                                        context: context,
                                                        phone: false,
                                                        tablet: false,
                                                      ))
                                                        Expanded(
                                                          flex: 3,
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                plannergoItem
                                                                    .basicInfoState
                                                                    .userSpot,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .plusJakartaSans(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Color(
                                                                          0xFF15161E),
                                                                      fontSize:
                                                                          14.0,
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
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (responsiveVisibility(
                                                        context: context,
                                                        phone: false,
                                                        tablet: false,
                                                      ))
                                                        Expanded(
                                                          flex: 3,
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  dateTimeFormat(
                                                                    "jm",
                                                                    plannergoItem
                                                                        .basicInfoState
                                                                        .timenow,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  '11/25',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .plusJakartaSans(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Color(
                                                                          0xFF15161E),
                                                                      fontSize:
                                                                          14.0,
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
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if (responsiveVisibility(
                                                        context: context,
                                                        phone: false,
                                                        tablet: false,
                                                      ))
                                                        Expanded(
                                                          flex: 3,
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                plannergoItem
                                                                        .adminCheckedPara
                                                                    ? 'O(확인완료)'
                                                                    : 'X(확인필요)',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .plusJakartaSans(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: Color(
                                                                          0xFF15161E),
                                                                      fontSize:
                                                                          14.0,
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
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
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
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 30.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 10.0, 0.0, 0.0),
                                          child: RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'rdl2c3db' /* 확인 인원 :  */,
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
                                                TextSpan(
                                                  text: FFAppState()
                                                      .insideDBStudent
                                                      .where((e) =>
                                                          e.adminCheckedPara)
                                                      .toList()
                                                      .length
                                                      .toString(),
                                                  style: TextStyle(),
                                                )
                                              ],
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
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 10.0, 0.0, 0.0),
                                          child: RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'n4j3augi' /* 미확인 인원 :  */,
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
                                                TextSpan(
                                                  text: FFAppState()
                                                      .insideDBStudent
                                                      .where((e) =>
                                                          !e.adminCheckedPara)
                                                      .toList()
                                                      .length
                                                      .toString(),
                                                  style: TextStyle(),
                                                )
                                              ],
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
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 10.0, 0.0, 0.0),
                                          child: RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'h9d253gx' /* 평균공부시간 :  */,
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
                                                TextSpan(
                                                  text: formatNumber(
                                                    functions
                                                        .calculateAverageStudyTime(
                                                            FFAppState()
                                                                .insideDBStudent
                                                                .toList()),
                                                    formatType:
                                                        FormatType.custom,
                                                    format: '###.0#',
                                                    locale: '',
                                                  ),
                                                  style: TextStyle(),
                                                )
                                              ],
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
                                        Text(
                                          getCurrentTimestamp.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
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
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1200.0,
                  height: 840.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: custom_widgets.WidgetToImage(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
                Container(
                  width: 300.0,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'e76b7aua' /* TimeTable */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
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
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    'gtsnmnx7' /* 5 */,
                                  ),
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell051',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell052',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell053',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell054',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell055',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell056',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    '5b9m5a02' /* 6 */,
                                  ),
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell061',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell062',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell063',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell064',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell065',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell066',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    '4pa2zqtu' /* 7 */,
                                  ),
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell071',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell072',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell073',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell074',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell075',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell076',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    'l5cbscqa' /* 8 */,
                                  ),
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell081',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell082',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell083',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell084',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell085',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell086',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    'g392wd87' /* 9 */,
                                  ),
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell091',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell092',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell093',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell094',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell095',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell096',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    'se9gl50c' /* 10 */,
                                  ),
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell101',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell102',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell103',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell104',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell105',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell106',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    'd9be1luv' /* 11 */,
                                  ),
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell111',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell112',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell113',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell114',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell115',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell116',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    'vcef0iqg' /* 12 */,
                                  ),
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell121',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell122',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell123',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell124',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell125',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell126',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    'utyk7h74' /* 13 */,
                                  ),
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell131',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell132',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell133',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell134',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell135',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell136',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    'dgmw9h17' /* 14 */,
                                  ),
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell141',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell142',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell143',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell144',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell145',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell146',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    'i2kfjfbm' /* 15 */,
                                  ),
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell151',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell152',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell153',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell154',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell155',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell156',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    'na3spghj' /* 16 */,
                                  ),
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell161',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell162',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell163',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell164',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell165',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell166',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    'yckjqden' /* 17 */,
                                  ),
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell171',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell172',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell173',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell174',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell175',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell176',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    'lsir6i5j' /* 18 */,
                                  ),
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell181',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell182',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell183',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell184',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell185',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell186',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    'akix5oha' /* 19 */,
                                  ),
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell191',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell192',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell193',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell194',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell195',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell196',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    '4ewe80l6' /* 20 */,
                                  ),
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell201',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell202',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell203',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell204',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell205',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell206',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    'gu7eg10y' /* 21 */,
                                  ),
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell211',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell212',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell213',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell214',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell215',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell216',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.only(
                                  bottomLeft:
                                      Radius.circular(valueOrDefault<double>(
                                    FFAppState().PlannerEndTime == 22
                                        ? 10.0
                                        : 0.0,
                                    0.0,
                                  )),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    'cmhav4go' /* 22 */,
                                  ),
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell221',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell222',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell223',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell224',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell225',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell226',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight:
                                      Radius.circular(valueOrDefault<double>(
                                    FFAppState().PlannerEndTime == 22
                                        ? 10.0
                                        : 0.0,
                                    0.0,
                                  )),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.only(
                                  bottomLeft:
                                      Radius.circular(valueOrDefault<double>(
                                    FFAppState().PlannerEndTime == 23
                                        ? 10.0
                                        : 0.0,
                                    0.0,
                                  )),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    '5biq31oz' /* 23 */,
                                  ),
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell231',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell232',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell233',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell234',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell235',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell236',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight:
                                      Radius.circular(valueOrDefault<double>(
                                    FFAppState().PlannerEndTime == 23
                                        ? 10.0
                                        : 0.0,
                                    0.0,
                                  )),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.only(
                                  bottomLeft:
                                      Radius.circular(valueOrDefault<double>(
                                    FFAppState().PlannerEndTime == 24
                                        ? 10.0
                                        : 0.0,
                                    0.0,
                                  )),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    'yeo47jk2' /* 24 */,
                                  ),
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell001',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell002',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell003',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell004',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell005',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell006',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight:
                                      Radius.circular(valueOrDefault<double>(
                                    FFAppState().PlannerEndTime == 24
                                        ? 10.0
                                        : 0.0,
                                    0.0,
                                  )),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
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
                                height: functions.calculatePlannerCellHeight(
                                    FFAppState().PlannerStartTime,
                                    FFAppState().PlannerEndTime),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft:
                                        Radius.circular(valueOrDefault<double>(
                                      FFAppState().PlannerEndTime == 25
                                          ? 10.0
                                          : 0.0,
                                      0.0,
                                    )),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 2.0,
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: AutoSizeText(
                                    FFLocalizations.of(context).getText(
                                      '7zb8btun' /* 1 */,
                                    ),
                                    minFontSize: 10.0,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
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
                                height: functions.calculatePlannerCellHeight(
                                    FFAppState().PlannerStartTime,
                                    FFAppState().PlannerEndTime),
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    functions.getCellColorFromInputListState(
                                        'cell011',
                                        FFAppState()
                                            .pageStateSchemaVariable
                                            .inputListState
                                            .toList()),
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 100.0,
                                height: functions.calculatePlannerCellHeight(
                                    FFAppState().PlannerStartTime,
                                    FFAppState().PlannerEndTime),
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    functions.getCellColorFromInputListState(
                                        'cell012',
                                        FFAppState()
                                            .pageStateSchemaVariable
                                            .inputListState
                                            .toList()),
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 100.0,
                                height: functions.calculatePlannerCellHeight(
                                    FFAppState().PlannerStartTime,
                                    FFAppState().PlannerEndTime),
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    functions.getCellColorFromInputListState(
                                        'cell013',
                                        FFAppState()
                                            .pageStateSchemaVariable
                                            .inputListState
                                            .toList()),
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 100.0,
                                height: functions.calculatePlannerCellHeight(
                                    FFAppState().PlannerStartTime,
                                    FFAppState().PlannerEndTime),
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    functions.getCellColorFromInputListState(
                                        'cell014',
                                        FFAppState()
                                            .pageStateSchemaVariable
                                            .inputListState
                                            .toList()),
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 100.0,
                                height: functions.calculatePlannerCellHeight(
                                    FFAppState().PlannerStartTime,
                                    FFAppState().PlannerEndTime),
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    functions.getCellColorFromInputListState(
                                        'cell015',
                                        FFAppState()
                                            .pageStateSchemaVariable
                                            .inputListState
                                            .toList()),
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                width: 100.0,
                                height: functions.calculatePlannerCellHeight(
                                    FFAppState().PlannerStartTime,
                                    FFAppState().PlannerEndTime),
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    functions.getCellColorFromInputListState(
                                        'cell016',
                                        FFAppState()
                                            .pageStateSchemaVariable
                                            .inputListState
                                            .toList()),
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight:
                                        Radius.circular(valueOrDefault<double>(
                                      FFAppState().PlannerEndTime == 25
                                          ? 10.0
                                          : 0.0,
                                      0.0,
                                    )),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.only(
                                  bottomLeft:
                                      Radius.circular(valueOrDefault<double>(
                                    FFAppState().PlannerEndTime == 26
                                        ? 10.0
                                        : 0.0,
                                    0.0,
                                  )),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    '2fikcu7m' /* 2 */,
                                  ),
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell021',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell022',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell023',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell024',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell025',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell026',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight:
                                      Radius.circular(valueOrDefault<double>(
                                    FFAppState().PlannerEndTime == 26
                                        ? 10.0
                                        : 0.0,
                                    0.0,
                                  )),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.only(
                                  bottomLeft:
                                      Radius.circular(valueOrDefault<double>(
                                    FFAppState().PlannerEndTime == 27
                                        ? 10.0
                                        : 0.0,
                                    0.0,
                                  )),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    's55ahvu7' /* 3 */,
                                  ),
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell031',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell032',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell033',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell034',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell035',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell036',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight:
                                      Radius.circular(valueOrDefault<double>(
                                    FFAppState().PlannerEndTime == 27
                                        ? 10.0
                                        : 0.0,
                                    0.0,
                                  )),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.only(
                                  bottomLeft:
                                      Radius.circular(valueOrDefault<double>(
                                    FFAppState().PlannerEndTime == 28
                                        ? 10.0
                                        : 0.0,
                                    0.0,
                                  )),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AutoSizeText(
                                  FFLocalizations.of(context).getText(
                                    '05scjl3j' /* 4 */,
                                  ),
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
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
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell041',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell042',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell043',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell044',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell045',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 100.0,
                              height: functions.calculatePlannerCellHeight(
                                  FFAppState().PlannerStartTime,
                                  FFAppState().PlannerEndTime),
                              decoration: BoxDecoration(
                                color: valueOrDefault<Color>(
                                  functions.getCellColorFromInputListState(
                                      'cell046',
                                      FFAppState()
                                          .pageStateSchemaVariable
                                          .inputListState
                                          .toList()),
                                  FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0.0),
                                  bottomRight:
                                      Radius.circular(valueOrDefault<double>(
                                    FFAppState().PlannerEndTime == 28
                                        ? 10.0
                                        : 0.0,
                                    0.0,
                                  )),
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context)
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
