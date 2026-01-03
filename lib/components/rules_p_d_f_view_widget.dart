import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'rules_p_d_f_view_model.dart';
export 'rules_p_d_f_view_model.dart';

class RulesPDFViewWidget extends StatefulWidget {
  const RulesPDFViewWidget({super.key});

  @override
  State<RulesPDFViewWidget> createState() => _RulesPDFViewWidgetState();
}

class _RulesPDFViewWidgetState extends State<RulesPDFViewWidget> {
  late RulesPDFViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RulesPDFViewModel());

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
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: FlutterFlowPdfViewer(
        assetPath: 'assets/pdfs/TalkFile_nagong_rulebook.pdf',
        width: double.infinity,
        height: double.infinity,
        horizontalScroll: false,
      ),
    );
  }
}
