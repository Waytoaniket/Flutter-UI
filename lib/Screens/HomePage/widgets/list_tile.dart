import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';


Widget listTile(String text, String subText, Color color, IconData icon) {
    return Row(
      children: [
        Container(
          height: 12.w,
          width: 12.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: GoogleFonts.aBeeZee(
                    fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                subText,
                style: GoogleFonts.aBeeZee(
                  fontSize: 10.sp,
                  color: Colors.grey[800],
                ),
              )
            ],
          ),
        )
      ],
    );
  }