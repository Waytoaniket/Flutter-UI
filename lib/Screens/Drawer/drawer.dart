import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:housy/Screens/Drawer/widgets/drawer_list_tile.dart';
import 'package:housy/Screens/NavigationPage/navigation.dart';
import 'package:sizer/sizer.dart';

class DrawerData extends StatelessWidget {
  final Function? callback;
  final DrawerIndex? drawerIndex;
  const DrawerData({Key? key, this.callback, this.drawerIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF66B2FF),
      body: Padding(
        padding: EdgeInsets.all(5.w),
        child: Column(
          children: [
            Container(
              height: 28.h,
              // color: Colors.amber,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.w),
                    child: Image.asset(
                      'assets/images/noprofile.png',
                      height: 15.w,
                      width: 15.w,
                      fit: BoxFit.cover,
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
                  InkWell(
                    onTap: () {
                      callback!(DrawerIndex.HOME);
                    },
                    child: drawerListTile(
                      "Home",
                      Icons.home,
                      DrawerIndex.HOME == drawerIndex,
                    ),
                  ),
                  SizedBox(
                    height: 4.w,
                  ),
                  InkWell(
                    onTap: () {
                      callback!(DrawerIndex.Info);
                    },
                    child: drawerListTile(
                      "Company Info",
                      Icons.info,
                      DrawerIndex.Info == drawerIndex,
                    ),
                  ),
                  SizedBox(
                    height: 4.w,
                  ),
                  drawerListTile("Notifications", Icons.notifications, false),
                  SizedBox(
                    height: 4.w,
                  ),
                  drawerListTile("Orders", Icons.list, false),
                  SizedBox(
                    height: 4.w,
                  ),
                  drawerListTile("Help", Icons.help, false),
                  SizedBox(
                    height: 4.w,
                  ),
                ],
              ),
            ),
            drawerListTile("Settings", Icons.settings, false),
            SizedBox(
              height: 4.w,
            ),
            drawerListTile("Support", Icons.support_agent, false),
            SizedBox(
              height: 4.w,
            ),
          ],
        ),
      ),
    );
  }
}
