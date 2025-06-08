import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'rest_info_fix_model.dart';
export 'rest_info_fix_model.dart';

class RestInfoFixWidget extends StatefulWidget {
  const RestInfoFixWidget({
    super.key,
    this.mm,
    required this.listNo,
    String? subNamePassToFix,
    String? objectPassToFix,
    required this.inputListIndex,
  })  : this.subNamePassToFix = subNamePassToFix ?? '과목명',
        this.objectPassToFix = objectPassToFix ?? '공부내용';

  final PlannerInputStruct? mm;
  final int? listNo;
  final String subNamePassToFix;
  final String objectPassToFix;
  final int? inputListIndex;

  @override
  State<RestInfoFixWidget> createState() => _RestInfoFixWidgetState();
}

class _RestInfoFixWidgetState extends State<RestInfoFixWidget> {
  late RestInfoFixModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RestInfoFixModel());

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
        borderRadius: BorderRadius.circular(20.0),
      ),
      alignment: AlignmentDirectional(0.0, 0.0),
    );
  }
}
