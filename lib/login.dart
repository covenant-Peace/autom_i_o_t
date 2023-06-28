// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'constants.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  FocusNode focusNode = FocusNode();
  FocusNode focusNode1 = FocusNode();
  bool isSeen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
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
              'Sign up',
              style: kText1,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
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
                  obscureText: !isSeen?true:false,
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
                  ), onPressed: () {
                    setState(() {
                      isSeen = !isSeen;
                    });
                },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
