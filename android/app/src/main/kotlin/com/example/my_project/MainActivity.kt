package com.naegongstudy.app // ✅ Flutter 앱 패키지명(당신이 제공한 값)

import android.content.Intent // 브로드캐스트 Intent 생성에 필요
import io.flutter.embedding.android.FlutterActivity // Flutter 기본 Activity (V2 embedding)
import io.flutter.embedding.engine.FlutterEngine // MethodChannel 연결을 위한 FlutterEngine
import io.flutter.plugin.common.MethodChannel // MethodChannel 구현에 필요

class MainActivity : FlutterActivity() { // Flutter 앱 메인 Activity

    companion object { // 상수들을 한 곳에 모아 관리(오타 방지)
        private const val CHANNEL = "com.naegongstudy.app/bridge" // ✅ Dart(MethodChannel)와 동일해야 함
        private const val METHOD_SEND = "sendStudentInfoToManage" // ✅ Dart invokeMethod 이름과 동일해야 함

        private const val ACTION_STUDENT_INFO = "com.naegong.ACTION_STUDENT_INFO" // ✅ Manage가 받을 Broadcast action

        private const val MANAGE_PACKAGE = "com.naegong.manage" // ⚠️ Manage 앱 실제 패키지명으로 맞춰야 함

        private const val EXTRA_DISPLAY_NAME = "display_name" // 학생명 extra 키
        private const val EXTRA_SEAT_NO = "seatNo" // 좌석번호 extra 키
        private const val EXTRA_SPOT = "spot" // 지점 extra 키
        private const val EXTRA_SCHOOL = "school" // 학교 extra 키
        private const val EXTRA_SCHEDULE_JSON = "scheduleNowJson" // scheduleNow JSON extra 키
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) { // FlutterEngine이 준비되면 호출됨
        super.configureFlutterEngine(flutterEngine) // 기본 설정 유지(플러터 플러그인 정상 등록)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL) // Dart ↔ Android 통신 채널 생성
            .setMethodCallHandler { call, result -> // Dart에서 invokeMethod가 오면 여기로 들어옴

                if (call.method == METHOD_SEND) { // Dart에서 보낸 method 이름이 우리가 처리할 것인지 확인

                    try { // ✅ 네이티브 쪽 예외가 나도 Dart로 정확히 실패를 돌려주기 위해 try/catch

                        val displayName = call.argument<String>(EXTRA_DISPLAY_NAME) ?: "" // 학생명 파라미터(없으면 빈값)
                        val seatNo = call.argument<String>(EXTRA_SEAT_NO) ?: "" // 좌석번호 파라미터(없으면 빈값)
                        val spot = call.argument<String>(EXTRA_SPOT) ?: "" // 지점 파라미터(없으면 빈값)
                        val school = call.argument<String>(EXTRA_SCHOOL) ?: "" // 학교 파라미터(없으면 빈값)
                        val scheduleNowJson = call.argument<String>(EXTRA_SCHEDULE_JSON) ?: "" // 스케줄 JSON(없으면 빈값)

                        val intent = Intent(ACTION_STUDENT_INFO) // Manage 앱이 받을 액션으로 Intent 생성
                        intent.setPackage(MANAGE_PACKAGE) // ✅ Manage 앱에게만 보내기(명시적 브로드캐스트)
                        intent.putExtra(EXTRA_DISPLAY_NAME, displayName) // extra: 학생명
                        intent.putExtra(EXTRA_SEAT_NO, seatNo) // extra: 좌석번호
                        intent.putExtra(EXTRA_SPOT, spot) // extra: 지점
                        intent.putExtra(EXTRA_SCHOOL, school) // extra: 학교
                        intent.putExtra(EXTRA_SCHEDULE_JSON, scheduleNowJson) // extra: scheduleNow JSON

                        sendBroadcast(intent) // ✅ 실제 브로드캐스트 전송(Manage 앱이 수신)

                        result.success(true) // ✅ Dart 쪽에 성공 반환

                    } catch (e: Exception) { // ✅ 실패 시
                        result.error("BROADCAST_FAILED", e.message, null) // Dart 쪽에서 PlatformException으로 받음
                    }

                } else { // 우리가 처리할 메서드가 아니면
                    result.notImplemented() // Dart 쪽에 "구현되지 않음" 반환
                }
            }
    }
}
