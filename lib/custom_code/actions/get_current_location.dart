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

// Import required package
import 'package:geolocator/geolocator.dart';

// Function to get the current location as LatLng
Future<LatLng?> getCurrentLocation() async {
  // Check if location services are enabled
  if (!await Geolocator.isLocationServiceEnabled()) {
    throw Exception('위치 서비스가 비활성화되었습니다.');
  }

  // Check and request location permissions
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw Exception('위치 권한이 거부되었습니다.');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    throw Exception('위치 권한이 영구적으로 거부되었습니다.');
  }

  try {
    // Get the current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Return position as LatLng
    return LatLng(position.latitude, position.longitude);
  } catch (e) {
    throw Exception('현재 위치를 가져오는 데 실패했습니다: $e');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
