import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAe9NNrjMJt_NYcr4dBfuHJhZd9Lo4ZJ6w",
            authDomain: "naegong-student-qgbwcp.firebaseapp.com",
            projectId: "naegong-student-qgbwcp",
            storageBucket: "naegong-student-qgbwcp.appspot.com",
            messagingSenderId: "259674060192",
            appId: "1:259674060192:web:dbf11bc439ae854c2ee0c5",
            measurementId: "G-E8VG26GHJ1"));
  } else {
    await Firebase.initializeApp();
  }
}
