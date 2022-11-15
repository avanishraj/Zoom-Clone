import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:people/Screens/homeScreen.dart';
import 'package:people/resources/auth_methods.dart';
import 'Screens/login.dart';
import 'Screens/video_call_screen.dart';
import 'firebase_options.dart';
import 'utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      initialRoute: 'login',
      routes: {
        'login': (context) => const LoginPage(),
        'homeScreen': (context) => const HomeScreen(),
        'videoCall' : (context) => const VideoCallPage()
      },
      home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return const HomeScreen();
          }
          return const LoginPage();
        },
      ),
    );
  }
}
