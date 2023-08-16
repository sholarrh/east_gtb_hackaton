

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../../../core/constant.dart';
import 'homepage.dart';
import 'nav_bar_items.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {

  void onItemTapped(int index) {
    selectedIndex = index;
  }

   int selectedIndex = 0;
   final PersistentTabController tabBarController = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const Products(),
      const Payments(),
      const Transfers(),
      const Investments(),
    ];
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        inactiveIcon: const Icon(Iconsax.home5,size: 20,),
        icon: const Icon( Iconsax.home5,size: 20,
        ),
        title: "Home",
        textStyle: const TextStyle(
            fontSize: 12,
            //fontFamily: FontFamily.outfitRegular
        ),
        activeColorPrimary: Palette.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        inactiveIcon: const Icon(Iconsax.receipt_2_1,size: 20,),
        icon: const Icon(Iconsax.receipt_2_1,size: 20,),
        title: "Products",
        textStyle: const TextStyle(
            fontSize: 12,
            //fontFamily: FontFamily.outfitRegular
        ),
        activeColorPrimary: Palette.primaryColor,
        inactiveColorPrimary: Colors.grey,

      ),
      PersistentBottomNavBarItem(
        inactiveIcon: const Icon(Iconsax.cards,size: 20,),
        icon:  const Icon(Iconsax.cards,size: 20,),
        title: "Payments",
        textStyle: const TextStyle(
            fontSize: 12,
           // fontFamily: FontFamily.outfitRegular
        ),
        activeColorPrimary: Palette.primaryColor,
        inactiveColorPrimary: Colors.grey,

      ),
      PersistentBottomNavBarItem(
        inactiveIcon: const Icon(Iconsax.profile_add,size: 20,),
        icon: const Icon(Iconsax.profile_add,size: 20,),
        title: "Transfers",
        textStyle: const TextStyle(
            fontSize: 12,
            //fontFamily: FontFamily.outfitRegular
        ),
        activeColorPrimary: Palette.primaryColor,
        inactiveColorPrimary: Colors.grey,

      ),
      PersistentBottomNavBarItem(
        inactiveIcon: const Icon(Iconsax.profile_add,size: 20,),
        icon: const Icon(Iconsax.profile_add,size: 20,),
        title: "Investments",
        textStyle: const TextStyle(
          fontSize: 12,
          //fontFamily: FontFamily.outfitRegular
        ),
        activeColorPrimary: Palette.primaryColor,
        inactiveColorPrimary: Colors.grey,

      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // var data = Provider.of<BottomBarNav>(context);
    return PersistentTabView(
      context,
      navBarHeight: 70,
      padding: const NavBarPadding.only(
        top: 15,
        bottom: 15,
      ),
      controller: tabBarController,
      onItemSelected:  onItemTapped,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Palette.whiteColor,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: false,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      popAllScreensOnTapOfSelectedTab: false,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties:
      const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}