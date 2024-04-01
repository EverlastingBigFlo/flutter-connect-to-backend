import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    var _color;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dashboard'),
      ),
      body: Column(
        children: [
          AnimatedContainer(
 duration: Duration(seconds: 2),
 color: _color,
 curve: Curves.fastOutSlowIn,
 height: 200,
 width: 200,
),
Inkwell(
 child: Text('Change Color'),
 onPressed: (){
   setState((){
     _color= Colors.red;
   });
 },
),
        ],
      ),
    );
  }
}
