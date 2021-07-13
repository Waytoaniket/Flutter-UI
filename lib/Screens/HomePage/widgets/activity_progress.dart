import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';

Widget activityProgress(Color color, double percentage, String percentageText,
      String text, String subText) {
    return Container(
      height: 26.h,
      width: 20.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(10.w),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 16.h,
            alignment: Alignment.center,
            child: CircularPercentIndicator(
              radius: 20.w,
              lineWidth: 2.w,
              animation: true,
              percent: percentage,
              center: new Text(
                percentageText,
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10.sp,
                    color: Colors.white),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.white,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 4.w, left: 5.w, right: 5.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: GoogleFonts.aBeeZee(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    subText,
                    style: GoogleFonts.aBeeZee(
                      fontSize: 10.sp,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }