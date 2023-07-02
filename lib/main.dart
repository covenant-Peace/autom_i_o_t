import 'package:autom_i_o_t/dashboard.dart';
import 'package:autom_i_o_t/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    jhsbdhb(){
      FirebaseAuth.instance
          .authStateChanges()
          .listen((User? user) {
        if (user == null) {
          isSignedIn = false;
          print('User is currently signed out!');
        } else {
          isSignedIn = true;
          print('User is signed in!');
        }
      });
    }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: !isSignedIn?
        const CreateAccount(): const Dashboard(),

    );
  }
}
