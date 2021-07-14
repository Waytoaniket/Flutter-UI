import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Widget drawerListTile(String text, IconData icon, bool selected) {
  return Container(
    color: selected ? Colors.white : Colors.transparent,
    padding: EdgeInsets.symmetric(vertical: 1.h),
    child: Row(
      children: [
        Icon(
          icon,
          color: selected ? Colors.blue : Colors.white,
          size: 10.w,
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          text,
          style: GoogleFonts.aBeeZee(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: selected ? Colors.blue : Colors.white),
        ),
      ],
    ),
  );
}
