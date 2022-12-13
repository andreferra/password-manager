import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:password_manager/page/Home/homa_page.dart';

const apiKey = 'AIzaSyC4P6Skpl1eTB30826L8GiP5BoFLoCu6hc';
const projectId = 'passwordmanager-a461f';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firestore.initialize(projectId);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PegasusSecret',
      home: HomePage(),
    );
  }
}
