import 'dart:ui';

import 'package:facebook_design_clone/Screens/admin/admin_dashboard.dart';
import 'package:facebook_design_clone/Screens/admin/manage_users.dart';
import 'package:facebook_design_clone/Screens/admin/reports.dart';
import 'package:facebook_design_clone/Screens/admin/settings.dart';

import 'package:facebook_design_clone/Screens/booking/booking.dart';
import 'package:facebook_design_clone/Screens/hall/hall.dart';
import 'package:facebook_design_clone/Screens/home/home.dart';
import 'package:facebook_design_clone/Screens/user/user.dart';

import 'package:facebook_design_clone/core/models/role.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MainScreen extends StatefulWidget {
  final UserRole role;

  const MainScreen({
    super.key,
    required this.role,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final ScrollController scrollController =
      ScrollController();

  bool showNavbar = true;

  late final List<Map<String, dynamic>> navItems;

  @override
  void initState() {
    super.initState();

    /// USER NAVIGATION
    if (widget.role == UserRole.user) {

      navItems = [

        {
          "label": "Home",
          "icon": Icons.home,
          "screen": Home(
            scrollController: scrollController,
          ),
        },

        {
          "label": "Booking",
          "icon": Icons.calendar_month,
          "screen": Booking(),
        },

        {
          "label": "Hall",
          "icon": Icons.meeting_room,
          "screen": Hall(),
        },

        {
          "label": "Profile",
          "icon": Icons.person,
          "screen": User(),
        },
      ];

    }

    /// ADMIN NAVIGATION
    else {

      navItems = [

        {
          "label": "Dashboard",
          "icon": Icons.dashboard,
          "screen": AdminDashboard(),
        },

        {
          "label": "Users",
          "icon": Icons.people,
          "screen": ManageUsers(),
        },

        {
          "label": "Reports",
          "icon": Icons.analytics,
          "screen": Reports(),
        },

        {
          "label": "Settings",
          "icon": Icons.settings,
          "screen": AdminSettings(),
        },
      ];
    }

    /// NAVBAR HIDE / SHOW
    scrollController.addListener(() {

      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {

        if (showNavbar) {

          setState(() {
            showNavbar = false;
          });
        }

      } else {

        if (!showNavbar) {

          setState(() {
            showNavbar = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,

      /// SCREENS
      body: IndexedStack(
        index: currentIndex,

        children:
            navItems
                .map(
                  (item) => item["screen"] as Widget,
                )
                .toList(),
      ),

      /// GLASS NAVBAR
      bottomNavigationBar: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: showNavbar ? 1 : 0,

        child: AnimatedSlide(
          duration: const Duration(milliseconds: 300),

          offset:
              showNavbar
                  ? Offset.zero
                  : const Offset(0, 1),

          child: Padding(
            padding: const EdgeInsets.all(15),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),

              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 25,
                  sigmaY: 25,
                ),

                child: Container(
                  height: 70,

                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),

                    borderRadius:
                        BorderRadius.circular(30),

                    border: Border.all(
                      color:
                          Colors.white.withOpacity(0.2),
                    ),

                    boxShadow: [

                      BoxShadow(
                        color:
                            Colors.black.withOpacity(0.1),

                        blurRadius: 20,
                        spreadRadius: 1,
                      ),
                    ],
                  ),

                  child: BottomNavigationBar(
                    backgroundColor:
                        Colors.transparent,

                    elevation: 0,

                    type:
                        BottomNavigationBarType.fixed,

                    currentIndex: currentIndex,

                    selectedItemColor:
                        Colors.blue,

                    unselectedItemColor:
                        Colors.white70,

                    showSelectedLabels: true,

                    showUnselectedLabels: false,

                    onTap: (index) {

                      setState(() {
                        currentIndex = index;
                      });
                    },

                    items:
                        navItems.map((item) {

                          return BottomNavigationBarItem(
                            icon: Icon(item["icon"]),
                            label: item["label"],
                          );

                        }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}