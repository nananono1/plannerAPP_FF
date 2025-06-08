import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/timetablestart_admin_set_widget.dart';
import '/components/timetablestart_naegongtime_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'admin_time_table_page_model.dart';
export 'admin_time_table_page_model.dart';

class AdminTimeTablePageWidget extends StatefulWidget {
  const AdminTimeTablePageWidget({super.key});

  static String routeName = 'adminTimeTablePage';
  static String routePath = '/adminTimeTablePage';

  @override
  State<AdminTimeTablePageWidget> createState() =>
      _AdminTimeTablePageWidgetState();
}

class _AdminTimeTablePageWidgetState extends State<AdminTimeTablePageWidget> {
  late AdminTimeTablePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminTimeTablePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.checkusercalimaction = await actions.checkUserClaims();
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
    return StreamBuilder<List<NotificationRecord>>(
      stream: queryNotificationRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<NotificationRecord> adminTimeTablePageNotificationRecordList =
            snapshot.data!;
        final adminTimeTablePageNotificationRecord =
            adminTimeTablePageNotificationRecordList.isNotEmpty
                ? adminTimeTablePageNotificationRecordList.first
                : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                    ))
                      Container(
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 16.0),
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
                                    Icon(
                                      Icons.add_task_rounded,
                                      color: Color(0xFF6F61EF),
                                      size: 32.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          't36wb2ia' /* 내공관리자 */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              font: GoogleFonts.ubuntu(
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF15161E),
                                              fontSize: 24.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
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
                                          '57huntg0' /* Platform Navigation */,
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
                                              AdminplannerPageWidget.routeName);
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 200),
                                          curve: Curves.easeInOut,
                                          width: double.infinity,
                                          height: 44.0,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .playlist_add_check_rounded,
                                                      color: Color(0xFF15161E),
                                                      size: 30.0,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'npvt1a0t' /* 플래너확인 */,
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
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: Color(
                                                                  0xFF15161E),
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
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
                                                    color: Color(0xFFABB0B4),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  4.0,
                                                                  8.0,
                                                                  4.0),
                                                      child: FutureBuilder<int>(
                                                        future:
                                                            queryPlannerVariableListRecordCount(
                                                          queryBuilder:
                                                              (plannerVariableListRecord) =>
                                                                  plannerVariableListRecord
                                                                      .where(
                                                                        'plannerSubmitted',
                                                                        isEqualTo:
                                                                            true,
                                                                      )
                                                                      .where(
                                                                        'adminChecked',
                                                                        isNotEqualTo:
                                                                            true,
                                                                      ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          int textCount =
                                                              snapshot.data!;

                                                          return Text(
                                                            textCount
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
                                                                  color: Colors
                                                                      .white,
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
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.easeInOut,
                                        width: double.infinity,
                                        height: 44.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x4D9489F5),
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
                                                Icons.space_dashboard_rounded,
                                                color: Color(0xFF6F61EF),
                                                size: 24.0,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'y88r1ve4' /* 시간표 관리 */,
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
                                              AdminpmCallCheckWidget.routeName);
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 200),
                                          curve: Curves.easeInOut,
                                          width: double.infinity,
                                          height: 44.0,
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
                                                  Icons.alarm_on,
                                                  color: Color(0xFF15161E),
                                                  size: 24.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '7vhvb5w6' /* 벨 기록 조회 */,
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
                                              AdminpmStudyCheckWidget
                                                  .routeName);
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 200),
                                          curve: Curves.easeInOut,
                                          width: double.infinity,
                                          height: 44.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
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
                                                  Icons.work,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '00bjmqo8' /* 공부 기록 조회 */,
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
                                          'vy5fyf9x' /* Settings */,
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
                                              AdminSeatConfigureWidget
                                                  .routeName);
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 200),
                                          curve: Curves.easeInOut,
                                          width: double.infinity,
                                          height: 44.0,
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
                                                  Icons.assignment_outlined,
                                                  color: Color(0xFF15161E),
                                                  size: 24.0,
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '2idh2mwe' /* 좌석배정 */,
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
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 32.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFABB0B4),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  4.0,
                                                                  8.0,
                                                                  4.0),
                                                      child: FutureBuilder<int>(
                                                        future:
                                                            queryUsersRecordCount(
                                                          queryBuilder:
                                                              (usersRecord) =>
                                                                  usersRecord
                                                                      .where(
                                                            'seatRequest',
                                                            isEqualTo: true,
                                                          ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
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
                                                          int textCount =
                                                              snapshot.data!;

                                                          return Text(
                                                            textCount
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
                                                                  color: Colors
                                                                      .white,
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
                                          context.pushNamed(
                                              AdminSeatChangeWidget.routeName);
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 200),
                                          curve: Curves.easeInOut,
                                          width: double.infinity,
                                          height: 44.0,
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
                                                  Icons.event_seat,
                                                  color: Color(0xFF15161E),
                                                  size: 24.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '52ho5m6e' /* 좌석변경 */,
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
                                              AdminPointConfigurePageWidget
                                                  .routeName);
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 200),
                                          curve: Curves.easeInOut,
                                          width: double.infinity,
                                          height: 44.0,
                                          decoration: BoxDecoration(
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
                                                  Icons.attach_money_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'as8577xs' /* 포인트 관리 */,
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
                                              AdminSignCheckWidget.routeName);
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 200),
                                          curve: Curves.easeInOut,
                                          width: double.infinity,
                                          height: 44.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
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
                                                  Icons.plagiarism_sharp,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'bwqhdbut' /* 입학원서/서약서확인 */,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AuthUserStreamWidget(
                                              builder: (context) => Text(
                                                currentUserDisplayName,
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                            ),
                                            AuthUserStreamWidget(
                                              builder: (context) => Text(
                                                valueOrDefault(
                                                    currentUserDocument?.spot,
                                                    ''),
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                          color:
                                                              Color(0xFF606A85),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                    16.0, 0.0, 16.0, 0.0),
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
                                        GoRouter.of(context).prepareAuthEvent();
                                        await authManager.signOut();
                                        GoRouter.of(context)
                                            .clearRedirectLocation();

                                        context.goNamedAuth(
                                            AuthWelcomeScreenWidget.routeName,
                                            context.mounted);
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
                    Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        maxWidth: 4000.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 450.0,
                            height: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
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
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0,
                                                                16.0, 0.0, 4.0),
                                                    child: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'fv8fuza4' /* 시간표 관리 */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .headlineMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .outfit(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineMedium
                                                                  .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFF15161E),
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'hcahx2xk' /* 제출된 플래너를 승인 및 저장하세요 */,
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
                                                          color:
                                                              Color(0xFF606A85),
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Container(
                                                      width: 200.0,
                                                      height: 80.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons.home,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 24.0,
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          30.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      AuthUserStreamWidget(
                                                                    builder: (context) =>
                                                                        FlutterFlowDropDown<
                                                                            String>(
                                                                      controller: _model
                                                                              .dropDownValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model.dropDownValue ??= valueOrDefault(
                                                                            currentUserDocument?.spot,
                                                                            ''),
                                                                      ),
                                                                      options: _model.checkusercalimaction ==
                                                                              'master'
                                                                          ? adminTimeTablePageNotificationRecord!
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
                                                                              currentUserDocument?.spot,
                                                                              ''))),
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.dropDownValue = val),
                                                                      width:
                                                                          150.0,
                                                                      height:
                                                                          40.0,
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
                                                                      hintText:
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                        'hk6omc6r' /* 지점선택 */,
                                                                      ),
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
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
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
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
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'ha10m6yi' /* 좌석번호 : */,
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
                                                                            FontWeight.w900,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  width: 30.0,
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
                                                                            .textController,
                                                                    focusNode:
                                                                        _model
                                                                            .textFieldFocusNode,
                                                                    onChanged: (_) =>
                                                                        EasyDebounce
                                                                            .debounce(
                                                                      '_model.textController',
                                                                      Duration(
                                                                          milliseconds:
                                                                              2000),
                                                                      () => safeSetState(
                                                                          () {}),
                                                                    ),
                                                                    autofocus:
                                                                        false,
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      isDense:
                                                                          true,
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
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0xFF151414),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      errorBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          UnderlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      hoverColor:
                                                                          Colors
                                                                              .black,
                                                                      suffixIcon: _model
                                                                              .textController!
                                                                              .text
                                                                              .isNotEmpty
                                                                          ? InkWell(
                                                                              onTap: () async {
                                                                                _model.textController?.clear();
                                                                                safeSetState(() {});
                                                                              },
                                                                              child: Icon(
                                                                                Icons.clear,
                                                                                color: Colors.black,
                                                                                size: 20.0,
                                                                              ),
                                                                            )
                                                                          : null,
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
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    maxLength:
                                                                        2,
                                                                    maxLengthEnforcement:
                                                                        MaxLengthEnforcement
                                                                            .enforced,
                                                                    buildCounter: (context,
                                                                            {required currentLength,
                                                                            required isFocused,
                                                                            maxLength}) =>
                                                                        null,
                                                                    cursorColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    validator: _model
                                                                        .textControllerValidator
                                                                        .asValidator(
                                                                            context),
                                                                    inputFormatters: [
                                                                      FilteringTextInputFormatter
                                                                          .allow(
                                                                              RegExp('[0-9]'))
                                                                    ],
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
                                                    alignment:
                                                        AlignmentDirectional(
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
                                                        _model.dddd =
                                                            await queryUsersRecordOnce(
                                                          queryBuilder:
                                                              (usersRecord) =>
                                                                  usersRecord
                                                                      .where(
                                                                        'seatNo',
                                                                        isEqualTo: int.tryParse(_model
                                                                            .textController
                                                                            .text),
                                                                      )
                                                                      .where(
                                                                        'spot',
                                                                        isEqualTo:
                                                                            _model.dropDownValue,
                                                                      )
                                                                      .where(
                                                                        'seatNo',
                                                                        isGreaterThan:
                                                                            0,
                                                                      ),
                                                        );

                                                        safeSetState(() {});
                                                      },
                                                      child: Icon(
                                                        Icons.cached,
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
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
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
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
                                                            Icons.person,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'uoquoty1' /* 이름 */,
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
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
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
                                                            Icons
                                                                .numbers_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                              'g7aob9j3' /* 좌석번호 */,
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
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 30.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
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
                                                            Icons.location_pin,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                              '58m5j8m5' /* 수정요청 */,
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
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 30.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
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
                                                            Icons.date_range,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
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
                                                              '0mq1fir5' /* 요청일자 */,
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
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
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
                                        child: Builder(
                                          builder: (context) {
                                            final usertimetable = _model.dddd
                                                    ?.sortedList(
                                                        keyOf: (e) => e.seatNo,
                                                        desc: false)
                                                    .toList() ??
                                                [];

                                            return ListView.separated(
                                              padding: EdgeInsets.fromLTRB(
                                                0,
                                                0,
                                                0,
                                                44.0,
                                              ),
                                              scrollDirection: Axis.vertical,
                                              itemCount: usertimetable.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 1.0),
                                              itemBuilder: (context,
                                                  usertimetableIndex) {
                                                final usertimetableItem =
                                                    usertimetable[
                                                        usertimetableIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.timetableNew =
                                                        usertimetableItem
                                                            .scheduleToChange;
                                                    _model.timetablenow =
                                                        usertimetableItem
                                                            .scheduleNow;
                                                    _model.usernow =
                                                        usertimetableItem;
                                                    _model.usernowName =
                                                        usertimetableItem
                                                            .displayName;
                                                    safeSetState(() {});
                                                    FFAppState().alertReason =
                                                        usertimetableItem
                                                            .displayName;
                                                    safeSetState(() {});
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 0.0,
                                                          color:
                                                              Color(0xFFE5E7EB),
                                                          offset: Offset(
                                                            0.0,
                                                            1.0,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  45.0,
                                                                  12.0,
                                                                  25.0,
                                                                  12.0),
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
                                                                    usertimetableItem
                                                                        .displayName,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.plusJakartaSans(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Color(0xFF15161E),
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyLarge
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        4.0)),
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
                                                                  usertimetableItem
                                                                      .seatNo
                                                                      .toString(),
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
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                                        -1.0,
                                                                        0.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    usertimetableItem
                                                                            .scheduleChangeRequest
                                                                        ? 'O(수정요청)'
                                                                        : 'X(정상상태)',
                                                                    'X(정상상태)',
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
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                                        -1.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      dateTimeFormat(
                                                                        "MM/dd hh:mm",
                                                                        usertimetableItem
                                                                            .scheduleRequestTime,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      'undefined',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.plusJakartaSans(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              Color(0xFF15161E),
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Container(
                              height: 1200.0,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: Container(
                                      width: 200.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          _model.manualChaneMode = true;
                                          safeSetState(() {});
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'sltp25ck' /* 시간표 수정 */,
                                        ),
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmallIsCustom,
                                              ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 1200.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        if (!_model.manualChaneMode)
                                          Container(
                                            width: 300.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'kdpyrpog' /* 현재시간표 */,
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
                                              ),
                                            ),
                                          ),
                                        Container(
                                          width: 200.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Visibility(
                                            visible: !_model.manualChaneMode,
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                var _shouldSetState = false;
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              content: Text(
                                                                  '${_model.timetableNew?.tablename}시간표를 승인하시겠습니까?'),
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
                                                if (!confirmDialogResponse) {
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }
                                                _model.apicall =
                                                    await TimetablechangerCall
                                                        .call(
                                                  weeklytimetableJson: functions
                                                      .convertTimetableToJson(
                                                          _model.timetableNew),
                                                  username: _model.usernowName,
                                                  spotSheetLink:
                                                      adminTimeTablePageNotificationRecord
                                                          ?.spotdatas
                                                          .where((e) =>
                                                              e.spot ==
                                                              _model
                                                                  .dropDownValue)
                                                          .toList()
                                                          .firstOrNull
                                                          ?.sheetRoot,
                                                );

                                                _shouldSetState = true;

                                                await _model.usernow!.reference
                                                    .update(
                                                        createUsersRecordData(
                                                  scheduleNow:
                                                      updateWeeklyTimeTableStruct(
                                                    _model.timetableNew,
                                                    clearUnsetFields: false,
                                                  ),
                                                  scheduleChangeRequest: false,
                                                ));
                                                _model.timetablenow =
                                                    _model.timetableNew;
                                                safeSetState(() {});
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content:
                                                          Text('승인이 완료되었습니다'),
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
                                                if ((_model
                                                        .apicall?.succeeded ??
                                                    true)) {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text((_model
                                                                    .apicall
                                                                    ?.jsonBody ??
                                                                '')
                                                            .toString()),
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
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        content: Text(
                                                            '학생정보검색에실패했습니다. 다시 시도해주세요.'),
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
                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                  return;
                                                }

                                                if (_shouldSetState)
                                                  safeSetState(() {});
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '16yigoix' /* 시간표 변경승인 */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmallIsCustom,
                                                        ),
                                                elevation: 0.0,
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 300.0,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'odl8z9ln' /* 변경요청시간표 */,
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
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 1420.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Builder(
                                              builder: (context) {
                                                if (!_model.manualChaneMode) {
                                                  return Container(
                                                    width: 820.0,
                                                    height: 1100.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                    ),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      child: custom_widgets
                                                          .WeeklyPlannerCapture(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        pickedData:
                                                            _model.timetablenow,
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  return Visibility(
                                                    visible:
                                                        _model.manualChaneMode,
                                                    child: Container(
                                                      width: 500.0,
                                                      height: 1100.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    2.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 100.0,
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
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      20.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          20.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      20.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      20.0),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        20.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          15.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'kkdlid1u' /* 시간표 수정 */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          fontSize:
                                                                              30.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          FlutterFlowRadioButton(
                                                                        options:
                                                                            [
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'zrggxxv0' /* 월 */,
                                                                          ),
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'fu2zj6z9' /* 화 */,
                                                                          ),
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'xv284ffl' /* 수 */,
                                                                          ),
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'pn3476ux' /* 목 */,
                                                                          ),
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'x2hwtzh3' /* 금 */,
                                                                          ),
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'oyz5w9zh' /* 토 */,
                                                                          ),
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '36q600yo' /* 일 */,
                                                                          )
                                                                        ].toList(),
                                                                        onChanged:
                                                                            (val) async {
                                                                          safeSetState(
                                                                              () {});
                                                                          safeSetState(
                                                                              () {
                                                                            _model.checkboxValue =
                                                                                valueOrDefault<bool>(
                                                                              () {
                                                                                if (_model.radioButtonValue == '월') {
                                                                                  return _model.timetableNew?.mon.nonExistingDate;
                                                                                } else if (_model.radioButtonValue == '화') {
                                                                                  return _model.timetableNew?.tue.nonExistingDate;
                                                                                } else if (_model.radioButtonValue == '수') {
                                                                                  return _model.timetableNew?.wed.nonExistingDate;
                                                                                } else if (_model.radioButtonValue == '목') {
                                                                                  return _model.timetableNew?.thu.nonExistingDate;
                                                                                } else if (_model.radioButtonValue == '금') {
                                                                                  return _model.timetableNew?.fri.nonExistingDate;
                                                                                } else if (_model.radioButtonValue == '토') {
                                                                                  return _model.timetableNew?.sat.nonExistingDate;
                                                                                } else if (_model.radioButtonValue == '일') {
                                                                                  return _model.timetableNew?.sun.nonExistingDate;
                                                                                } else {
                                                                                  return false;
                                                                                }
                                                                              }(),
                                                                              false,
                                                                            );
                                                                          });
                                                                        },
                                                                        controller: _model
                                                                            .radioButtonValueController ??= FormFieldController<
                                                                                String>(
                                                                            FFLocalizations.of(context).getText(
                                                                          'pytjxmun' /* 월 */,
                                                                        )),
                                                                        optionHeight:
                                                                            30.0,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                            ),
                                                                        buttonPosition:
                                                                            RadioButtonPosition.left,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        radioButtonColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        inactiveRadioButtonColor:
                                                                            FlutterFlowTheme.of(context).secondaryText,
                                                                        toggleable:
                                                                            false,
                                                                        horizontalAlignment:
                                                                            WrapAlignment.start,
                                                                        verticalAlignment:
                                                                            WrapCrossAlignment.start,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '7eeffcoi' /* 미등원요일 선택 */,
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
                                                                    Theme(
                                                                      data:
                                                                          ThemeData(
                                                                        checkboxTheme:
                                                                            CheckboxThemeData(
                                                                          visualDensity:
                                                                              VisualDensity.compact,
                                                                          materialTapTargetSize:
                                                                              MaterialTapTargetSize.shrinkWrap,
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
                                                                          ),
                                                                        ),
                                                                        unselectedWidgetColor:
                                                                            FlutterFlowTheme.of(context).alternate,
                                                                      ),
                                                                      child:
                                                                          Checkbox(
                                                                        value: _model.checkboxValue ??=
                                                                            valueOrDefault<bool>(
                                                                          () {
                                                                            if (_model.radioButtonValue ==
                                                                                '월') {
                                                                              return _model.timetableNew?.mon.nonExistingDate;
                                                                            } else if (_model.radioButtonValue ==
                                                                                '화') {
                                                                              return _model.timetableNew?.tue.nonExistingDate;
                                                                            } else if (_model.radioButtonValue ==
                                                                                '수') {
                                                                              return _model.timetableNew?.wed.nonExistingDate;
                                                                            } else if (_model.radioButtonValue ==
                                                                                '목') {
                                                                              return _model.timetableNew?.thu.nonExistingDate;
                                                                            } else if (_model.radioButtonValue ==
                                                                                '금') {
                                                                              return _model.timetableNew?.fri.nonExistingDate;
                                                                            } else if (_model.radioButtonValue ==
                                                                                '토') {
                                                                              return _model.timetableNew?.sat.nonExistingDate;
                                                                            } else if (_model.radioButtonValue ==
                                                                                '일') {
                                                                              return _model.timetableNew?.sun.nonExistingDate;
                                                                            } else {
                                                                              return false;
                                                                            }
                                                                          }(),
                                                                          false,
                                                                        ),
                                                                        onChanged:
                                                                            (newValue) async {
                                                                          safeSetState(() =>
                                                                              _model.checkboxValue = newValue!);
                                                                          if (newValue!) {
                                                                            if (_model.radioButtonValue ==
                                                                                '월') {
                                                                              _model.updateTimetableNewStruct(
                                                                                (e) => e
                                                                                  ..updateMon(
                                                                                    (e) => e..nonExistingDate = true,
                                                                                  ),
                                                                              );
                                                                              safeSetState(() {});
                                                                            } else if (_model.radioButtonValue ==
                                                                                '화') {
                                                                              _model.updateTimetableNewStruct(
                                                                                (e) => e
                                                                                  ..updateTue(
                                                                                    (e) => e..nonExistingDate = true,
                                                                                  ),
                                                                              );
                                                                              safeSetState(() {});
                                                                            } else if (_model.radioButtonValue ==
                                                                                '수') {
                                                                              _model.updateTimetableNewStruct(
                                                                                (e) => e
                                                                                  ..updateWed(
                                                                                    (e) => e..nonExistingDate = true,
                                                                                  ),
                                                                              );
                                                                              safeSetState(() {});
                                                                            } else if (_model.radioButtonValue ==
                                                                                '목') {
                                                                              _model.updateTimetableNewStruct(
                                                                                (e) => e
                                                                                  ..updateThu(
                                                                                    (e) => e..nonExistingDate = true,
                                                                                  ),
                                                                              );
                                                                              safeSetState(() {});
                                                                            } else if (_model.radioButtonValue ==
                                                                                '금') {
                                                                              _model.updateTimetableNewStruct(
                                                                                (e) => e
                                                                                  ..updateFri(
                                                                                    (e) => e..nonExistingDate = true,
                                                                                  ),
                                                                              );
                                                                              safeSetState(() {});
                                                                            } else if (_model.radioButtonValue ==
                                                                                '토') {
                                                                              _model.updateTimetableNewStruct(
                                                                                (e) => e
                                                                                  ..updateSat(
                                                                                    (e) => e..nonExistingDate = true,
                                                                                  ),
                                                                              );
                                                                              safeSetState(() {});
                                                                            } else if (_model.radioButtonValue ==
                                                                                '일') {
                                                                              _model.updateTimetableNewStruct(
                                                                                (e) => e
                                                                                  ..updateSun(
                                                                                    (e) => e..nonExistingDate = true,
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
                                                                          } else {
                                                                            if (_model.radioButtonValue ==
                                                                                '월') {
                                                                              _model.updateTimetableNewStruct(
                                                                                (e) => e
                                                                                  ..updateMon(
                                                                                    (e) => e..nonExistingDate = false,
                                                                                  ),
                                                                              );
                                                                              safeSetState(() {});
                                                                            } else if (_model.radioButtonValue ==
                                                                                '화') {
                                                                              _model.updateTimetableNewStruct(
                                                                                (e) => e
                                                                                  ..updateTue(
                                                                                    (e) => e..nonExistingDate = false,
                                                                                  ),
                                                                              );
                                                                              safeSetState(() {});
                                                                            } else if (_model.radioButtonValue ==
                                                                                '수') {
                                                                              _model.updateTimetableNewStruct(
                                                                                (e) => e
                                                                                  ..updateWed(
                                                                                    (e) => e..nonExistingDate = false,
                                                                                  ),
                                                                              );
                                                                              safeSetState(() {});
                                                                            } else if (_model.radioButtonValue ==
                                                                                '목') {
                                                                              _model.updateTimetableNewStruct(
                                                                                (e) => e
                                                                                  ..updateThu(
                                                                                    (e) => e..nonExistingDate = false,
                                                                                  ),
                                                                              );
                                                                              safeSetState(() {});
                                                                            } else if (_model.radioButtonValue ==
                                                                                '금') {
                                                                              _model.updateTimetableNewStruct(
                                                                                (e) => e
                                                                                  ..updateFri(
                                                                                    (e) => e..nonExistingDate = false,
                                                                                  ),
                                                                              );
                                                                              safeSetState(() {});
                                                                            } else if (_model.radioButtonValue ==
                                                                                '토') {
                                                                              _model.updateTimetableNewStruct(
                                                                                (e) => e
                                                                                  ..updateSat(
                                                                                    (e) => e..nonExistingDate = false,
                                                                                  ),
                                                                              );
                                                                              safeSetState(() {});
                                                                            } else if (_model.radioButtonValue ==
                                                                                '일') {
                                                                              _model.updateTimetableNewStruct(
                                                                                (e) => e
                                                                                  ..updateSun(
                                                                                    (e) => e..nonExistingDate = false,
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
                                                                          }
                                                                        },
                                                                        side: (FlutterFlowTheme.of(context).alternate !=
                                                                                null)
                                                                            ? BorderSide(
                                                                                width: 2,
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                              )
                                                                            : null,
                                                                        activeColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        checkColor:
                                                                            FlutterFlowTheme.of(context).info,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                if (_model
                                                                        .checkboxValue ==
                                                                    false)
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          's91totye' /* 등원시각 :  */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                      Builder(
                                                                        builder:
                                                                            (context) =>
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
                                                                            if (_model.checkboxValue!) {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('미등원요일입니다.'),
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
                                                                                      child: TimetablestartNaegongtimeWidget(
                                                                                        fixOrAdd: false,
                                                                                        mainindexpassed: 0,
                                                                                        fixStartTime: () {
                                                                                          if (_model.radioButtonValue == '월') {
                                                                                            return _model.timetableNew?.mon.naegongStartTime;
                                                                                          } else if (_model.radioButtonValue == '화') {
                                                                                            return _model.timetableNew?.tue.naegongStartTime;
                                                                                          } else if (_model.radioButtonValue == '수') {
                                                                                            return _model.timetableNew?.wed.naegongStartTime;
                                                                                          } else if (_model.radioButtonValue == '목') {
                                                                                            return _model.timetableNew?.thu.naegongStartTime;
                                                                                          } else if (_model.radioButtonValue == '금') {
                                                                                            return _model.timetableNew?.fri.naegongStartTime;
                                                                                          } else if (_model.radioButtonValue == '토') {
                                                                                            return _model.timetableNew?.sat.naegongStartTime;
                                                                                          } else if (_model.radioButtonValue == '일') {
                                                                                            return _model.timetableNew?.sun.naegongStartTime;
                                                                                          } else {
                                                                                            return getCurrentTimestamp;
                                                                                          }
                                                                                        }(),
                                                                                        fixEndTime: () {
                                                                                          if (_model.radioButtonValue == '월') {
                                                                                            return _model.timetableNew?.mon.naegongEndTime;
                                                                                          } else if (_model.radioButtonValue == '화') {
                                                                                            return _model.timetableNew?.tue.naegongEndTime;
                                                                                          } else if (_model.radioButtonValue == '수') {
                                                                                            return _model.timetableNew?.wed.naegongEndTime;
                                                                                          } else if (_model.radioButtonValue == '목') {
                                                                                            return _model.timetableNew?.thu.naegongEndTime;
                                                                                          } else if (_model.radioButtonValue == '금') {
                                                                                            return _model.timetableNew?.fri.naegongEndTime;
                                                                                          } else if (_model.radioButtonValue == '토') {
                                                                                            return _model.timetableNew?.sat.naegongEndTime;
                                                                                          } else if (_model.radioButtonValue == '일') {
                                                                                            return _model.timetableNew?.sun.naegongEndTime;
                                                                                          } else {
                                                                                            return getCurrentTimestamp;
                                                                                          }
                                                                                        }(),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => safeSetState(() => _model.naegongtime = value));

                                                                              if (_model.radioButtonValue == '월') {
                                                                                _model.updateTimetableNewStruct(
                                                                                  (e) => e
                                                                                    ..updateMon(
                                                                                      (e) => e
                                                                                        ..naegongStartTime = _model.naegongtime?.outingstarttime
                                                                                        ..naegongEndTime = _model.naegongtime?.outingendtime,
                                                                                    ),
                                                                                );
                                                                                safeSetState(() {});
                                                                              } else if (_model.radioButtonValue == '화') {
                                                                                _model.updateTimetableNewStruct(
                                                                                  (e) => e
                                                                                    ..updateTue(
                                                                                      (e) => e
                                                                                        ..naegongStartTime = _model.naegongtime?.outingstarttime
                                                                                        ..naegongEndTime = _model.naegongtime?.outingendtime,
                                                                                    ),
                                                                                );
                                                                                safeSetState(() {});
                                                                              } else if (_model.radioButtonValue == '수') {
                                                                                _model.updateTimetableNewStruct(
                                                                                  (e) => e
                                                                                    ..updateWed(
                                                                                      (e) => e
                                                                                        ..naegongStartTime = _model.naegongtime?.outingstarttime
                                                                                        ..naegongEndTime = _model.naegongtime?.outingendtime,
                                                                                    ),
                                                                                );
                                                                                safeSetState(() {});
                                                                              } else if (_model.radioButtonValue == '목') {
                                                                                _model.updateTimetableNewStruct(
                                                                                  (e) => e
                                                                                    ..updateThu(
                                                                                      (e) => e
                                                                                        ..naegongStartTime = _model.naegongtime?.outingstarttime
                                                                                        ..naegongEndTime = _model.naegongtime?.outingendtime,
                                                                                    ),
                                                                                );
                                                                                safeSetState(() {});
                                                                              } else if (_model.radioButtonValue == '금') {
                                                                                _model.updateTimetableNewStruct(
                                                                                  (e) => e
                                                                                    ..updateFri(
                                                                                      (e) => e
                                                                                        ..naegongStartTime = _model.naegongtime?.outingstarttime
                                                                                        ..naegongEndTime = _model.naegongtime?.outingendtime,
                                                                                    ),
                                                                                );
                                                                                safeSetState(() {});
                                                                              } else if (_model.radioButtonValue == '토') {
                                                                                _model.updateTimetableNewStruct(
                                                                                  (e) => e
                                                                                    ..updateSat(
                                                                                      (e) => e
                                                                                        ..naegongStartTime = _model.naegongtime?.outingstarttime
                                                                                        ..naegongEndTime = _model.naegongtime?.outingendtime,
                                                                                    ),
                                                                                );
                                                                                safeSetState(() {});
                                                                              } else if (_model.radioButtonValue == '일') {
                                                                                _model.updateTimetableNewStruct(
                                                                                  (e) => e
                                                                                    ..updateSun(
                                                                                      (e) => e
                                                                                        ..naegongStartTime = _model.naegongtime?.outingstarttime
                                                                                        ..naegongEndTime = _model.naegongtime?.outingendtime,
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
                                                                            }

                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            _model.checkboxValue!
                                                                                ? '미등원요일'
                                                                                : valueOrDefault<String>(
                                                                                    dateTimeFormat(
                                                                                      "jm",
                                                                                      () {
                                                                                        if (_model.radioButtonValue == '월') {
                                                                                          return _model.timetableNew?.mon.naegongStartTime;
                                                                                        } else if (_model.radioButtonValue == '화') {
                                                                                          return _model.timetableNew?.tue.naegongStartTime;
                                                                                        } else if (_model.radioButtonValue == '수') {
                                                                                          return _model.timetableNew?.wed.naegongStartTime;
                                                                                        } else if (_model.radioButtonValue == '목') {
                                                                                          return _model.timetableNew?.thu.naegongStartTime;
                                                                                        } else if (_model.radioButtonValue == '금') {
                                                                                          return _model.timetableNew?.fri.naegongStartTime;
                                                                                        } else if (_model.radioButtonValue == '토') {
                                                                                          return _model.timetableNew?.sat.naegongStartTime;
                                                                                        } else if (_model.radioButtonValue == '일') {
                                                                                          return _model.timetableNew?.sun.naegongStartTime;
                                                                                        } else {
                                                                                          return _model.timetableNew?.mon.naegongStartTime;
                                                                                        }
                                                                                      }(),
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ),
                                                                                    '등원시간을 선택해봅시다',
                                                                                  ),
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
                                                                if (_model
                                                                        .checkboxValue ==
                                                                    false)
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          's6tsnu8i' /* 하원시각 :  */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                      Builder(
                                                                        builder:
                                                                            (context) =>
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
                                                                            if (_model.checkboxValue!) {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('미등원요일입니다.'),
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
                                                                                      child: TimetablestartNaegongtimeWidget(
                                                                                        fixOrAdd: false,
                                                                                        mainindexpassed: 0,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => safeSetState(() => _model.naegongtimeCopy = value));

                                                                              if (_model.radioButtonValue == '월') {
                                                                                _model.updateTimetableNewStruct(
                                                                                  (e) => e
                                                                                    ..updateMon(
                                                                                      (e) => e
                                                                                        ..naegongStartTime = _model.naegongtimeCopy?.outingstarttime
                                                                                        ..naegongEndTime = _model.naegongtimeCopy?.outingendtime,
                                                                                    ),
                                                                                );
                                                                                safeSetState(() {});
                                                                              } else if (_model.radioButtonValue == '화') {
                                                                                _model.updateTimetableNewStruct(
                                                                                  (e) => e
                                                                                    ..updateTue(
                                                                                      (e) => e
                                                                                        ..naegongStartTime = _model.naegongtimeCopy?.outingstarttime
                                                                                        ..naegongEndTime = _model.naegongtimeCopy?.outingendtime,
                                                                                    ),
                                                                                );
                                                                                safeSetState(() {});
                                                                              } else if (_model.radioButtonValue == '수') {
                                                                                _model.updateTimetableNewStruct(
                                                                                  (e) => e
                                                                                    ..updateWed(
                                                                                      (e) => e
                                                                                        ..naegongStartTime = _model.naegongtimeCopy?.outingstarttime
                                                                                        ..naegongEndTime = _model.naegongtimeCopy?.outingendtime,
                                                                                    ),
                                                                                );
                                                                                safeSetState(() {});
                                                                              } else if (_model.radioButtonValue == '목') {
                                                                                _model.updateTimetableNewStruct(
                                                                                  (e) => e
                                                                                    ..updateThu(
                                                                                      (e) => e
                                                                                        ..naegongStartTime = _model.naegongtimeCopy?.outingstarttime
                                                                                        ..naegongEndTime = _model.naegongtimeCopy?.outingendtime,
                                                                                    ),
                                                                                );
                                                                                safeSetState(() {});
                                                                              } else if (_model.radioButtonValue == '금') {
                                                                                _model.updateTimetableNewStruct(
                                                                                  (e) => e
                                                                                    ..updateFri(
                                                                                      (e) => e
                                                                                        ..naegongStartTime = _model.naegongtimeCopy?.outingstarttime
                                                                                        ..naegongEndTime = _model.naegongtimeCopy?.outingendtime,
                                                                                    ),
                                                                                );
                                                                                safeSetState(() {});
                                                                              } else if (_model.radioButtonValue == '토') {
                                                                                _model.updateTimetableNewStruct(
                                                                                  (e) => e
                                                                                    ..updateSat(
                                                                                      (e) => e
                                                                                        ..naegongStartTime = _model.naegongtimeCopy?.outingstarttime
                                                                                        ..naegongEndTime = _model.naegongtimeCopy?.outingendtime,
                                                                                    ),
                                                                                );
                                                                                safeSetState(() {});
                                                                              } else if (_model.radioButtonValue == '일') {
                                                                                _model.updateTimetableNewStruct(
                                                                                  (e) => e
                                                                                    ..updateSun(
                                                                                      (e) => e
                                                                                        ..naegongStartTime = _model.naegongtimeCopy?.outingstarttime
                                                                                        ..naegongEndTime = _model.naegongtimeCopy?.outingendtime,
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
                                                                            }

                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            _model.checkboxValue!
                                                                                ? '미등원요일'
                                                                                : valueOrDefault<String>(
                                                                                    dateTimeFormat(
                                                                                      "jm",
                                                                                      () {
                                                                                        if (_model.radioButtonValue == '월') {
                                                                                          return _model.timetableNew?.mon.naegongEndTime;
                                                                                        } else if (_model.radioButtonValue == '화') {
                                                                                          return _model.timetableNew?.tue.naegongEndTime;
                                                                                        } else if (_model.radioButtonValue == '수') {
                                                                                          return _model.timetableNew?.wed.naegongEndTime;
                                                                                        } else if (_model.radioButtonValue == '목') {
                                                                                          return _model.timetableNew?.thu.naegongEndTime;
                                                                                        } else if (_model.radioButtonValue == '금') {
                                                                                          return _model.timetableNew?.fri.naegongEndTime;
                                                                                        } else if (_model.radioButtonValue == '토') {
                                                                                          return _model.timetableNew?.sat.naegongEndTime;
                                                                                        } else if (_model.radioButtonValue == '일') {
                                                                                          return _model.timetableNew?.sun.naegongEndTime;
                                                                                        } else {
                                                                                          return _model.timetableNew?.mon.naegongEndTime;
                                                                                        }
                                                                                      }(),
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ),
                                                                                    '하원시간을 선택해봅시다',
                                                                                  ),
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
                                                                Divider(
                                                                  thickness:
                                                                      2.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'b8j54r7x' /* 외출관리 */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  fontSize: 20.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              valueOrDefault<double>(
                                                                            valueOrDefault<double>(
                                                                                  () {
                                                                                    if (_model.radioButtonValue == '월') {
                                                                                      return _model.timetableNew?.mon.dailyoutingList.length.toDouble();
                                                                                    } else if (_model.radioButtonValue == '화') {
                                                                                      return _model.timetableNew?.tue.dailyoutingList.length.toDouble();
                                                                                    } else if (_model.radioButtonValue == '수') {
                                                                                      return _model.timetableNew?.wed.dailyoutingList.length.toDouble();
                                                                                    } else if (_model.radioButtonValue == '목') {
                                                                                      return _model.timetableNew?.thu.dailyoutingList.length.toDouble();
                                                                                    } else if (_model.radioButtonValue == '금') {
                                                                                      return _model.timetableNew?.fri.dailyoutingList.length.toDouble();
                                                                                    } else if (_model.radioButtonValue == '토') {
                                                                                      return _model.timetableNew?.sat.dailyoutingList.length.toDouble();
                                                                                    } else if (_model.radioButtonValue == '일') {
                                                                                      return _model.timetableNew?.sun.dailyoutingList.length.toDouble();
                                                                                    } else {
                                                                                      return 0.02;
                                                                                    }
                                                                                  }(),
                                                                                  0.02,
                                                                                ) *
                                                                                50,
                                                                            20.0,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final outingListEach = () {
                                                                                    if (_model.radioButtonValue == '월') {
                                                                                      return _model.timetableNew?.mon.dailyoutingList;
                                                                                    } else if (_model.radioButtonValue == '화') {
                                                                                      return _model.timetableNew?.tue.dailyoutingList;
                                                                                    } else if (_model.radioButtonValue == '수') {
                                                                                      return _model.timetableNew?.wed.dailyoutingList;
                                                                                    } else if (_model.radioButtonValue == '목') {
                                                                                      return _model.timetableNew?.thu.dailyoutingList;
                                                                                    } else if (_model.radioButtonValue == '금') {
                                                                                      return _model.timetableNew?.fri.dailyoutingList;
                                                                                    } else if (_model.radioButtonValue == '토') {
                                                                                      return _model.timetableNew?.sat.dailyoutingList;
                                                                                    } else if (_model.radioButtonValue == '일') {
                                                                                      return _model.timetableNew?.sun.dailyoutingList;
                                                                                    } else {
                                                                                      return _model.timetableNew?.mon.dailyoutingList;
                                                                                    }
                                                                                  }()
                                                                                      ?.toList() ??
                                                                                  [];

                                                                              return ListView.builder(
                                                                                padding: EdgeInsets.zero,
                                                                                scrollDirection: Axis.vertical,
                                                                                itemCount: outingListEach.length,
                                                                                itemBuilder: (context, outingListEachIndex) {
                                                                                  final outingListEachItem = outingListEach[outingListEachIndex];
                                                                                  return Container(
                                                                                    width: 500.0,
                                                                                    height: 50.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                outingListEachItem.reason,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      fontSize: 18.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                    ),
                                                                                              ),
                                                                                              RichText(
                                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                                text: TextSpan(
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
                                                                                                        '7gvh667o' /*  ~  */,
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
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Flexible(
                                                                                            child: Align(
                                                                                              alignment: AlignmentDirectional(1.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                children: [
                                                                                                  Flexible(
                                                                                                    child: Align(
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
                                                                                                                      child: TimetablestartAdminSetWidget(
                                                                                                                        fixOrAdd: true,
                                                                                                                        mainindexpassed: -5,
                                                                                                                        fixstring: outingListEachItem.reason,
                                                                                                                        fixStartTime: outingListEachItem.outingstarttime,
                                                                                                                        fixEndTime: outingListEachItem.outingendtime,
                                                                                                                        fixColor: outingListEachItem.color,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              ).then((value) => safeSetState(() => _model.aaa = value));

                                                                                                              if (_model.radioButtonValue == '월') {
                                                                                                                _model.updateTimetableNewStruct(
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
                                                                                                                _model.updateTimetableNewStruct(
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
                                                                                                                _model.updateTimetableNewStruct(
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
                                                                                                                _model.updateTimetableNewStruct(
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
                                                                                                                _model.updateTimetableNewStruct(
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
                                                                                                                _model.updateTimetableNewStruct(
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
                                                                                                                _model.updateTimetableNewStruct(
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
                                                                                                    child: InkWell(
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
                                                                                                          _model.updateTimetableNewStruct(
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
                                                                                                          _model.updateTimetableNewStruct(
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
                                                                                                          _model.updateTimetableNewStruct(
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
                                                                                                          _model.updateTimetableNewStruct(
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
                                                                                                          _model.updateTimetableNewStruct(
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
                                                                                                          _model.updateTimetableNewStruct(
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
                                                                                                          _model.updateTimetableNewStruct(
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
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Builder(
                                                                              builder: (context) => InkWell(
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
                                                                                          child: TimetablestartAdminSetWidget(
                                                                                            fixOrAdd: false,
                                                                                            mainindexpassed: -5,
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => safeSetState(() => _model.bbb = value));

                                                                                  if (_model.radioButtonValue == '월') {
                                                                                    _model.updateTimetableNewStruct(
                                                                                      (e) => e
                                                                                        ..updateMon(
                                                                                          (e) => e
                                                                                            ..updateDailyoutingList(
                                                                                              (e) => e.add(_model.bbb!),
                                                                                            ),
                                                                                        ),
                                                                                    );
                                                                                    safeSetState(() {});
                                                                                  } else if (_model.radioButtonValue == '화') {
                                                                                    _model.updateTimetableNewStruct(
                                                                                      (e) => e
                                                                                        ..updateTue(
                                                                                          (e) => e
                                                                                            ..updateDailyoutingList(
                                                                                              (e) => e.add(_model.bbb!),
                                                                                            ),
                                                                                        ),
                                                                                    );
                                                                                    safeSetState(() {});
                                                                                  } else if (_model.radioButtonValue == '수') {
                                                                                    _model.updateTimetableNewStruct(
                                                                                      (e) => e
                                                                                        ..updateWed(
                                                                                          (e) => e
                                                                                            ..updateDailyoutingList(
                                                                                              (e) => e.add(_model.bbb!),
                                                                                            ),
                                                                                        ),
                                                                                    );
                                                                                    safeSetState(() {});
                                                                                  } else if (_model.radioButtonValue == '목') {
                                                                                    _model.updateTimetableNewStruct(
                                                                                      (e) => e
                                                                                        ..updateThu(
                                                                                          (e) => e
                                                                                            ..updateDailyoutingList(
                                                                                              (e) => e.add(_model.bbb!),
                                                                                            ),
                                                                                        ),
                                                                                    );
                                                                                    safeSetState(() {});
                                                                                  } else if (_model.radioButtonValue == '금') {
                                                                                    _model.updateTimetableNewStruct(
                                                                                      (e) => e
                                                                                        ..updateFri(
                                                                                          (e) => e
                                                                                            ..updateDailyoutingList(
                                                                                              (e) => e.add(_model.bbb!),
                                                                                            ),
                                                                                        ),
                                                                                    );
                                                                                    safeSetState(() {});
                                                                                  } else if (_model.radioButtonValue == '토') {
                                                                                    _model.updateTimetableNewStruct(
                                                                                      (e) => e
                                                                                        ..updateSat(
                                                                                          (e) => e
                                                                                            ..updateDailyoutingList(
                                                                                              (e) => e.add(_model.bbb!),
                                                                                            ),
                                                                                        ),
                                                                                    );
                                                                                    safeSetState(() {});
                                                                                  } else if (_model.radioButtonValue == '일') {
                                                                                    _model.updateTimetableNewStruct(
                                                                                      (e) => e
                                                                                        ..updateSun(
                                                                                          (e) => e
                                                                                            ..updateDailyoutingList(
                                                                                              (e) => e.add(_model.bbb!),
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
                                                                                  Icons.add_circle_outline,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
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
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.95),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            30.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            var confirmDialogResponse = await showDialog<bool>(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      content: Text('시간표 변동사항을 반영하시겠습니까?'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                          child: Text('아니요'),
                                                                                        ),
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                          child: Text('네'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                ) ??
                                                                                false;
                                                                            if (confirmDialogResponse) {
                                                                              await _model.usernow!.reference.update(createUsersRecordData(
                                                                                scheduleToChange: updateWeeklyTimeTableStruct(
                                                                                  _model.timetableNew,
                                                                                  clearUnsetFields: true,
                                                                                ),
                                                                              ));
                                                                              _model.manualChaneMode = false;
                                                                              safeSetState(() {});
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    content: Text('수정이 완료되었습니다. 새로고침하여 확인하세요.'),
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
                                                                              return;
                                                                            }
                                                                          },
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'cfbu765v' /*  저장 */,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                45.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                16.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  color: Colors.white,
                                                                                  fontSize: 20.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                ),
                                                                            elevation:
                                                                                0.0,
                                                                            borderRadius:
                                                                                BorderRadius.circular(16.0),
                                                                          ),
                                                                        ),
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            var confirmDialogResponse = await showDialog<bool>(
                                                                                  context: context,
                                                                                  builder: (alertDialogContext) {
                                                                                    return AlertDialog(
                                                                                      title: Text('취소'),
                                                                                      content: Text('시간표 제작/수정을 그만두고 돌아가시겠습니까?'),
                                                                                      actions: [
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                          child: Text('아니오'),
                                                                                        ),
                                                                                        TextButton(
                                                                                          onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                          child: Text('예'),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                ) ??
                                                                                false;
                                                                            if (confirmDialogResponse) {
                                                                              _model.manualChaneMode = false;
                                                                              safeSetState(() {});
                                                                            } else {
                                                                              return;
                                                                            }
                                                                          },
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'gggtxa3s' /* 취소 */,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                45.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                16.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                  color: Colors.white,
                                                                                  fontSize: 20.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                ),
                                                                            elevation:
                                                                                0.0,
                                                                            borderRadius:
                                                                                BorderRadius.circular(16.0),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      15.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              width: 830.0,
                                              height: 1100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                child: custom_widgets
                                                    .WeeklyPlannerCapture(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  pickedData:
                                                      _model.timetableNew,
                                                ),
                                              ),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
