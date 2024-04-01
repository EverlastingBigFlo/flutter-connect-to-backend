import 'package:connectingtobackend/uti/dashboard_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Device.orientation == Orientation.portrait
                ? FirstContainerWidget(
                    height: 30.5.h,
                  )
                : FirstContainerWidget(height: 35.5.h)
          ],
        ),
      );
    });
  }
}
