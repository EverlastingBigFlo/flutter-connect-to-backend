import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FirstContainerWidget extends StatelessWidget {
  final double height;
  // final double width;
  const FirstContainerWidget({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      // width: width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF8A8AD5),
              Color(0xFF8771C9),
            ],
          ),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0))),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('Get Verified',
                          style: GoogleFonts.concertOne(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22.sp,
                                color: Colors.grey[400]),
                          )),
                      const Icon(
                        Icons.verified,
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.supervised_user_circle,
                      size: 28,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Virtual Mobile - No Sim - Get Verify',
                  style: TextStyle(color: Color(0xFF3d3d54)),
                ))
          ],
        ),
      ),
    );
  }
}
