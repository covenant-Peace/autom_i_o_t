// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:autom_i_o_t/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'constants.dart';
import 'constraints.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FocusNode focusNode = FocusNode();
  FocusNode focusNode1 = FocusNode();
  bool isSeen = false;

  bool showSpinner = false;
  final textMail = TextEditingController();
  final textPassword = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.black45.withBlue(20),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          top: Constraint().getHeight(context, 50),
          left: Constraint().getHeight(context, 30),
          right: Constraint().getHeight(context, 30),
        ),
        child: Column(
          children: [
            Text(
              'AutomIoT',
              style: kText4,
            )
                .animate()
                .fadeIn() // uses `Animate.defaultDuration`
                .scale(
                    curve: Curves.elasticIn,
                    duration: 1000.ms) // inherits duration from fadeIn
                .move(
                    delay: 300.ms,
                    duration: 600.ms) // runs after the above w/new duration
                .shimmer()
                .then(duration: 1000.ms)
                .shake()
                .color(
                  blendMode: BlendMode.overlay,
                  begin: Colors.black26,
                  end: Colors.black,
                  curve: Curves.easeIn,
                ),
            SizedBox(
              height: Constraint().getHeight(context, 50),
            ),
            Text(
              'Log in',
              style: kText1,
            ),
            SizedBox(
              height: Constraint().getHeight(context, 80),
            ),
            Container(
              margin: EdgeInsets.only(left: Constraint().getWidth(context, 20)),
              decoration: BoxDecoration(
                boxShadow: [
                  !focusNode1.hasFocus
                      ? BoxShadow(
                          color: Colors.grey,
                          blurRadius: 15,
                          blurStyle: BlurStyle.outer,
                        )
                      : BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          blurStyle: BlurStyle.outer,
                        )
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 20,
                ),
                title: TextField(
                  decoration: InputDecoration(
                    hintText: 'automiot@email.com',
                    hintStyle: kText2,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  focusNode: focusNode,
                  controller: textMail,
                  // textInputAction: TextInputAction.n,
                  mouseCursor: MouseCursor.uncontrolled,
                  style: kText3,
                  onTap: () {
                    setState(() {
                      focusNode.requestFocus();
                      focusNode1.unfocus();
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: Constraint().getHeight(context, 40),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  focusNode1.hasFocus
                      ? BoxShadow(
                          color: Colors.grey,
                          blurRadius: 15,
                          blurStyle: BlurStyle.outer,
                        )
                      : BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          blurStyle: BlurStyle.outer,
                        )
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.lock,
                  color: Colors.white,
                  size: 20,
                ),
                title: TextField(
                  decoration: InputDecoration(
                    hintText: '******',
                    hintStyle: kText2,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  mouseCursor: MouseCursor.uncontrolled,
                  style: kText3,
                  controller: textPassword,
                  focusNode: focusNode1,
                  obscureText: !isSeen ? true : false,
                  onTap: () {
                    setState(() {
                      focusNode1.requestFocus();
                      focusNode.unfocus();
                    });
                  },
                ),
                trailing: IconButton(
                  icon: Icon(
                    isSeen ? Icons.remove_red_eye : Icons.visibility_off,
                    color: isSeen ? Colors.white : Colors.grey,
                    size: 18,
                  ),
                  onPressed: () {
                    setState(() {
                      isSeen = !isSeen;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: Constraint().getHeight(context, 10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Constraint().getWidth(context, 5),
                ),
                Text(
                  'Forgot Password?',
                  style: kText6,
                ),
              ],
            ),
            SizedBox(
              height: Constraint().getHeight(context, 40),
            ),
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () async {
                // final progress = ProgressHUD.of(ctx);
                // progress?.showWithText('Automating.....');
                setState(() {
                  showSpinner = true;
                  //   text.text.isEmpty ? validate = false : validate = true;
                });
                UserCredential? newUser;
                // if (validate == true) {
                if (textPassword.text.isNotEmpty && textMail.text.isNotEmpty) {
                  try {
                    // signIn();

                    newUser = await _auth.signInWithEmailAndPassword(
                        email: textMail.text.trim(),
                        password: textPassword.text.trim());
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(e.toString().trim()),
                      duration: Duration(seconds: 6),
                    ));
                    setState(() {
                      showSpinner = false;
                    });
                    // }
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Please input your email and password'),
                    duration: Duration(seconds: 6),
                  ));
                }
                if (newUser!.user!.email!.isNotEmpty) {
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder: (
                        BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                      ) {
                        return Dashboard();
                      },
                      transitionsBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          Widget child) {
                        return Align(
                          child: FadeTransition(
                            opacity: animation,
                            child: child,
                          ),
                        );
                      },
                    ),
                  );
                }
                // progress?.dispose();
                setState(() {
                  showSpinner = false;
                });
              },
              child: Container(
                margin: EdgeInsets.only(
                  left: Constraint().getWidth(context, 50),
                  right: Constraint().getWidth(context, 50),
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10,
                        blurStyle: BlurStyle.outer,
                        offset: Offset.fromDirection(
                          20,
                        )
                        // spreadRadius: 10,
                        )
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12,
                ),
                constraints: BoxConstraints(
                  minWidth: Constraint().getWidth(context, 100),
                  minHeight: Constraint().getHeight(context, 60),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Log in',
                  style: kText5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
