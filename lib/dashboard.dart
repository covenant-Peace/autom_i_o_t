import 'package:flutter/material.dart';

import 'constants.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
        padding: const EdgeInsets.only(top: 40, ),
        child: Column(
         children: const [
           Center(child: Text('Smart Light', style: kText7,))
         ],
        ),
      ),
    );
  }
}
