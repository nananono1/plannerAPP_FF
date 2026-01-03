// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:just_audio/just_audio.dart';

import 'package:firebase_database/firebase_database.dart';

Future<void> setupChildAddedListenerAtPage(String branchName) async {
  final DatabaseReference ref =
      FirebaseDatabase.instance.ref('calls/$branchName');

  // AudioPlayer 인스턴스 생성
  final AudioPlayer audioPlayer = AudioPlayer();

  ref.onChildAdded.listen((DatabaseEvent event) async {
    if (event.snapshot.exists) {
      try {
        final Map<String, dynamic> data =
            Map<String, dynamic>.from(event.snapshot.value as Map);

        final String callReason = data['callreason'] ?? "Unknown";
        final String seatNo = data['seatno'] ?? "Unknown";

        // AppState 업데이트 및 UI 리빌드
        FFAppState().update(() {
          FFAppState().alertReason = callReason;
          FFAppState().alertNumber = seatNo;
        });

        // 소리 재생
        if (audioPlayer.playing) {
          await audioPlayer.stop(); // 이미 재생 중이면 중단
        }
        await audioPlayer
            .setAsset('assets/audios/notification_sound.wav'); // 파일 설정
        await audioPlayer.play(); // 재생
        print("Notification sound played successfully.");
      } catch (e) {
        print("Error processing data: $e");
      }
    }
  });
}
