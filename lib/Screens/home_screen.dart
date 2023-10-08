import 'package:demo_app_with_intigration/pages/screen1.dart';
import 'package:demo_app_with_intigration/pages/screen2.dart';
import 'package:demo_app_with_intigration/widgets/consts/const_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class ApodURL {
  static String apodimg = '';
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController? _animationController;
  late AnimationController? _onBoardingAnimController;

  late TabController _tabController;

  late SMIBool _menuBtn;

  final List<Widget> _screens = [
    const ScreenOne(),
    const ScreenTwo(),
  ];

  final springDesc = const SpringDescription(
    mass: 0.1,
    stiffness: 40,
    damping: 5,
  );

  void onMenuPress() {
    if (_menuBtn.value) {
      final springAnim = SpringSimulation(springDesc, 0, 1, 0);
      _animationController?.animateWith(springAnim);
    } else {
      _animationController?.reverse();
    }
    _menuBtn.change(!_menuBtn.value);

    SystemChrome.setSystemUIOverlayStyle(_menuBtn.value
        ? SystemUiOverlayStyle.dark
        : SystemUiOverlayStyle.light);
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _onBoardingAnimController?.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: TabBar(
        dividerColor: Colors.white,
        splashBorderRadius: BorderRadius.circular(40),
        indicatorColor: Colors.white,
        labelColor: Colors.white,
        indicatorPadding: const EdgeInsets.only(bottom: 6),
        indicatorSize: TabBarIndicatorSize.label,
        unselectedLabelColor: Colors.white60,
        physics: const BouncingScrollPhysics(),
        controller: _tabController,
        tabs: [
          Tab(
            child: buildSticker(image: image4),
          ),
          Tab(
            child: buildSticker(image: image5),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.normal,
        ),
        children: _screens,
      ),
    );
  }
}
