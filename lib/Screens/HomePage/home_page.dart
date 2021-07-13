import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:housy/Screens/HomePage/widgets/activity_progress.dart';
import 'package:housy/Screens/HomePage/widgets/appbar.dart';
import 'package:housy/Screens/HomePage/widgets/list_tile.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  static const String id = 'HomePage';
  final Function? callback;
  final AnimationController? animationController;

  const HomePage({Key? key, this.callback, this.animationController})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  // final GlobalKey<Scaffold> _scaffold = GlobalKey();
  AnimationController? _textAnimationController;

  @override
  void initState() {
    super.initState();
    _textAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _textAnimationController!.forward();
    _scrollController.addListener(() {
      _textAnimationController!.animateTo(10 - _scrollController.offset);
    });
  }

  @override
  void dispose() {
    _textAnimationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF3E8),
      appBar: appbar(context, widget.animationController!, widget.callback!),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowGlow();
            return true;
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Container(
                  height: 19.h,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFB266),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.w),
                      bottomRight: Radius.circular(10.w),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: Container(
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(17.w),
                                child: Image.network(
                                  "https://picsum.photos/250?image=9",
                                  height: 17.w,
                                  width: 17.w,
                                ),
                              ),
                              Container(
                                height: 20.w,
                                width: 20.w,
                                child: CircularProgressIndicator(
                                    color: Colors.red),
                              )
                            ],
                          ),
                          Expanded(
                            child: AnimatedBuilder(
                              animation: _textAnimationController!,
                              builder: (context, child) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Transform(
                                      alignment: Alignment.center,
                                      transform: Matrix4.identity()
                                        ..scale(
                                          1 +
                                              (_textAnimationController!.value *
                                                  0.3),
                                        ),
                                      child: Text(
                                        "Aniket Gupta",
                                        style: GoogleFonts.aBeeZee(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.w,
                                    ),
                                    Transform(
                                      alignment: Alignment.center,
                                      transform: Matrix4.identity()
                                        ..scale(
                                          1 +
                                              (_textAnimationController!.value *
                                                  0.3),
                                        ),
                                      child: Text(
                                        "App Developer",
                                        style: GoogleFonts.aBeeZee(
                                          color: Colors.grey[800],
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "My Task",
                          style: GoogleFonts.aBeeZee(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: 12.w,
                        width: 12.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF009999),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.calendar_today,
                          ),
                          color: Colors.white,
                          tooltip: 'Calendar',
                          onPressed: () {
                            getDate();
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.w),
                  child: listTile("To Do", "5 task now. 1 started",
                      Color(0xFFFF3333), Icons.access_alarm),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.w),
                  child: InkWell(
                    onTap: () {
                      _scrollController.animateTo(40.h,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                    child: listTile(
                      "In Progress",
                      "1 task now. 1 started",
                      Color(0xFFCCCC00),
                      Icons.dashboard,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.w),
                  child: listTile("Done", "18 task now. 13 started",
                      Color(0xFF6666FF), Icons.done),
                ),
                Padding(
                  padding: EdgeInsets.all(4.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Active Projects",
                      style: GoogleFonts.aBeeZee(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          activityProgress(
                            Color(0xFF009999),
                            0.25,
                            "25.0%",
                            "Medical App",
                            "9 hours progress",
                          ),
                          activityProgress(
                            Color(0xFFFF3333),
                            0.6,
                            "60.0%",
                            "Making History Notes",
                            "20 hours progress",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          activityProgress(
                            Color(0xFFCCCC00),
                            0.25,
                            "25.0%",
                            "Medical App",
                            "9 hours progress",
                          ),
                          activityProgress(
                            Color(0xFF6666FF),
                            0.6,
                            "60.0%",
                            "Making History Notes",
                            "20 hours progress",
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  getDate() {
    Future<DateTime?> selectedDate = showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ),
      lastDate: DateTime(DateTime.now().year + 1),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: Color(0xFFCC6600),
              onPrimary: Color(0xFFFFF3E8),
              surface: Color(0xFFFF9933),
              onSurface: Color(0xFFFFF3E8),
            ),
            dialogBackgroundColor: Color(0xFFFFB266),
          ),
          child: child!,
        );
      },
    );
  }
}
