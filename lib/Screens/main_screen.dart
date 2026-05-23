import 'package:facebook_design_clone/Screens/booking/booking.dart';
import 'package:facebook_design_clone/Screens/hall/hall.dart';
import 'package:facebook_design_clone/Screens/home/home.dart';
import 'package:facebook_design_clone/Screens/user/user.dart';
import 'package:facebook_design_clone/core/models/role.dart';
import 'package:facebook_design_clone/widgets/admin_fab_menu/admin_fab_menu.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';

class MainScreen extends StatefulWidget {
  final UserRole role;
  const MainScreen({super.key, required this.role});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int currentIndex = 0;
  final ScrollController scrollController = ScrollController();
  bool showNavbar = true;

  bool get _isAdmin => widget.role == UserRole.admin;

  // ── NO late final, just plain fields initialized directly ─────────────
  late final List<Widget> _adminPages;
  late final List<Widget> _userPages;

  @override
  void initState() {
    super.initState();

    // initialize once, fixed — no getter, no rebuild issue
    _adminPages = [
      Home(scrollController: scrollController), // 0
      Booking(),                                // 1
      Hall(),                                   // 2
      User(),                                   // 3
    ];

    _userPages = [
      Home(scrollController: scrollController), // 0
      Booking(),                                // 1
                                    // 2
      User(),                                   // 3
    ];

    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (showNavbar) setState(() { showNavbar = false; });
      } else {
        if (!showNavbar) setState(() { showNavbar = true; });
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

    // 👇 decide pages and item count here, inside build, fresh every rebuild
    final List<Widget> currentPages = _isAdmin ? _adminPages : _userPages;
    final int itemCount = _isAdmin ? _adminPages.length : _userPages.length;

    // safety clamp — prevents index out of range when switching roles
    if (currentIndex >= itemCount) {
      currentIndex = 0;
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: !_isAdmin,

      body: Stack(
        children: [

          IndexedStack(
            index: currentIndex,
            children: currentPages, // 👈 uses local variable, not a getter
          ),

          if (_isAdmin)
            Positioned(
              left: 20,
              bottom: 30,
              child: AdminFabMenu(
                onItemTap: (index) {
                  const fabToPage = [2, 3, 1, 0];
                  setState(() {
                    currentIndex = fabToPage[index];
                  });
                },
              ),
            ),

        ],
      ),

      bottomNavigationBar: _isAdmin ? null : AnimatedSlide(
        duration: const Duration(milliseconds: 300),
        offset: showNavbar ? Offset.zero : const Offset(0, 1),

        child: Padding(
          padding: const EdgeInsets.all(15),

          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),

            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),

              child: Container(
                height: 70,

                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),

                child: BottomNavigationBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: currentIndex,
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.lightBlue,

                  onTap: (index) {
                    setState(() { currentIndex = index; });
                  },

                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.calendar_month),
                      label: "Booking",
                    ),
                   
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: "User",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}