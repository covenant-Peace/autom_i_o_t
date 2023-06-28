// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FocusNode focusNode = FocusNode();
  FocusNode focusNode1 = FocusNode();
  bool isSeen = false;

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
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.black45.withBlue(20),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 50,
          left: 30,
          right: 30,
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
              height: 50,
            ),
            Text(
              'Log in',
              style: kText1,
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
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
                    hintText: 'Olubunmi Peace',
                    hintStyle: kText2,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.text,
                  focusNode: focusNode,
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
              height: 40,
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
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 5,),
                Text('Forgot Password?', style: kText6,),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(left: 50, right: 50),
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
              constraints: BoxConstraints(minWidth: 100, minHeight: 40),
              alignment: Alignment.center,
              child: Text(
                'Log in',
                style: kText5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
