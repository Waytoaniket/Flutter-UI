import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;

class InformationCard extends StatelessWidget {
  final int? voting;
  final String? name;
  final String? genere;
  final String? director;
  final String? starts;
  final String? imageUrl;
  const InformationCard(
      {Key? key,
      this.director,
      this.genere,
      this.name,
      this.starts,
      this.voting,
      this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.6),
              offset: const Offset(4, 4),
              blurRadius: 16,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Transform.rotate(
                      angle: math.pi / 2,
                      child: Icon(
                        Icons.arrow_left,
                        size: 15.w,
                      ),
                    ),
                    Text(voting != null ? voting.toString() : '0'),
                    Transform.rotate(
                      angle: -math.pi / 2,
                      child: Icon(
                        Icons.arrow_left,
                        size: 15.w,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                    child: Image.network(
                      imageUrl!,
                      height: 12.h,
                      width: 20.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name!,
                        style: GoogleFonts.aBeeZee(
                          color: Colors.black,
                          fontSize: 15.sp,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Genere: ",
                            style: GoogleFonts.aBeeZee(
                              color: Colors.black,
                              fontSize: 8.sp,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              genere!,
                              style: GoogleFonts.aBeeZee(
                                color: Colors.black,
                                fontSize: 8.sp,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Director: ",
                            style: GoogleFonts.aBeeZee(
                              color: Colors.black,
                              fontSize: 8.sp,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              director!,
                              style: GoogleFonts.aBeeZee(
                                color: Colors.black,
                                fontSize: 8.sp,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Stars: ",
                            style: GoogleFonts.aBeeZee(
                              color: Colors.black,
                              fontSize: 8.sp,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              starts!,
                              style: GoogleFonts.aBeeZee(
                                color: Colors.black,
                                fontSize: 8.sp,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(1.h),
              child: Container(
                height: 5.h,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.6),
                      offset: const Offset(4, 4),
                      blurRadius: 16,
                    ),
                  ],
                ),
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Watch Trailer",
                    style: GoogleFonts.aBeeZee(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
