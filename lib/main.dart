import 'package:flutter/material.dart';
import 'package:tarealaboratorio11/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBOLZ7M43KeLQIgfth7_-gr7Q7f3VDLBAY",
      appId: "1:1009162670643:android:35ac018eaeca5b1f374946",
      messagingSenderId: "1009162670643",
      projectId: "autenticacion-flutter-c3980",
    ),
  );

  runApp(MyApp());
}
