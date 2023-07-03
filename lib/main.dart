import 'package:autom_i_o_t/dashboard.dart';
import 'package:autom_i_o_t/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool isSignedIn = false;
    // jhsbdhb(){
    //   FirebaseAuth.instance
    //       .authStateChanges()
    //       .listen((User? user) {
    //     if (user == null) {
    //       isSignedIn = false;
    //       print('User is currently signed out!');
    //     } else {
    //       isSignedIn = true;
    //       print('User is signed in!');
    //     }
    //   });
    // }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        primarySwatch: Colors.blue,
      ),
      home: !isSignedIn ? const CreateAccount() : const Dashboard(),
    );
  }
}
