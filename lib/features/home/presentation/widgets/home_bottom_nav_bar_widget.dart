import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/features/cart/presentation/view/cart_view.dart';
import 'package:dalel/features/home/presentation/view/home_view.dart';
import 'package:dalel/features/profile/presentation/views/profile_view.dart';
import 'package:dalel/features/search/presentation/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

PersistentTabController _controller = PersistentTabController();

class HomeeBottomNavBarWidget extends StatelessWidget {
  const HomeeBottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),
      controller: _controller,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      navBarStyle: NavBarStyle.style12,
      backgroundColor: AppColors.primaryColor,
    );
  }
}

List<Widget> _buildScreens() {
  return [
    const HomeView(),
    const CartView(),
    const SearchView(),
    const ProfileView()
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.imagesActivehome),
        inactiveIcon: SvgPicture.asset(Assets.imagesHome)),
    PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.imagesActivecart),
        inactiveIcon: SvgPicture.asset(Assets.imagesCart)),
    PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.imagesActivesearch),
        inactiveIcon: SvgPicture.asset(Assets.imagesSearch)),
    PersistentBottomNavBarItem(
        icon: SvgPicture.asset(Assets.imagesActiveprofile),
        inactiveIcon: SvgPicture.asset(Assets.imagesProfile)),
  ];
}
