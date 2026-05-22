import 'package:flutter/material.dart';

import 'package:facebook_design_clone/Screens/booking/booking.dart';
import 'package:facebook_design_clone/Screens/home/home.dart';
import 'package:facebook_design_clone/Screens/user/user.dart';

import 'package:facebook_design_clone/core/models/nav_item_model.dart';

class NavConfig {

  static List<NavItemModel> getUserNav({
    required ScrollController scrollController,
  }) {

    return [

      NavItemModel(
        label: "Home",
        icon: Icons.home,
        screen: Home(
          scrollController: scrollController,
        ),
      ),

      NavItemModel(
        label: "Booking",
        icon: Icons.calendar_month,
        screen: Booking(),
      ),

      NavItemModel(
        label: "Profile",
        icon: Icons.person,
        screen: User(),
      ),
    ];
  }
}