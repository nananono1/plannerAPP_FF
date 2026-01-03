import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'sign_pad_component_model.dart';
export 'sign_pad_component_model.dart';

class SignPadComponentWidget extends StatefulWidget {
  const SignPadComponentWidget({
    super.key,
    int? type,
  }) : this.type = type ?? 0;

  final int type;

  @override
  State<SignPadComponentWidget> createState() => _SignPadComponentWidgetState();
}

class _SignPadComponentWidgetState extends State<SignPadComponentWidget> {
  late SignPadComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignPadComponentModel());

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
      width: 800.0,
      height: 500.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              width: 795.05,
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
                            '9lvqd1w5' /* 서명을 입력해주세요 */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
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
                        height: 500.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        child: ClipRect(
                          child: Signature(
                            controller: _model.signatureController ??=
                                SignatureController(
                              penStrokeWidth: 2.0,
                              penColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              exportBackgroundColor: Colors.white,
                            ),
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            width: 700.0,
                            height: 350.0,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              final signatureImage = await _model
                                  .signatureController!
                                  .toPngBytes(height: 350, width: 700);
                              if (signatureImage == null) {
                                showUploadMessage(
                                  context,
                                  'Signature is empty.',
                                );
                                return;
                              }
                              showUploadMessage(
                                context,
                                'Uploading signature...',
                                showLoading: true,
                              );
                              final downloadUrl = (await uploadData(
                                  getSignatureStoragePath(), signatureImage));

                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              if (downloadUrl != null) {
                                safeSetState(() =>
                                    _model.uploadedSignatureUrl = downloadUrl);
                                showUploadMessage(
                                  context,
                                  'Success!',
                                );
                              } else {
                                showUploadMessage(
                                  context,
                                  'Failed to upload signature.',
                                );
                                return;
                              }

                              if (widget.type == 1) {
                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  studyDetails: createStudyDetailsStruct(
                                    signature1: _model.uploadedSignatureUrl,
                                    clearUnsetFields: false,
                                  ),
                                ));
                              } else if (widget.type == 2) {
                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  studyDetails: createStudyDetailsStruct(
                                    signature2: _model.uploadedSignatureUrl,
                                    clearUnsetFields: false,
                                  ),
                                ));
                              } else if (widget.type == 3) {
                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  studyDetails: createStudyDetailsStruct(
                                    signature3: _model.uploadedSignatureUrl,
                                    clearUnsetFields: false,
                                  ),
                                ));
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('오류'),
                                      content: Text('다시 시도해주세요'),
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
                              }

                              Navigator.pop(context);
                            },
                            text: FFLocalizations.of(context).getText(
                              'jovyweum' /* 저장 */,
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
                                '1loaw93d' /* 취소 */,
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
