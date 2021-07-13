import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housy/Screens/Drawer/widgets/drawer_list_tile.dart';
import 'package:sizer/sizer.dart';

class DrawerData extends StatelessWidget {
  const DrawerData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF66B2FF),
      body: Padding(
        padding: EdgeInsets.all(5.w),
        child: Column(
          children: [
            Container(
              height: 30.h,
              // color: Colors.amber,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.w),
                    child: Image.network(
                      "https://picsum.photos/250?image=9",
                      height: 15.w,
                      width: 15.w,
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    "Aniket Gupta",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  drawerListTile("Payments", Icons.payment),
                  SizedBox(
                    height: 8.w,
                  ),
                  drawerListTile("Discounts", Icons.favorite),
                  SizedBox(
                    height: 8.w,
                  ),
                  drawerListTile("Notifications", Icons.notifications),
                  SizedBox(
                    height: 8.w,
                  ),
                  drawerListTile("Orders", Icons.list),
                  SizedBox(
                    height: 8.w,
                  ),
                  drawerListTile("Help", Icons.help),
                  SizedBox(
                    height: 8.w,
                  ),
                ],
              ),
            ),
            drawerListTile("Settings", Icons.settings),
            SizedBox(
              height: 4.w,
            ),
            drawerListTile("Support", Icons.support_agent),
            SizedBox(
              height: 4.w,
            ),
          ],
        ),
      ),
    );
  }
}
